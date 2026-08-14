//
//  ContentView.swift
//  DispatchBarrierDemo
//
//  Created by Akash Revanna on 13/08/26.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
            viewModel.buyTickets()
            viewModel.doSomething()
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
