//
//  RepositoriesInteractor.swift
//  TesteJson
//
//  Created by Alessandro on 07/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation

class RepositoriesInteractor{
    
    var repositoriesPresenter:RepositoriesPresenterProtocol
    
    init (repositoriesPresenter:RepositoriesPresenterProtocol){
        self.repositoriesPresenter = repositoriesPresenter
    }
    
    func loadRepositories(language:String){
        Repository.loadRepositories(language:language,onComplete: { (gitHubEntity) in
           
            self.repositoriesPresenter.reloadView(repository: gitHubEntity)
            
        }) { (error) in
            
            self.repositoriesPresenter.showAlert()
            self.repositoriesPresenter.showError(error: error)
            
        }
    }
}
