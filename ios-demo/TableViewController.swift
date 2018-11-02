//
//  TableViewController.swift
//  ios-demo
//
//  Created by Paramitha on 02/11/18.
//  Copyright © 2018 mitha. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var keyword = String()
    var resultArray: [Book] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
