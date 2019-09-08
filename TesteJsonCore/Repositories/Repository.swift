//
//  Repository.swift
//  TesteJson
//
//  Created by Alessandro on 06/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation

enum RepositoryError{
    case url
    case taskError(error:Error)
    case noResponse
    case noData
    case responseStatusCode(code:Int)
    case invalidJson
}

enum HTTPMethod:String{
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
    
}


public class Repository{
    
    private static let basePath = "\(Constants.basePath)"
    
    private static let configuration:URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadRepositories(language:String,onComplete:@escaping (GitHubEntity)->Void, onError:@escaping
        (RepositoryError)->Void){
        
        var query = ""
        
        switch language {
        case "":
            query = "q=language:swift&sort=stars"
        default:
            query = "q=language:\(language.lowercased())&sort=stars"
        }
        
        guard let url = URL(string: "\(basePath)\(query)") else{
            onError(.url)
            return
        }
        let dataTask = session.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            if error == nil{
                guard let response = response as? HTTPURLResponse else{
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200{
                    guard let data = data else {
                        onError(.noData)
                        return
                    }
                    do{
                        let repositories = try JSONDecoder().decode(GitHubEntity.self, from: data)
                        
                        onComplete(repositories)
                    }catch{
                        onError(.invalidJson)
                        print(error.localizedDescription)
                    }
                }else{
                    onError(.responseStatusCode(code: response.statusCode))
                }
            }else{
                print(error?.localizedDescription as Any)
            }
        }
        dataTask.resume()
    }
    
}

