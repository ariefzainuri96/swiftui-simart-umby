//
//  CustomCommonMenu.swift
//  Simart UMBY
//
//  Created by фкшуа on 03/12/24.
//

import SwiftUI

struct CustomCommonMenu: View {
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(Color("#333333"))
                
                Spacer()
                
                Image("ic-chevron-right").frame(width: 16, height: 16)
            }.padding(.vertical, 12).padding(.horizontal, 16)
            
            Divider().frame(height: 0.75).overlay(Color("#EFEFEF"))
        }
    }
}
