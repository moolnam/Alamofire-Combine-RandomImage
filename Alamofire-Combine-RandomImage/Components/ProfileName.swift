//
//  ProfileName.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import SwiftUI

struct ProfileName: View {
    
    let name: String
    let email: String
    let gender: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(name)")
            Text("\(gender)")
            Text("\(email)")
        }
    }
}

struct ProfileName_Previews: PreviewProvider {
    static var previews: some View {
        ProfileName(name: "NAME", email: "EMAIL", gender: "??")
            .previewLayout(.sizeThatFits)
    }
}
