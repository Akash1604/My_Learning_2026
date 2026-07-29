//
//  ObservedStateObjectViewDifference.swift
//  LearnSwiftUI
//
//  Created by Akash Revanna on 25/07/26.
//

import SwiftUI
internal import Combine

// @ObservedObject vs @StateObject

struct ObservedStateObjectViewDifference: View {
    @State var count = 0
    var body: some View {
        
        VStack(spacing:30) {
            Button("Click me") {
                count = count + 1
            }
            Text("Refreshed \(count) times")
            ObservedView()
            
            StateView()

        }
    }
}


struct StateView:View {
    @StateObject private var viewModel = ObservedStateObjectViewDifferenceViewModel(viewType: "StateView")
    var body: some View {
        VStack{
            Text("StateView").font(.title).bold()
            Text("\(viewModel.randomString)")
        }
    }
}

struct ObservedView:View {
    @ObservedObject private var viewModel = ObservedStateObjectViewDifferenceViewModel(viewType: "ObservedView")
    var body: some View {
        VStack{
            Text("ObservedView").font(.title).bold()
            Text("\(viewModel.randomString)")
        }
    }
}
class ObservedStateObjectViewDifferenceViewModel:ObservableObject {
    
    @Published var randomString:String = UUID().uuidString
    var viewType:String
    init(viewType: String) {
        self.viewType = viewType
        
        print("init called with viewType: \(self.viewType)")

    }
    deinit {
        print("deinit called with viewType: \(self.viewType)")
    }
    
     
}







#Preview {
    ObservedStateObjectViewDifference()
}
