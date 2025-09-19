//
//  tujuhinApp.swift
//  tujuhin
//
//  Created by Tude Maha on 10/09/2025.
//

import SwiftUI

@main
struct tujuhinApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authViewModel)
        }
    }
}
