//
//  DashboardView.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import SwiftUI
import Perception

struct DashboardView: View {
    @Environment(AppState.self) var appState
    
    @State var dashboardVM = DashboardVM()
    @State var isActive: Bool = false
    
    var body: some View {
        WithPerceptionTracking {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Dashboard")
                        
                        @Perception.Bindable var _dashboardVM = dashboardVM
                        
                        NavigationLink(destination: ManajemenInventarisView(rootIsActive: $isActive).environment(dashboardVM), isActive: $isActive) {
                            Text("Manajemen Inventaris")
                        }
                        
                        Button(action: {
                            appState.logout()
                        }) {
                            Text("Logout")
                        }
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading).padding(.horizontal, 16)
                }.navigationTitle("Dashboard").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
