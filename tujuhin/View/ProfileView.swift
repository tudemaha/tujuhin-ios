//
//  ProfileView.swift
//  tujuhin
//
//  Created by Tude Maha on 12/09/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showLogoutAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text(authViewModel.user?.name ?? "")
                    .font(.title2)
                    .bold()
                
                Text("@\(authViewModel.user?.username ?? "")")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            
            Button {
                showLogoutAlert = true
            } label: {
                Text("Logout")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.crimsonRed)
                    .clipShape(.capsule)
            }
        }
        .alert("Are you sure to log out?", isPresented: $showLogoutAlert) {
            Button("Logout", role: .destructive) {
                authViewModel.logout()
                authViewModel.isLoggedIn = false
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("You will need to relog in to use the app")
        }
    }
}

#Preview {
    ProfileView()
}
