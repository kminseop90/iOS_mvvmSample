//
//  Repository.swift
//  MVVMSample
//
//  Created by 김민섭 on 2022/06/26.
//

import Foundation

class Repository {
    
    func fetchNow(onComplete: @escaping (Entity) -> Void) {
        let url = "http://worldclockapi.com/api/json/est/now"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(Entity.self, from: data) else { return }
            onComplete(model)
        }.resume()
    }
    
}
