//
//  ContentView.swift
//  luv3
//
//  Created by Isaac Talb on 2024/06/04.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    BlogPostsView()
                    Spacer()
                    FooterMenu()
                }
                .navigationBarTitle(showMenu ? "" : "Home", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                })

                if showMenu {
                    HamburgerMenu()
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

struct HamburgerMenu: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "house")
                Text("Home")
                    .font(.headline)
            }
            .padding(.top, 100)

            HStack {
                Image(systemName: "magnifyingglass")
                Text("Explore")
                    .font(.headline)
            }
            .padding(.top, 20)

            HStack {
                Image(systemName: "bell")
                Text("Notifications")
                    .font(.headline)
            }
            .padding(.top, 20)

            HStack {
                Image(systemName: "person")
                Text("Profile")
                    .font(.headline)
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}

struct FooterMenu: View {
    var body: some View {
        HStack {
            Spacer()
            FooterMenuItem(icon: "house", title: "Home")
            Spacer()
            FooterMenuItem(icon: "magnifyingglass", title: "Explore")
            Spacer()
            FooterMenuItem(icon: "bell", title: "Notifications")
            Spacer()
            FooterMenuItem(icon: "person", title: "Profile")
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

struct FooterMenuItem: View {
    let icon: String
    let title: String

    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(title)
                .font(.caption)
        }
    }
}

#Preview {
    ContentView()
}
