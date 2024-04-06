//
//  SplashView.swift
//  SecretLetter
//
//  Created by Daegeon Choi on 4/6/24.
//

import SwiftUI
import AuthenticationServices

struct SplashView: View {
    
    @StateObject var viewModel = SplashViewModel()
    var body: some View {
        ZStack {
            Image(.splashBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                SignInWithAppleButton { request in
                    request.requestedScopes = [.fullName, .email]
                    request.nonce = viewModel.state.enctyptedNonce
                } onCompletion: { result in
                    switch result {
                    case let .success(authorization):
                        switch authorization.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            viewModel.trigger(.signInWithApple(credential: appleIDCredential))
                        default:
                            break
                        }
                    case let .failure(error):
                        print("\(error.localizedDescription)")
                    }
                }
                .frame(width: 330, height: 52)
                
                Spacer()
                    .frame(height: 80)
            }
        }
        .onAppear(perform: { viewModel.trigger(.onAppear) })
    }
}

#Preview {
    SplashView()
}
