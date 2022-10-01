//
//  movieView.swift
//  Lab3
//
//  Created by 刘晋好 on 9/15/22.
//

import SwiftUI





struct searchview: View {
    
    
    @Binding var dict : [String:Movie]
    @Binding var name:String
    @State var newtic:String = ""
    @State var warningpre:Bool = false
    @State var warningnext:Bool = false
    
    var body: some View {
        let array = Array(dict.keys)
        var namenum = 0
        
        VStack{
            HStack() {
                Text("Search result: ")
                    .font(.title)
                    .fontWeight(.bold)
                
            }.padding(20)
            HStack() {
                Text("Movie name: ")
                    .font(.title)
                    .fontWeight(.bold)
                Text(name)
                
            }.padding(20)
            HStack() {
                Text("Movie genre: ")
                    .font(.title)
                    .fontWeight(.bold)
                Text(dict[name]!.movieGenre)
            }.padding(20)
            HStack() {
                Text("Movie ticket: ")
                    .font(.title)
                    .fontWeight(.bold)
                Text(String(dict[name]!.movieTicket))
                
            }.padding(20)}
        HStack() {
            Text("New ticket: ")
                .font(.title)
                .fontWeight(.bold)
            TextField("newticket", text: $newtic)
            
        }.padding(20)
            .navigationTitle("Record")
            .toolbar(content:) {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if (name == array[0]) {
                            warningpre = true
                        } else
                        {
                            namenum = array.firstIndex(of: name)!
                            name = array[namenum - 1]
                        }
                        
                    } label: {
                        Text("prev")
                    }.alert("this is the first records", isPresented: $warningpre) {
                        
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if (name == array.last) {
                            warningnext = true
                        } else
                        {
                            namenum = array.firstIndex(of: name)!
                            name = array[namenum + 1]
                        }
                    } label: {
                        Text("next")
                    }.alert("there have no more records ", isPresented: $warningnext) {
                        
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        if (Int(newtic) != nil){
                            dict[name]!.movieTicket = Int(newtic)!
                            
                        }
                    } label: {
                        Text("edit")
                    }
                }
            }
        
        
    }
}
