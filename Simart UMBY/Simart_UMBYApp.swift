//
//  Simart_UMBYApp.swift
//  Simart UMBY
//
//  Created by фкшуа on 06/11/24.
//

import SwiftUI
import Perception

@main
struct Simart_UMBYApp: App {
//    let viewModel = LandmarkVM()
    
    var body: some Scene {
        WindowGroup {
//            LandmarkList().environment(viewModel)
            LoginView()
        }
    }
}
