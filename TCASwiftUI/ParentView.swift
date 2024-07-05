//
//  ParentView.swift
//  TCASwiftUI
//
//  Created by r_atsuchi on 2024/07/04.
//
import SwiftUI
import ComposableArchitecture

struct ParentView: View {
    let store: StoreOf<ParentFeature>

    var body: some View {
        NavigationStackStore(
            self.store.scope(state: \.path, action: { .path($0) })
        ) {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                VStack {
                    CustomTextField(
                        store: self.store.scope(
                            state: \.textField,
                            action: ParentFeature.Action.textField
                        ),
                        placeholder: "Enter text"
                    )
                    Text("Submitted Text: \(viewStore.submittedText)")
                    Button("GOtoScreenA") {
                        viewStore.send(.navigateToScreenA)
                    }
                }
            }
        } destination: { state in
            switch state {
            case .screenA:
                CaseLet(/Destination.State.screenA,
                        action: Destination.Action.screenA,
                        then: ScreenAView.init
                )
            }
        }
    }
}
