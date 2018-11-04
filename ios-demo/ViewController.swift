//
//  ViewController.swift
//  ios-demo
//
//  Created by Paramitha on 02/11/18.
//  Copyright © 2018 mitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let mainSB = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet weak var keywordTF: UITextField!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBAction func didTapSearch(_ sender: Any) {
        if (keywordTF.text == "") {
            buildOKAlert(title: "Search Failed", message: "Please fill the field.", view: self)
        } else {
            let tableVC = mainSB.instantiateViewController(withIdentifier: "tableVC") as! TableViewController
            tableVC.keyword = keywordTF.text!
            navigationController?.pushViewController(tableVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

