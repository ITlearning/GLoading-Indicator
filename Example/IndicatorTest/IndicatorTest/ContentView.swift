//
//  ContentView.swift
//  IndicatorTest
//
//  Created by Tabber on 2023/02/19.
//

import SwiftUI
import GLoading_Indicator

struct ContentView: View {
    var body: some View {
        
        VStack {
            Text("Hello, world!")
                .padding()
            
            Button(action: {
                GLoading_Indicator.show(text: "불러오는 중이에요..!")
            }, label: {
                Text("Open")
            })
        }
        
    }
}
