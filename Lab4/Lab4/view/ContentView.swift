//
//  ContentView.swift
//  Lab4
//
//  Created by 刘晋好 on 9/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cityviewmodel = cityViewModel()
    @State var name = ""
    @State var descrip = ""
    
    var body: some View {
        NavigationStack {
            List(cityviewmodel.array) { city in
            
                HStack{
                    Image(city.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    NavigationLink(city.name, destination: detailView(city:city))
                }
                
            }.navigationTitle("city")
                .toolbar(content: {
                   
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            if(name != "" && descrip != "" ){
                                cityviewmodel.addinf(name: name, descrip: descrip)
                                name = ""
                                descrip = ""
                            }
                        } label: {
                            Text("add")
                        }
                        
                    }
                    ToolbarItem(placement: .bottomBar) {
                        VStack {
                            TextField("cityname", text: $name)
                                .frame(
                                    minWidth: 200,
                                    maxWidth: 200,
                                    alignment: .center
                                    
                                ).multilineTextAlignment(.center)
                            TextField("descipe", text: $descrip)
                                .frame(
                                    minWidth: 300,
                                    maxWidth: 300,
                                    alignment: .center
                                    
                                ).multilineTextAlignment(.center)
                            
                        }
                        
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            if(name != ""){
                                cityviewmodel.delInf(name: name)
                                name = ""
                                descrip = ""
                                
                                
                            }
                        } label: {
                            Text("del")
                        }
                    }
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
