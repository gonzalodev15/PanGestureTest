//
//  Pokemon.swift
//  KatchAppTest
//
//  Created by Christian Gonzalo on 10/18/19.
//  Copyright © 2019 Christian Gonzalo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Digimon{
    var name: String
    var sprite: String
    
    init(name:String, sprite: String){
        self.name = name
        self.sprite = sprite
    }
    
    convenience init(){
        self.init(name: "", sprite: "")
    }
    
    convenience init(jsonDigimon: JSON) {
        print(jsonDigimon["name"].stringValue)
        print(jsonDigimon["img"].stringValue)
        self.init(
            name: jsonDigimon["name"].stringValue,
            sprite: jsonDigimon["img"].stringValue
        )
    }
    
    static func buildAll(from jsonDigimons: JSON) -> [Digimon]{
        var digimons: [Digimon] = []
        let count = jsonDigimons.count
        for i in 0 ..< count {
            digimons.append(Digimon(jsonDigimon: JSON(jsonDigimons[i])))
        }
        return digimons
    }
}
