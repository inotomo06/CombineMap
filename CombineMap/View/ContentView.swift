//
//  ContentView.swift
//  CombineMap
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI
import PartialSheet

struct ContentView: View {
    @StateObject private var mapViewModel = MapViewModel()
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        
        ZStack {
            MapView()
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    // Button to return to original position.
                    Button {
                       
                    } label: {
                        Image(systemName: "dot.circle.and.hand.point.up.left.fill")
                    }
                    .frame(width: 60, height: 60)
                    .background(Color.orange)
                    .cornerRadius(60)
                    .padding(20.0)
                }
                
                HStack {
                    Spacer()
                    // search button
                    Button {
                         mapViewModel.isShowSearch.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .frame(width: 60, height: 60)
                            .background(Color.orange)
                            .cornerRadius(60)
                            .padding(20.0)
                    }
                    .padding(.bottom, 30)
                    .partialSheet(isPresented: $mapViewModel.isShowSearch) {
                        HalfModalView(isShowSearch: $mapViewModel.isShowSearch)
                    }
                }
            } // VStack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
