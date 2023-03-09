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
    
    var postArray = [Post]()
//    var emailArray = [String]()
//    var commentArray = [String]()
//    var imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        firebaseGetData()
    }
    
    func firebaseGetData() {
        
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Post").order(by: "postdate", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
//                    self.emailArray.removeAll()
//                    self.imageArray.removeAll()
//                    self.commentArray.removeAll()
                    self.postArray.removeAll()
                    
                    for document in snapshot!.documents {
                        //let documentId = document.documentID
                        
                        if let imageUrl = document.get("imageurl") as? String {
                            if let comment = document.get("comment") as? String {
                                if let email = document.get("email") as? String {
                                    let post = Post(email: email, comment: comment, imageUrl: imageUrl)
                                    self.postArray.append(post)
                                }
                            }
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.emailText.text = postArray[indexPath.row].email
        cell.commentText.text = postArray[indexPath.row].comment
        cell.postImageView.sd_setImage(with: URL(string: self.postArray[indexPath.row].imageUrl))
        
        return cell
    }
    
}
