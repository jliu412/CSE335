//
//  Lab3App.swift
//  Lab3
//
//  Created by 刘晋好 on 9/14/22.
//

import SwiftUI

@main
struct Lab3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(movie: Movie(movieTittle: "", movieGenre: "", movieTicket: 0))
        }
    }
}
