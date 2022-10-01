//
//  detailView.swift
//  Lab4
//
//  Created by 刘晋好 on 9/30/22.
//

import SwiftUI

struct detailView: View {
    @State var city:City
    var body: some View {
        VStack{
            Text(city.name)
            
            Image(city.image)
            Text(city.descrip)
        }
        
        
    }
}
