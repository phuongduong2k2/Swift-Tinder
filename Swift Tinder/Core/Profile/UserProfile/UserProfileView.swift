//
//  UserProfileView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 11/5/25.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @State private var currentImageIndex: Int = 0
    @Binding var showProfileModal: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Button {
                    showProfileModal.toggle()
                } label: {
                    Image(.close)
                }
            }.padding(.horizontal)
            ScrollView {
                ZStack(alignment: .top) {
                    Image(user.profileImageUrls[currentImageIndex])
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            ImageScrollingOverlay(
                                currentImageIndex: $currentImageIndex,
                                imageCount: imageCount)
                        )
                    
                    CardImageIndicatorView(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                }
                
                VStack(alignment: .leading) {
                    Text("About me")
                        .fontWeight(.bold)
                    Text("Bla bla")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                
                VStack(alignment: .leading) {
                    Text("Essentials")
                        .fontWeight(.bold)
                    HStack {
                        Image(.user)
                        Text("Sex")
                    }
                    HStack {
                        Image(.map)
                        Text(user.location)
                    }
                    HStack {
                        Image(.book)
                        Text("Entertainment")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                
                VStack(alignment: .leading) {
                    Text("Looking for")
                        .fontWeight(.bold)
                    Text("😍😍😍😍")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                
                Button {
                    
                } label: {
                    Text("Block \(user.fullName)")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                
                Button {
                    
                } label: {
                    Text("Report \(user.fullName)")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
            }
            .scrollIndicators(.hidden)
        }
    }
}

private extension UserProfileView {
    var imageCount: Int {
        return user.profileImageUrls.count
    }
}

#Preview {
    UserProfileView(user: MockData.users[0], showProfileModal: .constant(false))
}
