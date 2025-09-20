//
//  LoginView.swift
//  tujuhin
//
//  Created by Tude Maha on 13/09/2025.
//

import SwiftUI

enum AuthInput {
    case name, username, password
}

struct AuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var loginState: Bool = true
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @FocusState private var currentFocus: AuthInput?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Text("\(loginState ? "Welcome" : "Register") to Tujuhin!")
                .font(.title.bold())
            
            Spacer()
            
            VStack(spacing: 25) {
                VStack(spacing: 15) {
                    if !loginState {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Name")
                            TextField("Name", text: $name)
                                .frame(height: 40)
                                .padding(.horizontal, 15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(currentFocus == .name ? Color.crimsonRed.opacity(0.5) : Color.gray.opacity(0.5))
                                }
                                .focused($currentFocus, equals: .name)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Username")
                        TextField("Username", text: $username)
                            .frame(height: 40)
                            .padding(.horizontal, 15)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(currentFocus == .username ? Color.crimsonRed.opacity(0.5) : Color.gray.opacity(0.5))
                            }
                            .focused($currentFocus, equals: .username)
                            .textInputAutocapitalization(.never)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Password")
                        SecureField("Password", text: $password)
                            .frame(height: 40)
                            .padding(.horizontal, 15)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(currentFocus == .password ? Color.crimsonRed.opacity(0.5) : Color.gray.opacity(0.5))
                            }
                            .focused($currentFocus, equals: .password)
                    }
                }
                
                if authViewModel.isLoading {
                    ProgressView()
                } else {
                    Button {
                        if loginState {
                            Task {
                                let loginData = LoginData(username: username, password: password)
                                await authViewModel.login(loginData)
                            }
                        }
                    } label: {
                        Text(loginState ? "Login" : "Register")
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(.crimsonRed)
                            .clipShape(.capsule)
                    }
                }
                
                
                HStack(spacing: 5) {
                    Text(loginState ? "Don't have an account?" : "Already have account?")
                    Text(loginState ? "Register" : "Login")
                        .foregroundStyle(.crimsonRed)
                        .onTapGesture {
                            loginState.toggle()
                        }
                }
            }
            
            Spacer()
            Spacer()
        }
        .padding(.horizontal, 40)
        .onChange(of: loginState) {
            if loginState {
                currentFocus = .username
            } else {
                currentFocus = .name
            }
        }
    }
}

#Preview {
    AuthView()
}
