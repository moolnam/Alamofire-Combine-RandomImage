//
//  Model.swift
//  Alamofire-Combine-RandomImage
//
//  Created by KimJongHee on 2022/06/17.
//

import Foundation
import Combine
import Alamofire


class RandomUserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers: [Result] = []
    
    let baseURL = "https://randomuser.me/api/?results=20"t
    
    func fetchRandomUser() {
        AF.request(baseURL)
            .publishDecodable(type: RandomUserModel.self)
            .compactMap { $0.value}
            // compactMap 은 옵셔널을 벗겨내는 방법중에 하나이다.
            .map { $0.results}
            // 한번더 map 을 해주면 results 안에 있는 값을 가져올 수 있다.
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let err):
                    print("실패: \(err)")
                case .finished:
                    print("성공")
                }
            }, receiveValue: { (receivedValue: [Result]) in
                print(receivedValue.count)
                self.randomUsers = receivedValue
                // @Published var randomUsers: [Result] = []

                
            }).store(in: &subscription)
    }
    
}
