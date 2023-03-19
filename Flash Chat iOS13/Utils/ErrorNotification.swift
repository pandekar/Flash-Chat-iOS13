//
//  ErrorNotification.swift
//  Flash Chat iOS13
//
//  Created by Pande Adhistanaya on 18/03/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

protocol ErrorNotificationDisplay: UIViewController {

}

struct ErrorManagement {
    var delegate: ErrorNotificationDisplay?
    
    func showErrorPopUp(_ errorMessage: Error) {
        let alert = UIAlertController(title: "Error", message: errorMessage.localizedDescription, preferredStyle: .alert)
        
        //define action
        let alertAction = UIAlertAction(title: "Okay", style: .default) {(action) in
            print(action)
        }
        
        //add action to alert
        alert.addAction(alertAction)
        
        delegate?.present(alert, animated: true, completion: nil)
    }
}
