//
//  Utility.swift
//  ios-demo
//
//  Created by Paramitha on 03/11/18.
//  Copyright © 2018 mitha. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

// MARK: View

/// simple alert with ok button
func buildOKAlert(title: String, message: String, view: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(ok)
    
    view.present(alert, animated: true)
}



// MARK: Service

enum RequestCall: String {
    case getSearchResult = "getSearchResult"
    case getBookDetail = "getBookDetail"
}

protocol RestApiListener {
    func successResponse(call: RequestCall, responseJSON: JSON)
    func failureResponse(call: RequestCall, error: Error)
}

let baseURL = "https://itunes.apple.com/search"

func alamoJSON(endpoint: String, method: HTTPMethod, header: HTTPHeaders?, param: Parameters?, call: RequestCall, listener: RestApiListener) {
    
    sessionManager.request(baseURL + endpoint, method: method, parameters: param, encoding: JSONEncoding.default, headers: header).validate().responseJSON { (response) in
        switch response.result {
        case .success:
            guard let res = response.result.value else {
                print("response is nil")
                return
            }
            listener.successResponse(call: call, responseJSON: JSON(res))
        case .failure:
            guard let err = response.error else {
                print("error is nil")
                return
            }
            listener.failureResponse(call: call, error: err)
        }
    }
}

class Service {
    static func getSearchResultRequest(keyword: String, listener: RestApiListener) {
        alamoJSON(endpoint: "?media=ebook&term=\(keyword)", method: .get, header: nil, param: nil, call: RequestCall.getSearchResult, listener: listener)
    }
}
