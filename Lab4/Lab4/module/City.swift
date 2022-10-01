//
//  City.swift
//  Lab4
//
//  Created by 刘晋好 on 9/28/22.
//

import Foundation
import SwiftUI
struct City: Identifiable
{
    let id = UUID()
    var name:String
    var descrip:String
    var image: String
    
    init(name: String, descrip: String, image: String) {
        self.name = name
        self.descrip = descrip
        self.image = image
    }
}
