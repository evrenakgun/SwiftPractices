//
//  ViewController.swift
//  TestMap
//
//  Created by Evren Akgün on 30.01.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var informationTextField: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    // Konumla ilgili olayları ele almamıza yarayan bir obje.
    var locationManager = CLLocationManager()
    
    var selectedName = ""
    var selectedId : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    // Haritada bir yer işaretlemek için annotation kullanıyoruz.
    let annotation = MKPointAnnotation()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Basılı tutma işlemi için Long Press Gesture Recognizer tanımladık.
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        
        // İşaretli yere tıkladığında bildirim ekranı çıkmasını sağla *******
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapToPlace(tapGestureRecognizer:)))
        
        // mapView içine jestimizi ekledik.
        mapView.addGestureRecognizer(gestureRecognizer)
        mapView.addGestureRecognizer(tapGestureRecognizer)
        
        // Basılı tutma işleminin süresini belirledik.(2 saniye basılı tutulunca algılayacak)
        gestureRecognizer.minimumPressDuration = 2
        
        if selectedName != "" {
            // Core Data'dan verileri çek
            informationTextField.text = ""
            if let uuidString = self.selectedId?.uuidString {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let results = try self.context.fetch(fetchRequest)
                    
                    if results.count > 0 {
                        for result in results as! [NSManagedObject] {
                            if let name = result.value(forKey: "name") as? String {
                                annotationTitle = name
                                
                                if let note = result.value(forKey: "note") as? String {
                                    annotationSubtitle = note
                                    
                                    if let latitude = result.value(forKey: "latitude") as? Double {
                                        annotationLatitude = latitude
                                        
                                        if let longitude = result.value(forKey: "longitude") as? Double {
                                            annotationLongitude = longitude
                                            
                                            self.annotation.title = annotationTitle
                                            self.annotation.subtitle = annotationSubtitle
                                            
                                            let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                            self.annotation.coordinate = coordinate
                                            
                                            mapView.addAnnotation(self.annotation)
                                            
                                            locationManager.stopUpdatingLocation()
                                            
                                            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
                                            let region = MKCoordinateRegion(center: coordinate, span: span)
                                            
                                            mapView.setRegion(region, animated: true)
                                        }
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print("hata")
                }
                
            }
        } else {
            
        }
    }
    
    @objc func tapToPlace(tapGestureRecognizer : UITapGestureRecognizer) {
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil {
            
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = .red
            
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
            
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.selectedName != "" {
            var requestLocation = CLLocation(latitude: annotationLatitude, longitude: annotationLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarkArray, hata) in
                if let placemarks = placemarkArray {
                    if placemarks.count > 0 {
                        let newPlacemark = MKPlacemark(placemark: placemarks[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        
                        item.name = self.annotationTitle
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                        item.openInMaps(launchOptions: launchOptions)
                    }
                }
                
            }
        }
    }
    
    // Basılı tutma işlemimizin objc metodu.
    @objc func chooseLocation(gestureRecognizer : UILongPressGestureRecognizer) {
        // Basılı tutma işlemi başladı mı sorgusuyla işlemi başlatıyoruz.
        if gestureRecognizer.state == .began {
            // Seçilen noktanın bilgisini mapView içinden alıyoruz.
            let pressedLocation = gestureRecognizer.location(in: mapView)
            // Convert metodu yardımıyla seçilen noktanın kordinatlarını alıyoruz.
            let pressedCoordinate = mapView.convert(pressedLocation, toCoordinateFrom: mapView)
            
            self.annotation.coordinate = pressedCoordinate
            
            // Pop-up window
            let alertController = UIAlertController(title: "Yeni yer ekleyin.", message: "Eklemek istediğiniz yerin adını ve notunuzu giriniz.", preferredStyle: UIAlertController.Style.alert)
            // TextFields
            alertController.addTextField { (textField) in
                textField.placeholder = "Mekan Adı"
            }
            alertController.addTextField { (textField) in
                textField.placeholder = "Mekan Açıklaması"
            }
            
            let cancelButton = UIAlertAction(title: "İptal", style: .cancel)
            let addButton = UIAlertAction(title: "Ekle", style: .default) { (action) in
                
                let nameField = alertController.textFields![0]
                let commentField = alertController.textFields![1]
                
                self.annotation.title = nameField.text
                self.annotation.subtitle = commentField.text
                self.mapView.addAnnotation(self.annotation)
                
                let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Place", into: self.context)
                
                newPlace.setValue(nameField.text, forKey: "name")
                newPlace.setValue(commentField.text, forKey: "note")
                newPlace.setValue(pressedCoordinate.latitude, forKey: "latitude")
                newPlace.setValue(pressedCoordinate.longitude, forKey: "longitude")
                newPlace.setValue(UUID(), forKey: "id")
                
                do {
                    try self.context.save()
                    print("kayıt edildi")
                } catch {
                    print("hata")
                }
                
                NotificationCenter.default.post(name: NSNotification.Name("newPlaceAdded"), object: nil)
                self.navigationController?.popViewController(animated: true)
                
            }
            
            
            alertController.addAction(cancelButton)
            alertController.addAction(addButton)
            
            self.present(alertController, animated: true)
            
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locations[0].coordinate.latitude
        //locations[0].coordinate.longitude
        
        if self.selectedName == "" {
            // CLLocation'ın 2D olanını kullanıyoruz.
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            // Belirtilen bölgenin yükseklik ve genişliğini belirtir. Zoom seviyesini değiştirir.
            let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            // Haritaya açtığımızda belirtilen yakınlaştırma oranını uygulayarak seçili lokasyonu gösterir.
            let region = MKCoordinateRegion(center: location, span: span)
            // Haritada bir yere gitmek için kullanıyoruz.
            mapView.setRegion(region, animated: true)
        }
        
        
    }
    
}

