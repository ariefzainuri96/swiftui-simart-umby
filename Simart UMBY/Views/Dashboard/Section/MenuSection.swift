//
//  MenuSection.swift
//  Simart UMBY
//
//  Created by фкшуа on 27/11/24.
//

import SwiftUI

struct MenuSection: View {
    let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            LazyVGrid(columns: layout) {
                ForEach(0..<4) { item in
                    MenuItem()
                }
            }
            Spacer()
        }.padding(.all, 16).background(.white).cornerRadius(32, corners: [.topLeft, .topRight])
    }
}

struct MenuItem: View {
    var body: some View {
        VStack {
            Image("ic-manajamen-inventaris").frame(width: 24, height: 24).padding(.all, 10).background(Color("#438AF7")).cornerRadius(1000).padding(.bottom, 8)
            
            Text("Manajemen Inventaris").multilineTextAlignment(.center).font(.system(size: 11, weight: .regular)).foregroundColor(Color("#333333"))
        }
    }
}
