//
//  ResultTableViewController.swift
//  ios-demo
//
//  Created by Paramitha on 02/11/18.
//  Copyright © 2018 mitha. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ResultTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RestApiListener {

    var keyword = String()
    var resultArray: [Book] = []
    
    @IBOutlet weak var resultTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = resultTableView.dequeueReusableCell(withIdentifier: "resultCell") as! ResultTableViewCell
        cell.authorLabel.text = resultArray[indexPath.row].author
        cell.titleLabel.text = resultArray[indexPath.row].title
        cell.iconImageView.kf.indicatorType = .activity
        cell.iconImageView.kf.setImage(with: URL(string: resultArray[indexPath.row].imageUrl))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func successResponse(call: RequestCall, responseJSON: JSON) {
        
        resultArray.removeAll()
        var resObject: Book
        for (_, result) in responseJSON["results"].arrayValue.enumerated() {
            print(result)
            resObject = Book()
            resObject.author = result["artistName"].stringValue
            resObject.title = result["trackName"].stringValue
            for (_, genre) in result["genres"].arrayValue.enumerated() {
                resObject.genres.append(genre.stringValue)
            }
            resObject.description = result["description"].stringValue
            resObject.imageUrl = result["artworkUrl100"].stringValue
            resultArray.append(resObject)
        }
        DispatchQueue.main.async {
            self.resultTableView.reloadData()
        }
    }
    
    func failureResponse(call: RequestCall, error: Error) {
        print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Service.getSearchResultRequest(keyword: keyword, listener: self)
    }
}
