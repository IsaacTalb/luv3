//
//  ProfileView.swift
//  luv3
//
//  Created by Isaac Talb on 2024/06/04.
//

import SwiftUI

struct ProfileView: View {
    @State private var profileImage = UIImage(systemName: "person.circle")!
    @State private var userName = "User Name"
    @State private var userBio = "This is the bio"
    @State private var contactLink = "Contact Link"

    var body: some View {
        VStack {
            Image(uiImage: profileImage)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding()
                .onTapGesture {
                    // Add action to update profile image
                }

            TextField("Name", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Bio", text: $userBio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Contact Link", text: $contactLink)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
