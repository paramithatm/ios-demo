//
//  Utility.swift
//  ios-demo
//
//  Created by Paramitha on 03/11/18.
//  Copyright © 2018 mitha. All rights reserved.
//

import Foundation
import UIKit

func buildOKAlert(title: String, message: String, view: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(ok)
    
    view.present(alert, animated: true)
}
