//
//  Repository.swift
//  TesteJson
//
//  Created by Alessandro on 06/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation

struct Owner:Codable{
    let login:String
    let avatar_url:String
}

struct Item:Codable{
    let name:String
    let owner:Owner
    let stargazers_count:Int
}

struct GitHubEntity:Codable{
    
    let items:[Item]
}


