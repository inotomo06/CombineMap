//
//  FirstMap.swift
//  CombineMap
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI
import PartialSheet

// View made like a PartialSheet.
struct FirstView: View {
    var body: some View {
        NavigationView {
            ContentView()
        }
        .addPartialSheet()
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
