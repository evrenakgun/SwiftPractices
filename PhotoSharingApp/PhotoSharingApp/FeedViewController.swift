//
//  FeedViewController.swift
//  PhotoSharingApp
//
//  Created by Evren Akgün on 23.02.2023.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    var commentArray = [String]()
    var imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        firebaseGetData()
    }
    
    func firebaseGetData() {
        
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Post").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        //let documentId = document.documentID
                        
                        if let imageUrl = document.get("imageurl") as? String {
                            self.imageArray.append(imageUrl)
                        }
                        
                        if let comment = document.get("comment") as? String {
                            self.commentArray.append(comment)
                        }
                        
                        if let email = document.get("email") as? String {
                            self.emailArray.append(email)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailText.text = emailArray[indexPath.row]
        cell.commentText.text = commentArray[indexPath.row]
        cell.postImageView.sd_setImage(with: URL(string: self.imageArray[indexPath.row]))
        
        return cell
    }
    
}
