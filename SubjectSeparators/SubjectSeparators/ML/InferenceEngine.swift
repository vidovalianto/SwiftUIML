//
//  InferenceEngine.swift
//  SubjectSeparators
//
//  Created by Vido Valianto on 6/11/19.
//  Copyright © 2019 Vido Valianto. All rights reserved.
//

import CoreML
import Combine
import Foundation
import SwiftUI
import UIKit
import Vision

class InferenceEngine: BindableObject {
    init(image: String) {
        self.imageData.imageName = image
        self.detectObject(uiImage: image)
    }

    var imageData = ImageData(imageName: "", imageObjectType: "Loading") {
        didSet {
            print(imageData.imageObjectType,"SET")
            didChange.send(self)
        }
    }

    let didChange = PassthroughSubject<InferenceEngine, Never>()


    func detectObject(uiImage: String){

        guard let image = CIImage(image: UIImage(named: uiImage)!) else {
            fatalError("couldn't convert UIImage to CIImage")
        }

        var objectType: String = "Loading"
        guard let model = try? VNCoreMLModel(for: SqueezeNet().model) else {
            fatalError("can't load ML model")
        }

        //     Create a Vision request with completion handler
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation],
                let topResult = results.first else {
                    fatalError("unexpected result type from VNCoreMLRequest")
            }



            DispatchQueue.main.async {
                objectType = topResult.identifier
//                print(objectType,Int(topResult.confidence * 100))
                let imageDatas = ImageData(imageName: "bucket1", imageObjectType: objectType)
                self?.imageData = imageDatas
            }
        }

        let handler = VNImageRequestHandler(ciImage: image)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                print(error)
            }
        }
    }




}
