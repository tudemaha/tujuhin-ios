//
//  Vote.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct Vote: View {
    @Binding var score: Int
    @Binding var currentVote: VoteState
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Button {
                if currentVote == .up {
                    score -= 1
                    currentVote = .none
                } else if currentVote == .down {
                    score += 2
                    currentVote = .up
                } else {
                    score += 1
                    currentVote = .up
                }
            } label: {
                Image(
                    systemName:
                        currentVote == .up ?
                    "arrowtriangle.up.circle.fill" :
                        "arrowtriangle.up.circle"
                )
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { width, _ in
                    width * 0.08
                }
                .foregroundStyle(currentVote == .up ? .crimsonRed : .gray)
            }
            
            Text(String(score))
                .font(.title2)
                .bold()
            
            Button {
                if currentVote == .down {
                    score += 1
                    currentVote = .none
                } else if currentVote == .up {
                    score -= 2
                    currentVote = .down
                } else {
                    score -= 1
                    currentVote = .down
                }
            } label: {
                Image(
                    systemName:
                        currentVote == .down ?
                    "arrowtriangle.down.circle.fill" :
                        "arrowtriangle.down.circle"
                )
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, _ in
                        width * 0.08
                    }
                    .foregroundStyle(currentVote == .down ? .crimsonRed : .gray)
            }
        }
    }
}

#Preview {
    Vote(
        score: .constant(1),
        currentVote: .constant(.none)
    )
}
