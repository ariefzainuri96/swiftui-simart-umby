//
//  LoginView.swift
//  Simart UMBY
//
//  Created by фкшуа on 15/11/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("umby-logo").frame(width: 148, height: 144).padding(.top, 22)
                
                Text("SIMART").font(.system(size: 24, weight: .semibold)).foregroundStyle(Color("#18469C"))

                Text("Welcome to the Simart UMBY!").font(.system(size: 16, weight: .semibold)).foregroundStyle(Color("#18469C")).padding(.top, 22)

            
            }
        }
    }
}

#Preview {
    LoginView()
}
