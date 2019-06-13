//
//  ImageData.swift
//  SubjectSeparators
//
//  Created by Vido Valianto on 6/12/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation
import SwiftUI

class ImageData: Identifiable {
    var imageName: String
    var imageObjectType: String

    init(imageName: String,imageObjectType: String) {
        self.imageName = imageName
        self.imageObjectType = imageObjectType
    }
}
