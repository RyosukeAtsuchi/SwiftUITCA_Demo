//
//  CustomTextFieldFeature.swift
//  TCASwiftUI
//
//  Created by r_atsuchi on 2024/07/04.
//

import ComposableArchitecture

struct CustomTextFieldFeature: Reducer {
    struct State: Equatable {
        @BindingState var text: String = ""
    }

    enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case submitTapped
    }

    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
            case .submitTapped:
                return .none
            }
        }
    }
}
