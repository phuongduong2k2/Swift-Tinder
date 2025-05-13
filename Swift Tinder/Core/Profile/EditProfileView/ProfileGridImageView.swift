//
//  ProfileGridImageView.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 12/5/25.
//
import PhotosUI
import SwiftUI

struct ProfileGridImageView: View {
    let images: [Image]
    
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0 ..< 6) { index in
                if index < images.count {
                    ZStack {
                        images[index]
                            .resizable()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Button {
                            
                        } label: {
                            Image(.closeCircle)
                        }
                        .offset(x: 50,y: 90)
                        .shadow(radius: 5)
                    }
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 200)
                            .foregroundColor(.gray)
                        PhotosPicker(selection: $pickerItems, matching: .images) {
                            Image(.plusCircle)
                        }
                        .onChange(of: pickerItems) {
                            Task {
                                for image in pickerItems {
                                    guard let loadedImage = try await image.loadTransferable(type: Image.self) else {continue}
                                    selectedImages.append(loadedImage)
                                }
                            }
                        }
                        .offset(x: 50,y: 90)
                        .shadow(radius: 5)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

private extension ProfileGridImageView {
    var columns: [GridItem] {
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible()),
        ]
    }
}

#Preview {
    ProfileGridImageView(images: [Image("user1"), Image("user2"),Image("user3"),Image("user4")])
}
