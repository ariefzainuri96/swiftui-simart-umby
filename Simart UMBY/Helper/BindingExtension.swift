//
//  BindingExtension.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import SwiftUI

extension Binding where Value == String {
    /// Create a `Binding<String>` from `Binding<String?>`, providing a default value for `nil`.
    static func fromOptional(_ optional: Binding<String?>, defaultValue: String = "") -> Binding<String> {
        Binding<String>(
            get: { optional.wrappedValue ?? defaultValue },
            set: { optional.wrappedValue = $0.isEmpty ? nil : $0 }
        )
    }
}
