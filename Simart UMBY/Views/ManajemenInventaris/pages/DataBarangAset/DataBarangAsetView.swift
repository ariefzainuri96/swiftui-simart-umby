//
//  DataBarangAsetView.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception

struct DataBarangAsetView: View {
    @Environment(DashboardVM.self) var dashboardVM
    @Binding var shouldPopToRootView: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Data Barang Aset")
            
            Button(action: {
                shouldPopToRootView = false
            }) {
                Text("Back to route")
            }
        }.frame(maxWidth: .infinity)
    }
}
