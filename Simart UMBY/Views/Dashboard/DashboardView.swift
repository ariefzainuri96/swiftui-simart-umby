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
                ZStack {
                    Image("simart-dashboard-bg")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0) // 👈 This will keep other views (like a large text) in the frame
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("SIMART").font(.system(size: 24, weight: .semibold)).foregroundColor(.white)
                            
                            Spacer()
                            
                            Image("ic-notification").frame(width: 16, height: 16).padding(.all, 10).background(
                                Color("#FFFFFF26")
                            ).cornerRadius(1000)
                            
                            Text("S").font(.system(size: 14, weight: .medium)).foregroundColor(.white).frame(width: 36, height: 36).background(Color("#E53C3C")).cornerRadius(1000)
                        }.padding(.top, 10).padding(.horizontal, 16)
                        
                        NewsSection()
                        
                        MenuSection().padding(.top, 10)
                        
                        //                        @Perception.Bindable var _dashboardVM = dashboardVM
                        //
                        //                            NavigationLink(destination: ManajemenInventarisView(rootIsActive: $isActive).environment(dashboardVM), isActive: $isActive) {
                        //                                Text("Manajemen Inventaris")
                        //                            }
                        //
                        //                        Button(action: {
                        //                            appState.logout()
                        //                        }) {
                        //                            Text("Logout")
                        //                        }
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                }
            }
        }
    }
}
