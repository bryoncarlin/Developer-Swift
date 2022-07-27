//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/25/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = CardView()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
