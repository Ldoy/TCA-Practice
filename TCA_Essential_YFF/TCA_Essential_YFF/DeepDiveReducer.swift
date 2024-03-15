//
//  DeepDiveReducer.swift
//  TCA_Essential_YFF
//
//  Created by Do Yi Lee on 3/15/24.
//

import Foundation
import ComposableArchitecture

//Reduce 간단화 해보기
protocol CustomReducer {
    associatedtype State
    associatedtype Action
    
    var reduce: (inout State, Action) -> () { get set }
}

//struct Reduce3<State, Action>: Reducer {
//    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
//        
//    }
//    
//    typealias State = State
//    
//    typealias Action = Action
//    
//    
//}


//MARK: - Reduce 뜯어보기
/*
  State, Action이라는 타입 가지고, Reducer 프로토콜 채택
  Reducer 프로토콜 채택시 State, Action, _Body 타입 정의 하는 것과 reduce 메서드 및 생성자를 구현해야함
  프로그래머가 reduce 상수를 함수/생성자와 동일한 타입으로 구현해줘야함
  이유 -> 프로토콜에 reduce넣으면 var로만 선언해야함
 */

public struct Reduce2<State, Action>: Reducer {

    // @usableFromInline : 다른 모듈에서 접근 불가
  @usableFromInline
    // 리듀스 상수를 가지고 있는데, State, Action 매게변수 직접 이용. 하는 클로져네
  let reduce: (inout State, Action) -> Effect<Action>

    // 이 생성자의 경우 만들때 reduce와 동일한 함수타입을 매게변수로 받는데, 이때 받는 reduce를 셀프에 할당
    // 여기서 말하는 Effect란 뭐냐? 리뷰스를 통해 생성된 결과물 일체를 의미
    // 즉 상태가 변화함에 따라 생기는 모든 결과들(비동기적 결과 - 네트워킹, 캐싱, 등등 / 동기적 결과) 모두를 이 Effect 타입에서 처리
  @usableFromInline
  init(
    internal reduce: @escaping (inout State, Action) -> Effect<Action>
  ) {
    self.reduce = reduce
  }

  /// Initializes a reducer with a `reduce` function.
  ///
  /// - Parameter reduce: A function that is called when ``reduce(into:action:)`` is invoked.
  @inlinable
  public init(_ reduce: @escaping (_ state: inout State, _ action: Action) -> Effect<Action>) {
    self.init(internal: reduce)
  }

  /// Type-erases a reducer.
  ///
  /// - Parameter reducer: A reducer that is called when ``reduce(into:action:)`` is invoked.
  @inlinable
  public init<R: Reducer>(_ reducer: R)
  where R.State == State, R.Action == Action {
    self.init(internal: reducer.reduce)
  }

  @inlinable
  public func reduce(into state: inout State, action: Action) -> Effect<Action> {
    self.reduce(&state, action)
  }
}

