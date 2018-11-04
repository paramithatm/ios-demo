//
//  TableViewController.swift
//  ios-demo
//
//  Created by Paramitha on 02/11/18.
//  Copyright © 2018 mitha. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RestApiListener {

    var keyword = String()
    var resultArray: [Book] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
        
    }
    
    func successResponse(call: RequestCall, responseJSON: JSON) {
        print(responseJSON)
    }
    
    func failureResponse(call: RequestCall, error: Error) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Service.getSearchResultRequest(keyword: keyword, listener: self)
    }
}
