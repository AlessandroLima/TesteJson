//
//  repositoriesPresenter.swift
//  TesteJson
//
//  Created by Alessandro on 07/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation

protocol RepositoriesPresenterProtocol: class{
    func reloadView(repository:GitHubEntity)
    func showAlert()
    func showError(error:RepositoryError)
}
