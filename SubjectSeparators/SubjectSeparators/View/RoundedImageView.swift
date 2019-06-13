//
//  RoundedImageView.swift
//  SubjectSeparators
//
//  Created by Vido Valianto on 6/12/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import SwiftUI

struct RoundedImageView : View {
    var imageName = ""

    var body: some View {
        Group{
            Image(uiImage: (imageName == "") ? UIImage(color: .gray)! : UIImage(named: imageName)!)
                .resizable()
                .frame(width: 200, height: 200, alignment:.center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
