//
//  TImelineCard.swift
//  tujuhin
//
//  Created by Tude Maha on 11/09/2025.
//

import SwiftUI

struct TImelineCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .center, spacing: 8) {
                Button {
                    
                } label: {
                    Image(systemName: "arrowtriangle.up.circle")
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, _ in
                            width * 0.08
                        }
                        .foregroundStyle(.gray)
                }
                
                Text("5")
                    .font(.title2)
                    .bold()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrowtriangle.down.circle")
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, _ in
                            width * 0.08
                        }
                        .foregroundStyle(.gray)
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Tude Maha")
                        Text("@tudemaha")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                
                Text("Where i can buy kitchen utensils near park 23?")
                    .font(.title3)
                
                Divider()
                
                HStack {
                    Text("1 response(s)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        HStack(alignment: .center, spacing: 4) {
                            Image(systemName: "lightbulb.max")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 18)
                                .bold()
                            
                            Text("Response")
                        }
                        .foregroundStyle(.gray)
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 15))
        .padding([.leading, .top, .trailing], 10)
        .background(.gray)
    }
}

#Preview {
    TImelineCard()
}
