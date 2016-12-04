//
//  TagCell.swift
//  TellMeMore
//
//  Created by Tassilo von Gerlach on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import UIKit

class TagCell: UITableViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ tag:Tag){
        
        
        tagLabel.text = tag.tag.capitalized
        scoreLabel.text = "\(tag.score)"
        
        
    }
    
    
    @IBAction func findBtnPressed(_ sender: Any) {
        
        
    }
    

}
