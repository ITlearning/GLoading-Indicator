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
                GLoading_Indicator.show(blurStyle: .extraLight) {
                    // Cancel Button Click Action
                    // Example) Networking Stop, View Drawing Stop...
                    print("[@] Close Action On")
                }
            }, label: {
                Text("Open")
            })
        }
        
    }
}
