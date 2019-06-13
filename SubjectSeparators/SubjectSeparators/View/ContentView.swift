//
//  ContentView.swift
//  SubjectSeparators
//
//  Created by Vido Valianto on 6/11/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentView : View {
    @State var images = InferenceEngine(image: "bucket1")

    var body: some View {
        NavigationView {
            Text("").navigationBarTitle(Text("What Are Those???")
                .font(.largeTitle))
            VStack {
                RoundedImageView(imageName: images.imageData.imageName)
                    .padding(.bottom,50)
                Image(uiImage: UIImage(color: .lightGray)!)
                    .resizable()
                    .opacity(0.2)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        VStack {
                            Text("This Is A")
                                .font(.headline)
                            Text(images.imageData.imageObjectType)
                                .font(.largeTitle)
                                .bold()
                            }.padding(20)
                    )
                Button(action: {
                    self.pickImage()
                }) {
                    Text("Pick Image")
                        .font(.headline)
                        .bold()
                    }.padding(20)
                    .background(Image(uiImage: UIImage(color: .lightGray)!)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 10)).opacity(0.2))
                    .padding(.top, 50)
                }.padding(40)
        }

    }

    func pickImage(){
        print("buttonClicked")
        ImagePickerManager().pickImage(UIHostingController(rootView: self)){ image in
            print(image)
        }
    }
}
