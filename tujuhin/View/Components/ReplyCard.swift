//
//  ReplyCard.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct ReplyCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Orang Asing")
                            .font(.caption)
                        Text("@orangasing")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                
                HStack {
                    Text("@bagusdeva")
                        .foregroundStyle(.crimsonRed)
                    Text("yess right!")
                }
                
                HStack(alignment: .center) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowtriangle.up.fill")
                                .foregroundStyle(.gray)
                        }
                        
                        Text("0")
                            .foregroundStyle(.gray)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowtriangle.down.fill")
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    Divider()
                        .frame(width: 10, height: 15)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.turn.up.left")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Divider()
        }
    }
}

#Preview {
    ReplyCard()
}
