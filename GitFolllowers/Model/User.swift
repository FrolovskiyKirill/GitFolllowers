//
//  User.swift
//  GitFolllowers
//
//  Created by Kirill Frolovskiy on 14.04.2023.
//

import Foundation

struct User: Codable {
  var login: String
  var avatarUrl: String
  var name: String?
  var location: String?
  var bio: String?
  var publicRepos: Int
  var PublicGists: Int
  var htmlUrl: String
  var following: Int
  var followers: Int
  var createdAt: String

}
