//
//  ParentFeature.swift
//  TCASwiftUI
//
//  Created by r_atsuchi on 2024/07/04.
//

import ComposableArchitecture

struct ParentFeature: Reducer {
    struct State: Equatable {
        var textField: CustomTextFieldFeature.State = .init()
        var submittedText: String = ""
        var path = StackState<Destination.State>()
    }

    enum Action {
        case textField(CustomTextFieldFeature.Action)
        case path(StackAction<Destination.State, Destination.Action>)
        case navigateToScreenA
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .textField(.submitTapped):
                state.submittedText = state.textField.text
                state.textField.text = ""
                return .none
            case .textField:
                return .none
            case .path:
                return .none
            case .navigateToScreenA:
                state.path.append(.screenA(ScreenAReducer.State(dataFromParent: state.submittedText)))
                return .none
            }
        }
        Scope(state: \.textField, action: /Action.textField) {
            CustomTextFieldFeature()
        }
        .forEach(\.path, action: /Action.path) {
            Destination()
        }
    }
}

struct Destination: Reducer {
    enum State: Equatable {
        case screenA(ScreenAReducer.State)
    }

    enum Action {
        case screenA(ScreenAReducer.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: /State.screenA, action: /Action.screenA) {
            ScreenAReducer()
        }
    }
}
