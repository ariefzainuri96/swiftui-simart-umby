//
//  Profile.swift
//  Simart UMBY
//
//  Created by фкшуа on 30/11/24.
//

import SwiftUI
import Perception

struct ProfileView: View {
    @Environment(AppState.self) var appState
    
    let profileVM = ProfileVM()
    
    var body: some View {
        WithPerceptionTracking {
            @Perception.Bindable var _profileVM = profileVM
            
            ScrollView {
                VStack(spacing: 8) {
                    CustomTextField(value: $_profileVM.profileData.namaLengkap, label: "Nama Lengkap", disabled: true)
                    
                    CustomButton(title: "Logout", backgroundColor: .red) {
                        appState.logout()
                    }
                }.padding(.horizontal, 16)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await profileVM.getProfileData()
            }
            .onDisappear {
                profileVM.resetData()
            }
        }
    }
}
