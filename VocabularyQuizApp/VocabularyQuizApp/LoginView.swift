//
//  LoginView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 22.08.2023.
//

import SwiftUI

struct LoginView: View {
    
    
    var body: some View {
        VStack {

            Text("welcome welcome")

            Button(action: {
              
            }, label: {
                Text("Sign in with Apple")
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding(.bottom, 10)
            
            Button(action: {
                // Handle login with Google
            }, label: {
                Text("Sign in with Google")
                    .font(.headline)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding(.bottom, 10)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
