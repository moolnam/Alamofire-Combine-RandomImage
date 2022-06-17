//
//  ProfileCircle.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import SwiftUI
import URLImage

struct ProfileCircle: View {
    
    let urlImage: URL
    
    var body: some View {
        URLImage(urlImage, content: { image in
            image
                .resizable()
                .scaledToFit()
        })
        .clipShape(Circle())
    }
}

struct ProfileCircle_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/67.jpg")!
        
        ProfileCircle(urlImage: url)
            .previewLayout(.sizeThatFits)
    }
}
