//
//  ViewModel.swift
//  MVVMSample
//
//  Created by 김민섭 on 2022/06/26.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var dateTimeString: String = "Loading..."
    let service = Service()
    
    func load() {
        self.dateTimeString = "Loading..."
        
        self.service.fetchNow { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.dateTimeString = self.dateToString(date: model.dateTime)
            }
        }
    }
    
    func moveDay(day: Int) {
        self.service.moveDay(day: day)
        self.dateTimeString = self.dateToString(date: service.model.dateTime)
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
}
