//
//  CurrentProfile.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 11/5/25.
//

import SwiftUI

struct CurrentProfile: View {
    @State private var progress: Double = 0.64
    @State private var showEditProfile: Bool = false
    
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(.logo)
                ZStack {
                    Circle().stroke(Utils.rgb(229, 229, 229), lineWidth: 5).frame(width: 220, height: 220).padding(5)
                    
                    Circle().trim(from: 0, to: progress).stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [.pink, .orange]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: 6, lineCap: .round)
                    )
                    .rotationEffect(.degrees(90))
                    .frame(width: 220, height: 220)
                    .padding(5)
                    
                    Image(.user1)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    
                    Text("\(Int(progress*100))% COMPLETE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(LinearGradient(colors: [Utils.rgb(234, 64, 128), Utils.rgb(238, 128, 95)], startPoint: .leading, endPoint: .trailing))
                        .clipShape(Capsule())
                        .padding(.top, 200)
                }
                Text("\(user.fullName), \(user.age)").font(.title).fontWeight(.bold)
                HStack(alignment: .top) {
                    Button {
                        // Press setting
                    } label: {
                        VStack {
                            Image(.setting)
                                .frame(width: 50, height: 50)
                                .background(Circle().foregroundColor(.white).shadow(radius: 6, y: 5))
                            Text("SETTINGS")
                        }
                    }
                    Spacer()
                    Button {
                        showEditProfile = true
                    } label: {
                        VStack {
                            Image(.edit)
                                .frame(width: 70, height: 70)
                                .background(Circle().foregroundColor(.white).shadow(radius: 6, y: 5))
                            Text("EDIT PROFILE")
                        }
                    }
                    .padding(.top, 10)
                    Spacer()
                    Button {
                        // Press safety
                    } label: {
                        VStack {
                            Image(.shield)
                                .frame(width: 50, height: 50)
                                .background(Circle().foregroundColor(.white).shadow(radius: 6, y: 5))
                            Text("SAFETY")
                        }
                    }
                }
                .foregroundColor(Utils.rgb(104, 112, 126))
                .font(.headline)
                .padding(.horizontal, 40)
                .frame(maxWidth: .infinity)
            }
            .background {
                Circle()
                    .frame(width: 1000, height: 10000)
                    .foregroundColor(.white)
                    .offset(y: -200)
                    .shadow(radius: 30)
            }
            VStack {
                HStack(alignment: .center) {
                    Image(.activeFlame)
                    VStack {
                        Text("Tinder Plantium")
                            .font(.system(size: 27))
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(LinearGradient(colors: [Utils.rgb(234, 64, 128), Utils.rgb(238, 128, 95)], startPoint: .leading, endPoint: .trailing))
                }
                Text("Level up every action you take on Tinder")
            }
            .padding(.top, 100)
        }
        .background(Utils.rgb(245, 247, 250))
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(showEditProfile: $showEditProfile, user: user)
        })
    }
}

#Preview {
    CurrentProfile(user: MockData.users[0])
}
