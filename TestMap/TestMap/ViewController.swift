//
//  ViewController.swift
//  TestMap
//
//  Created by Evren Akgün on 30.01.2023.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var informationTextField: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    // Konumla ilgili olayları ele almamıza yarayan bir obje.
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locations[0].coordinate.latitude
        //locations[0].coordinate.longitude
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        // Belirtilen bölgenin yükseklik ve genişliğini belirtir. Zoom seviyesini değiştirir.
        let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        let region = MKCoordinateRegion(center: location, span: span)
        
        // Haritada bir yere gitmek için kullanıyoruz.
        mapView.setRegion(region, animated: true)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
}

