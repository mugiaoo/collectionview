//
//  UserModel.swift
//  collectionview
//
//  Created by Mugi on 2022/06/20.
//

import Foundation

struct UserModel: Codable{
    let sweets: [Sweets]
}

struct Sweets: Codable{
    let sweets_id: Int?
    let name: String?
    let price: Int?
    let imagePath: String?
}

//"sweets_id": 1,
//            "name": "�P�[�L",
//            "price": 500,
//            "imagePath": "https://1.bp.blogspot.com/-zsoZgEuuKw0/UZYlSmKRIjI/AAAAAAAATMg/EFt9gd3L1ek/s800/christmas_cake.png"

//struct UserModel: Codable{
//    let rendered_body: String
//    let body: String
//    let coediting: Bool
//    let comments_count: Int
//    let created_at: String
//    let group: Int
//    let id: String
//    let likes_count: Int
//    //let private: Bool
//    let reactions_count: Int
//    let tags: String
//    let title: String
//    let updated_at: String
//    let url: String
//    let user: String
//}
//
//struct Tags: Codable{
//    let name: String
//    //let versions: [Version]
//}
//
//struct User: Codable{
//    let description: String
//    let facebookid: String
//    let followees_count: Int
//    let followers_count: Int
//    let github_login_name: String
//    let id: String
//    let items_count: Int
//    let linkedin_id: Int
//    let location: String
//    let name: String
//    let organizatiton: String
//    let permanent_od: Int
//    let profile_image_url: String
//    let team_only: Bool
//    let teitter_screen
//}
