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
        // output
        case submit(keyword: String?)
        // private
        case binding(BindingAction<State>)
        case didTapSubmitbutton
    }

    var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .submit(_):
                return .none
            case .binding:
                return .none
            case .didTapSubmitbutton:
                let keyword = state.text
                return .run { send in
                    await send(.submit(keyword: keyword))
                }
            }
        }
    }
}
