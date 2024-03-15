//
//  TCA_Essential_YFFApp.swift
//  TCA_Essential_YFF
//
//  Created by Do Yi Lee on 3/15/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCA_Essential_YFFApp: App {
    
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: TCA_Essential_YFFApp.store)
        }
    }
}
