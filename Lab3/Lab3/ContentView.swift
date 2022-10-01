//
//  ContentView.swift //V
//  Lab3
//
//  Created by 刘晋好 on 9/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = movieViewModel()
    
    @State public var textname = ""
    @State var selection:Int? = 0
    @State var textgenre = ""
    @State var texttick = ""
    @State var alert = false
    @State var search = ""
    @State var iffind = false
    @State var name = ""
    @State var gre = ""
    @State var tic = ""
    
    var movie: Movie
    
    var body: some View
    {
        NavigationStack {
            VStack{
                VStack(){
                    Text("Enter the name to delete")
                    Text("Or enter full infomation to add")
                }
                HStack() {
                    Text("Movie name: ")
                        .font(.title)
                    
                    TextField("name",text: $textname)
                    
                }.padding(20)
                
                HStack() {
                    Text("Movie genre: ")
                        .font(.title)
                    
                    TextField("genre",text: $textgenre)
                }.padding(20)
                HStack() {
                    Text("Movie ticket: ")
                        .font(.title)
                    
                    TextField("ticket",text: $texttick)
                }.padding(20)
               
            }.navigationTitle("My Movie")
                .toolbar(content: {
                    ToolbarItem() {
                        Button {
                            if(textname != "" && textgenre != "" && texttick != "" ){
                                viewModel.addinf(name: textname, penre: textgenre, tick: Int(texttick)!)
                                textname = ""
                                textgenre = ""
                                texttick = ""
                                
                            }
                        } label: {
                            Text("add")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            if(textname != ""){
                                viewModel.delInf(name: textname)
                                textname = ""
                                textgenre = ""
                                texttick = ""
                                
                            }
                        } label: {
                            Text("del")
                        }
                    }
                    
                    
                    
                    ToolbarItem(placement: .bottomBar) {
                        
                        NavigationLink(destination: searchview(dict: $viewModel.dict, name: $name), tag: 1, selection: $selection) {
                        Button {
                            alert = true
                            
                            
                        } label: {
                            Text("search")
                        }.alert("Warning", isPresented: $alert) {
                            TextField("search", text: $search){
                                
                            }
                            Button {
                                let array = Array(viewModel.dict.keys)
                                for i in array {
                                    if(viewModel.dict[i]!.movieTittle==search){
                                        name = viewModel.dict[i]!.movieTittle
                                        gre = viewModel.dict[i]!.movieGenre
                                        tic = String(viewModel.dict[i]!.movieTicket)
                                        self.selection = 1
                                    }
                                }
                                
                            } label: {
                                Text("search")
                            }

                        }
                            
                        }
                    }
                    
                    
                    
                })
            
            
        
        }

        
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(movie: Movie(movieTittle: "", movieGenre: "", movieTicket: 0))
    }
}
