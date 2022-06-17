//
//  Model.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import Foundation
import Combine
import Alamofire


class RandomUserModelManager: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var tsxt: String = "HI"
    @Published var randomUsers: [Result] = []
    
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
                let result = try JSONDecoder().decode(RandomUserModel.self, from: safeData)
                DispatchQueue.main.async {
                    print(result.results.count)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func fetchRandomUser() {
        AF.request(baseURL)
            .publishDecodable(type: RandomUserModel.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("실패: \(err)")
                case .finished:
                    print("성공")
                }
                
            }, receiveValue: { receivedValue in
                print(receivedValue.description)
                
            }).store(in: &subscription)
    }
    
}
