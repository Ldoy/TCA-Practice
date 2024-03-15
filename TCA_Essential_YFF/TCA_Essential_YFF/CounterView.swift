//
//  CounterView.swift
//  TCA_Essential_YFF
//
//  Created by Do Yi Lee on 3/15/24.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
      VStack {
        Text("\(store.count)")
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        HStack {
          Button("-") {
            store.send(.decrementButtomTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
          
          Button("+") {
            store.send(.incrementButtomTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        }
      }
    }
}

#Preview {
  CounterView(
    store: Store(initialState: CounterFeature.State()) {
      // CounterFeature()
    }
  )
}
