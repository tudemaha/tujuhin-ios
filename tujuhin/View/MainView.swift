//
//  MainView.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            Tab(value: 0) {
                NavigationStack {
                    TimelineView()
                        .navigationTitle("Timeline")
                }
            } label: {
                TabLabel(tabSelection: tabSelection, currentTab: 0, name: "Timeline", icon: "house")
            }
            
            Tab(value: 1) {
                NavigationStack {
                    TimelineView()
                        .navigationTitle("Create Question")
                }
            } label: {
                TabLabel(tabSelection: tabSelection, currentTab: 1, name: "Create", icon: "plus.circle")
            }
            
            Tab(value: 2) {
                NavigationStack {
                    TimelineView()
                        .navigationTitle("Profile")
                }
            } label: {
                TabLabel(tabSelection: tabSelection, currentTab: 2,  name: "Profile", icon: "person.circle")
            }
        }
        .tint(.crimsonRed)
    }
}

struct TabLabel: View {
    var tabSelection: Int
    var currentTab: Int
    var name: String
    var icon: String
    
    var body: some View {
        Label {
            Text(name)
        } icon: {
            Image(systemName: icon)
                .environment(\.symbolVariants, tabSelection == currentTab ? .fill : .none)
        }
    }
}

#Preview {
    MainView()
}
