//
//  ViewExtension.swift
//  SubjectSeparators
//
//  Created by Vido Valianto on 6/12/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else {
            return nil }
        self.init(cgImage: cgImage)
    }
}
