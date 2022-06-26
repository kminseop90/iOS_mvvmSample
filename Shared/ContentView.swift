//
//  ContentView.swift
//  Shared
//
//  Created by 김민섭 on 2022/06/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.dateTimeString)
                .padding()
            HStack {
                Button("어제") {
                    viewModel.moveDay(day: -1)
                }.padding()
                Button("오늘") {
                    viewModel.load()
                }.padding()
                Button("내일") {
                    viewModel.moveDay(day: 1)
                }.padding()
            }
        }.onAppear {
            viewModel.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
