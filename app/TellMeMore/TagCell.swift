//
//  TagCell.swift
//  TellMeMore
//
//  Created by Tassilo von Gerlach on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

extension Double {
    func roundTo(decimalPlaces: Int) -> String {
        return NSString(format: "%.\(decimalPlaces)f" as NSString, self) as String
    }
}

class TagCell: UITableViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var currentTag: Tag!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ tag:Tag){
        
        currentTag = tag
        tagLabel.text = tag.tag.capitalized
        
        scoreLabel.text = "\(tag.score.roundTo(decimalPlaces: 2))"
        
        
    }
    
    
    @IBAction func findBtnPressed(_ sender: Any) {
        
        
    }
    

}
