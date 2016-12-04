//
//  Tag.swift
//  TellMeMore
//
//  Created by Tassilo von Gerlach on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import Foundation

class Tag {
    
    var _tag: String!
    var _score: Double!
    
    var tag: String {
        return _tag
    }
    
    var score: Double {
        return _score
    }
    
    init (tag: String, score: Double){
        _tag = tag
        _score = score
    }
    
    
}
