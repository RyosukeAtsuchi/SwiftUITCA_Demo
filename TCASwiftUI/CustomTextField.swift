//
//  CustomTextField.swift
//  TCASwiftUI
//
//  Created by r_atsuchi on 2024/07/04.
//
import SwiftUI
import ComposableArchitecture

struct CustomTextField: View {
    let store: StoreOf<CustomTextFieldFeature>
    let placeholder: String

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                TextField(placeholder, text: viewStore.binding(
                    get: \.text,
                    send: { .binding(.set(\.$text, $0)) }
                ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Submit") {
                    viewStore.send(.submitTapped)
                }
            }
        }
    }
}
