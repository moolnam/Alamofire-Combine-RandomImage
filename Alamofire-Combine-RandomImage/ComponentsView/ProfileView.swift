//
//  ProfileView.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import SwiftUI

struct ProfileView: View {
    
    var randomUser: Result
    
    var body: some View {
        VStack {
            HStack {
                ProfileCircle(urlImage: randomUser.profileImageURL)
                VStack {
                    ProfileName(name: randomUser.profileName, email: randomUser.email, gender: randomUser.gender.rawValue)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                }
            }
            .font(.system(size: 30))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 80, alignment: .leading)
            .padding()
            .background(.green)
        .cornerRadius(20)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileView(randomUser: Result.getDummy())
            .previewLayout(.sizeThatFits)
    }
}
