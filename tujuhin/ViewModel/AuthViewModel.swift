//
//  AuthViewModel.swift
//  tujuhin
//
//  Created by Tude Maha on 19/09/2025.
//

import Foundation
import JWTDecode

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    @Published var isRegistered = false
    @Published var errorMessage: NSError?
    @Published var isLoading = false
    @Published var user: User?
    
    private let authAPI = AuthAPI()
    private var tokens: Tokens?
    
    init() {
        let at = KeychainAccess.readString("accessToken") ?? ""
        let rt = KeychainAccess.readString("refreshToken") ?? ""
        
        if !at.isEmpty && !rt.isEmpty {
            isLoggedIn = true
            let newToken = Tokens(accessToken: at, refreshToken: rt)
            self.tokens = newToken
            jwtDecode(tokens: newToken)
        }
    }
    
    func register(_ registerData: RegisterData) async {
        isLoading = true
        errorMessage = nil
        
        do {
            try await authAPI.register(registerData)
            isRegistered = true
        } catch let error as NSError {
            self.errorMessage = error
        }
        
        isLoading = false
    }
    
    func login(_ loginData: LoginData) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let tokens = try await authAPI.login(loginData)
            self.tokens = tokens
            
            isLoggedIn = true
            KeychainAccess.save(self.tokens?.accessToken ?? "", account: "accessToken")
            KeychainAccess.save(self.tokens?.refreshToken ?? "", account: "refreshToken")
            
            jwtDecode(tokens: tokens)
        } catch let error as NSError {
            self.errorMessage = error
        }
        
        isLoading = false
    }
    
    func logout() {
        isLoading = true
        
        KeychainAccess.delete("accessToken")
        KeychainAccess.delete("refreshToken")
        
        isLoading  = false
    }
    
    func jwtDecode(tokens: Tokens) {
        do {
            let jwt = try decode(jwt: tokens.accessToken)
//            create new user first before assign to self.user
//            do not do self.user?.xxx, the assigned value still nil
//            imagin like you assign new value to pointer variable in golang
            let newUser = User(
                id: UUID(uuidString: jwt["id"].string ?? "")!,
                name: jwt["name"].string ?? "",
                username: jwt["username"].string ?? ""
            )
            self.user = newUser
        } catch {
            self.errorMessage = error.localizedDescription

        }
    }
}
