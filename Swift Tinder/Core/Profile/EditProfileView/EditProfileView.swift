//
//  EditProfileView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 12/5/25.
//

import SwiftUI

struct EditProfileView: View {
    @Binding var showEditProfile: Bool
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack {
                        Circle().frame(width: 160, height: 160).foregroundColor(.white).shadow(radius: 10)
                        Image(.user1)
                            .resizable()
                            .scaledToFill()
                            .clipShape(.circle)
                            .frame(width: 150, height: 150)
                        Image(.edit)
                            .frame(width: 40, height: 40)
                            .background {
                                Circle().foregroundColor(.white)
                            }
                            .offset(x: 55, y: -55)
                            .shadow(radius: 5)
                    }
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity)
                    Text("\(user.fullName), \(user.age)")
                        .font(.system(size: 25))
                    ProfileGridImageView(images: user.profileImageUrls.map { Image($0) })
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showEditProfile = false
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showEditProfile = false
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(showEditProfile: .constant(true), user: MockData.users[0])
}
