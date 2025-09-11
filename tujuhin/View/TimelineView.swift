//
//  TimelineView.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TImelineCard()
                TImelineCard()
                TImelineCard()
                TImelineCard()
                TImelineCard()
            }
        }
        .background(.gray)
    }
}

#Preview {
    TimelineView()
}
