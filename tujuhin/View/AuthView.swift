//
//  LoginView.swift
//  tujuhin
//
//  Created by Tude Maha on 13/09/2025.
//

import SwiftUI

enum AuthInput {
    case name, username, password, passwordRepeat
}

enum ActiveAlert: Identifiable {
    var id: Int { hashValue }
    case loginFailed, registerFailed, registerSuccess
}

struct AuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var loginState: Bool = true
    @State private var activeAlert: ActiveAlert?
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordRepeat: String = ""
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
                        if password.count < 8 {
                            Text("Password must has minimal 8 characters long")
                                .font(.caption)
                        }
                    }
                    
                    if !loginState {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Password Confirmation")
                            SecureField("Password Confirmation", text: $passwordRepeat)
                                .frame(height: 40)
                                .padding(.horizontal, 15)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(currentFocus == .passwordRepeat ? Color.crimsonRed.opacity(0.5) : Color.gray.opacity(0.5))
                                }
                                .focused($currentFocus, equals: .passwordRepeat)
                            if password != passwordRepeat {
                                Text("Password confirmation must the same with password")
                                    .font(.caption)
                            }
                        }
                    }
                }
                
                if authViewModel.isLoading {
                    ProgressView()
                } else {
                    Button {
                        Task {
                            if loginState {
                                let loginData = LoginData(username: username, password: password)
                                await authViewModel.login(loginData)
                                
                                if authViewModel.errorMessage != nil {
                                    activeAlert = .loginFailed
                                }
                            } else {
                                let registerData = RegisterData(
                                    name: name,
                                    username: username,
                                    password: password,
                                    passwordRepeat: passwordRepeat
                                )
                                await authViewModel.register(registerData)
                                if authViewModel.errorMessage != nil {
                                    activeAlert = .registerFailed
                                } else {
                                    activeAlert = .registerSuccess
                                }
                            }
                        }
                    } label: {
                        Text(loginState ? "Login" : "Register")
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(disabledButtonRules() ? .crimsonRed.opacity(0.6) : .crimsonRed)
                            .clipShape(.capsule)
                    }
                    .disabled(disabledButtonRules())
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
            name = ""
            username = ""
            password = ""
            passwordRepeat = ""
            
            if loginState {
                currentFocus = .username
            } else {
                currentFocus = .name
            }
        }
        .onAppear {
            if loginState {
                currentFocus = .username
            } else {
                currentFocus = .name
            }
        }
        .alert(item: $activeAlert) { active in
            switch active {
            case .loginFailed:
                return Alert(
                    title: Text("Login Failed"),
                    message: Text("You have entered an invalid username or password"),
                    dismissButton: .default(Text("OK")) {
                        password = ""
                    }
                )
            case .registerFailed:
                return Alert(
                    title: Text("Register Failed"),
                    message: Text("Username already taken"),
                    dismissButton: .default(Text("OK")) {
                        password = ""
                        passwordRepeat = ""
                    }
                )
            case .registerSuccess:
                return Alert(
                    title: Text("Register Success"),
                    dismissButton: .default(Text("OK")) {
                        name = ""
                        username = ""
                        password = ""
                        passwordRepeat = ""
                        loginState = true
                    }
                )
            }
        }
    }
    
    func disabledButtonRules() -> Bool {
        if loginState {
            return username.isEmpty || password.count < 8
        } else {
            return username.isEmpty || name.isEmpty || password.count < 8 || password != passwordRepeat
        }
    }
}

#Preview {
    AuthView()
}
