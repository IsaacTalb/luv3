//
//  ContentView.swift
//  luv3
//
//  Created by Isaac Talb on 2024/06/04.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab: Tab = .home

    enum Tab {
        case home, explore, notifications, profile
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    switch selectedTab {
                                        case .home:
                                            BlogPostsView()
                                        case .explore:
                                            ExploreView()
                                        case .notifications:
                                            NotificationsView()
                                        case .profile:
                                            ProfileView()
                                        }
                                        Spacer()
                                        FooterMenu(selectedTab: $selectedTab)
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
                    HamburgerMenu(selectedTab: $selectedTab, showMenu: $showMenu)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}

struct HamburgerMenu: View {
    @Binding var selectedTab: ContentView.Tab
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Button (action: {
                withAnimation {
                selectedTab = .home
                showMenu = false
                }
            }) {
                HStack {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.headline)
                }
            }
            .padding(.top, 100)
            
            Button (action: {
                withAnimation {
                    selectedTab = .explore
                    showMenu = false
                }
            }) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                        .font(.headline)
                }
            }
            .padding(.top, 20)
            
            Button (action: {
                withAnimation {
                    selectedTab = .notifications
                    showMenu = false
                }
            }) {
                HStack {
                    Image(systemName: "bell")
                    Text("Notifications")
                        .font(.headline)
                }
            }
            .padding(.top, 20)
            
            Button  (action: {
                withAnimation {
                    selectedTab = .profile
                    showMenu = false
                }
            }) {
                HStack {
                    Image(systemName: "person")
                    Text("Profile")
                        .font(.headline)
                }
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
    @Binding var selectedTab: ContentView.Tab
    var body: some View {
        HStack {
            Spacer()
            FooterMenuItem(icon: "house", title: "Home", action: {
                            selectedTab = .home
            })
            Spacer()
            FooterMenuItem(icon: "magnifyingglass", title: "Explore" , action: {
                selectedTab = .explore
            })
            Spacer()
            FooterMenuItem(icon: "bell", title: "Notifications", action: {
                selectedTab = .notifications
            })
            Spacer()
            FooterMenuItem(icon: "person", title: "Profile" , action: {
                selectedTab = .profile
            })
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
    }
}

struct FooterMenuItem: View {
    let icon: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            VStack {
                Image(systemName: icon)
                Text(title)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    ContentView()
}
