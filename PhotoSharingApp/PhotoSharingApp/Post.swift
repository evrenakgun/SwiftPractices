//
//  Post.swift
//  PhotoSharingApp
//
//  Created by Evren Akgün on 9.03.2023.
//

import Foundation

class Post {
    var email : String
    var comment : String
    var imageUrl : String
    
    init(email: String, comment: String, imageUrl: String) {
        self.email = email
        self.comment = comment
        self.imageUrl = imageUrl
    }
}
