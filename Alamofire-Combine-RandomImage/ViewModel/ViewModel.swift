//
//  Model.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import Foundation
import Combine


class RandomUserModel: ObservableObject {
    
    @Published var tsxt: String = "HI"
    @Published var randomUser: [Result] = []
    
    let baseURL = "https://randomuser.me/api/?results=20"
    
    func fetchUser() {
        let urlString = baseURL
        guard let url = URL(string: urlString) else {
            return
        }
        print(url)
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let safeData = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(RandomUser.self, from: safeData)
                DispatchQueue.main.async {
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
