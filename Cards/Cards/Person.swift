//
//  Person.swift
//  Cards
//
//  Created by 김담인 on 2023/03/10.
//

import Foundation

struct Person {
    let headerImage: String
    let profileImage: String
    let name: String
    let followerCount: Int
    let jobTitle: String
}

let person1 = Person(headerImage: "headerImage1", profileImage: "profileImage1", name: "Jhon Doe", followerCount: 1000, jobTitle: "Developer")
let person2 = Person(headerImage: "headerImage2", profileImage: "profileImage2", name: "Jane Smith", followerCount: 2000, jobTitle: "Designer")
