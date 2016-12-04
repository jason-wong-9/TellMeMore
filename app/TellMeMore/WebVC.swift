//
//  WebVCViewController.swift
//  TellMeMore
//
//  Created by Tassilo von Gerlach on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class WebVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var conceptString = ""
    
    let _baseurl = "https://www.google.ca/#q="
    
    var _search: String!
    
    var url: String {
        return _baseurl + conceptString
    }
    
    var search: String {
        return _search
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrl()

    
    }
    
    func loadUrl() {
        if let requestURL = URL(string: url) {
            let request = URLRequest(url: requestURL)
            
            webView.loadRequest(request)
        }
    }
    

}
