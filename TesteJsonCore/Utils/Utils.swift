//
//  Utils.swift
//  TesteJson
//
//  Created by Alessandro on 07/09/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation
import UIKit


struct Utils{
    static func showAlert(title: String, message: String, confirmation:Bool, vc: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Fechar", style: .cancel, handler: nil)
        if confirmation {
            let confirmAction = UIAlertAction(title: "OK", style: .default) { (action) in
                //TODO: confirmation
            }
            alert.addAction(confirmAction)
        }
        alert.addAction(cancelAction)
        vc.present(alert, animated: true)
    }
}
