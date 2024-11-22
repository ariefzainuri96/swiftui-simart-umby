//
//  CustomTextField.swift
//  Simart UMBY
//
//  Created by фкшуа on 17/11/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var value: String
    var label: String?
    var hint: String
    var isObsecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            if (label != nil) {
                Text(label!).font(.system(size: 12, weight: .medium)).foregroundStyle(Color("#BFBFBF"))
            }
            
            if (isObsecure) {
                SecureField(hint, text: $value)
                    .font(.system(size: 14, weight: .thin))
                    .foregroundColor(Color("#333333"))
                    .background(Color.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            } else {
                TextField(hint, text: $value)
                    .font(.system(size: 14, weight: .thin))
                    .foregroundColor(Color("#333333"))
                    .background(Color.white)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }
        }
    }
}
