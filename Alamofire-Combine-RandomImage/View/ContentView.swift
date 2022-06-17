//
//  ContentView.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/16.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    
    
    var body: some View {
        List(0...100, id: \.self) { index in
            ProfileView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
