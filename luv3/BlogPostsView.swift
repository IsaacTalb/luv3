//
//  BlogPostsView.swift
//  luv3
//
//  Created by Isaac Talb on 2024/06/04.
//

import SwiftUI
//
//struct BlogPostsView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct BlogPostsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(1..<6) { index in
                    BlogPostView(title: "Blog Post \(index)", content: "This is the content of blog post \(index).")
                        .padding()
                }
            }
        }
        .padding(.top, 16)
    }
}

struct BlogPostView: View {
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            Text(content)
                .font(.body)
                .padding(.top, 4)
            HStack {
                Spacer()
                Button(action: share) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(8)
    }

    func share() {
        let textToShare = [title, content]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityViewController, animated: true, completion: nil)
        }
    }
}


//
//#Preview {
//    BlogPostsView()
//}
//
