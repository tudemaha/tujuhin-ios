//
//  RootView.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var auth: AuthViewModel
    
    var body: some View {
        if auth.isLoggedIn {
            MainView()
        } else {
            AuthView()
        }
            
    }
}

#Preview {
    RootView()
}
