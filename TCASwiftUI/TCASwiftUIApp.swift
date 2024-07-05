//
//  TCASwiftUIApp.swift
//  TCASwiftUI
//
//  Created by r_atsuchi on 2024/07/04.
//

import SwiftUI

@main
struct TCASwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ParentView(store: .init(initialState: .init()){ ParentFeature() })
        }
    }
}
