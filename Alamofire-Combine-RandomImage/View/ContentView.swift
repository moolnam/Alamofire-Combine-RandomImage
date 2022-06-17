//
//  ContentView.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/16.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { index in
            ProfileView(randomUser: index)
            
        }
        .onAppear() {
            randomUserViewModel.fetchRandomUser()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
