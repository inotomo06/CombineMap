//
//  HalfModalView.swift
//  CombineMap
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI

struct HalfModalView: View {
    @State var searchWord = ""
    @Binding var isShowSearch: Bool
    @StateObject var viewModel = MapViewModel()
    
    var body: some View {
        
        GeometryReader { _ in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Please enter the name of the place", text: $searchWord) {
                        print(searchWord)
                        isShowSearch = false
                        searchWord = ""
                    }
                }
                .padding()
                .background(Color(.systemGray4))
                .cornerRadius(17)
                .padding()
                .keyboardType(.webSearch)
            }
        }
        .frame(height: 350)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct HalfModal_Previews: PreviewProvider {
    static var previews: some View {
        HalfModalView(isShowSearch: .constant(true))
    }
}
