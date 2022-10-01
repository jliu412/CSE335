//
//  File.swift
//  Lab4
//
//  Created by 刘晋好 on 9/30/22.
//

import Foundation

import SwiftUI

final class cityViewModel: ObservableObject {
    @Published var array: [City] = [
        City(name: "1", descrip: "this is a city", image: ("1")),
        City(name: "2", descrip: "this is anthon city", image: ("2")),
        City(name: "3", descrip: "city is a city", image: ("3")),
        City(name: "4", descrip: "big city", image: ("4")),
        City(name: "5", descrip: "good city", image: ("5"))
    ]
    
    
    func addinf (name:String,descrip:String){
        
        for (i,j) in array.enumerated() {
            if j.name == name {
                return
            }
        }
        array.append(City(name: name, descrip: descrip, image: ("6")))
        
    }
    
    func delInf (name:String){
        
        for (i,j) in array.enumerated() {
            if j.name == name {
                array.remove(at: i)
            }
        }
        
        
    }
}
