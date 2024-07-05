//
//  ScreenA.swift
//  TCASwiftUI
//
//  Created by r_atsuchi on 2024/07/05.
//

import SwiftUI
import ComposableArchitecture

struct ScreenAView: View {
    let store: StoreOf<ScreenAReducer>

    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            Text("Data from parent: \(viewStore.dataFromParent)")
        }
    }
}

struct ScreenAReducer: Reducer {
    struct State: Equatable {
        let dataFromParent: String
    }

    enum Action: Equatable {
        // 必要に応じてアクションを追加
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            // 必要に応じてロジックを実装
            return .none
        }
    }
}
