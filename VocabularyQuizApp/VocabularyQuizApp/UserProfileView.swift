//
//  UserProfileView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 22.08.2023.
//

import SwiftUI

struct UserProfileView: View {
    var username: String
    var email: String
    var achievements: [String]
    
    @State private var profileImage: Image? = Image(systemName: "person.circle.fill")
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Avatar Adventure")
                .font(.title)
                .foregroundColor(.blue)
            
            profileImage?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                .onTapGesture {
                    isImagePickerPresented = true
                }
                .sheet(isPresented: $isImagePickerPresented) {
                   
                }
            
            Text("Username: \(username)")
                .font(.headline)
                .foregroundColor(.blue)
            
            Text("Achievements:")
                .font(.headline)
                .padding(.top)
            
            ForEach(achievements, id: \.self) { achievement in
                Text(achievement)
                    .font(.body)
                    .foregroundColor(.green)
            }
            
            ProgressTrackingSection()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

struct ProgressTrackingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Progress Tracking")
                .font(.headline)
                .foregroundColor(.blue)
            
            Text("Total Words Learned: 250")
            Text("Correct Answers: 180")
            Text("Success Rate: 72%")
         
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(username: "gizemturker", email: "gizem@example.com", achievements: ["Level 1", "Level 2"])
    }
}
