//
//  ManajemenInventaris.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception

struct ManajemenInventarisView: View {
    @Environment(DashboardVM.self) var dashboardVM
    @Binding var rootIsActive: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Manajemen Inventaris")
                
                @Perception.Bindable var _dashboardVM = dashboardVM
                
                NavigationLink(destination: DataBarangAsetView(shouldPopToRootView: $rootIsActive).environment(dashboardVM)) {
                    Text("Data Barang Aset")
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.navigationTitle("Manajemen Inventaris").navigationBarTitleDisplayMode(.inline)
    }
}
