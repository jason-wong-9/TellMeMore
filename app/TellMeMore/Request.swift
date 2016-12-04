//
//  Request.swift
//  TellMeMore
//
//  Created by Tassilo von Gerlach on 2016-12-03.
//  Copyright © 2016 Jason Wong. All rights reserved.
//

import Foundation
import Clarifai


class Request {
    
    
    
    
    
    static func makeRequest(image: UIImage, completionHandler: @escaping ([Tag]) -> ()) {
        if let app = ClarifaiApp.init(appID: cliedId, appSecret: clientSecret){
    
            app.getModelByName("general-v1.3", completion: { (model, error) in
                if (error != nil) {
                    print("ERROR1")
                } else {
                    if let clarifaiImage = ClarifaiImage(image: image) {
                        model?.predict(on: [clarifaiImage], completion: { (outputs, error) in
                            if (error != nil) {
                                print("ERROR2")
                            } else {
                                
                                var tags = [Tag]()
                                
                                if let output = outputs?[0] {
                                    for concept in output.concepts {
                                        //tags.append(concept.conceptName)
                                        let tag = Tag(tag: concept.conceptName, score: Double(concept.score))
                                        tags.append(tag)
                                        print(concept.conceptName)
                                        print(concept.score)
                                    }
                                }
                                completionHandler(tags)
                                
                            }
                        })
                    }
                    
                }
            
            })
        
        }}
    
}
