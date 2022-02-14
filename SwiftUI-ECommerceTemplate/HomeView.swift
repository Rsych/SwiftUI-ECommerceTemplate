//
//  HomeView.swift
//  SwiftUI-ECommerceTemplate
//
//  Created by Ryan J. W. Kim on 2022/02/13.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .center, spacing: 8) {
                        ForEach(1..<100) { _ in
                            Text("item")
                        }
                    }
                } //: HStack
            } //: ScrollVIew
            .navigationTitle("Catalog")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        } //: NavView
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        HomeView()
        }
    }
}
