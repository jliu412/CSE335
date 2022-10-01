//
//  movieViewModel.swift // VM
//  Lab3
//
//  Created by 刘晋好 on 9/15/22.
//

import Foundation
final class movieViewModel: ObservableObject {
    @Published var dict: [String:Movie] = ["111222":Movie(movieTittle: "111222", movieGenre: "222", movieTicket: 54)]
    
    func editInf (Ticket:Int ,Index:String, dic: [String:Movie]) -> [String:Movie] {
        var di = dic
        di[Index]!.movieTicket = Ticket
        return di
    }
    
    func addinf (name:String,penre:String,tick:Int){
        dict[name] = Movie(movieTittle:name, movieGenre:penre, movieTicket:tick)
    }
    
    func delInf (name:String){
        dict[name] = nil
    }
}
