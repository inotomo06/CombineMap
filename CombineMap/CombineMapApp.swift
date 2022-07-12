//
//  CombineMapApp.swift
//  CombineMap
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI
import PartialSheet

@main
struct ExampleMapCombineApp: App {
    let sheetManager: PartialSheetManager = PartialSheetManager()
    var body: some Scene {
        WindowGroup {
            FirstView()
                .environmentObject(sheetManager)
        }
    }
}
