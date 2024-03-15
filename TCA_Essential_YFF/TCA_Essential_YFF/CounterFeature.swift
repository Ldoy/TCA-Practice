//
//  CounterFeature.swift
//  TCA_Essential_YFF
//
//  Created by Do Yi Lee on 3/15/24.
//

import ComposableArchitecture

/*
 1. Reducer macro를 사용하네 왜? ->
 2. State라는 네스티 타입을 선언하네 왜? -> 요 타입의 변화를 관찰하거야. 왜냐면 이게 MVVM VM처럼 사용자 액션에 따른 값의 변화에 대한것들을 담고있기 때문
 3. Action이라는 것도 선언할거야 왜? -> State의 변경일으키는 요소지. 그러니까 사용자 이벤트에 따른 액션을 정의해
 
 */

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count: Int = 0
    }
    
    enum Action {
        case incrementButtomTapped
        case decrementButtomTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .incrementButtomTapped:
                state.count += 1
                return .none
            case .decrementButtomTapped:
                state.count -= 1
                return .none
            }
        }
    }
}