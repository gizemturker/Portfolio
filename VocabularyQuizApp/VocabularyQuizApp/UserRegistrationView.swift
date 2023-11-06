//
//  UserRegistrationView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 22.08.2023.
//

import SwiftUI

struct UserRegistrationView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
     
            
            Button(action: {
                
            }, label: {
                Text("Login with Apple")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            
            Button(action: {
              
            }, label: {
                Text("Login with Google")
                    .font(.headline)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            
            Button(action: {
               
            }, label: {
                Text("Login with Twitter")
                    .font(.headline)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .padding()
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
