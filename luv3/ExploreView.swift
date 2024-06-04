//
//  ExploreView.swift
//  luv3
//
//  Created by Isaac Talb on 2024/06/04.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Spacer()
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
