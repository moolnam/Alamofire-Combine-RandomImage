//
//  ProfileView.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import SwiftUI

struct ProfileView: View {
    
    
    var body: some View {
        HStack {
            ProfileCircle(urlImage: URL(string: "https://randomuser.me/api/portraits/women/67.jpg")!)
            ProfileName()
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        .font(.system(size: 30))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
        .padding()
        .background(.green)
        .cornerRadius(20)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView()
            .previewLayout(.sizeThatFits)
    }
}
