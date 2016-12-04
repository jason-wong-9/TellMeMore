//
//  TagVC.swift
//  TellMeMore
//
//  Created by Tassilo von Gerlach on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class TagVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tags = [Tag]()
    
    @IBOutlet weak var tagsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TagCell") as? TagCell {
            
            let tag = tags[indexPath.row]
            
            cell.configureCell(tag)
            
            return cell
            
        }
        
        return UITableViewCell()
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let  cell = tableView.cellForRow(at: indexPath) as? TagCell {
            let destinationViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebView") as! WebVC
            destinationViewController.conceptString = cell.currentTag.tag
            navigationController?.pushViewController(destinationViewController, animated: true)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(tags)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
