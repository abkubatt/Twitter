//
//  Tweet.swift
//  Twitter_
//
//  Created by Abdulmajit Kubatbekov on 13.01.23.
//

import Foundation


struct Tweet: Codable, Identifiable {
    var id = UUID().uuidString
    let author: TwitterUser
    let authorID: String
    let tweetContent: String
    var likesCount: Int
    var likes: [String]
    let isReply: Bool
    let parentReference: String?
}
