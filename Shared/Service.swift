//
//  Service.swift
//  MVVMSample
//
//  Created by 김민섭 on 2022/06/26.
//

import Foundation

class Service {
    
    private let repository = Repository()
    var model = Model(dateTime: Date())
    
    func fetchNow(onComplete: @escaping (Model) -> Void) {
        repository.fetchNow { [weak self] entity in
            guard let self = self else { return }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ"
            
//            2022-06-26T05:27-04:00
            
            guard let date = formatter.date(from: entity.currentDateTime) else { return }
            
            let model = Model(dateTime: date)
            self.model = model
            
            onComplete(model)
        }
    }
    
    func moveDay(day: Int) {
        guard let movedDay = Calendar.current.date(byAdding: .day,
                                                   value: day,
                                                   to: model.dateTime) else {
            return
        }
        model.dateTime = movedDay
    }
}
