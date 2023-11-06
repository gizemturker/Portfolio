//
//  DetectFaces.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import SwiftUI
import Vision


class DetectFaces: ObservableObject {
   var image: UIImage = UIImage()
    @Published var outputImage: UIImage?
    @EnvironmentObject var vm: HomeViewModel
    private var detectedFaces: [VNFaceObservation] = [VNFaceObservation()]
    
    func detectFaces(in image: UIImage) {
        guard let ciImage = CIImage(image: image) else {
            fatalError("Couldn't convert image to ciimage")
        }
        
        let request = VNDetectFaceRectanglesRequest(completionHandler: handleFacesData)
        
//        #if targetEnviroment(simulator)
//        request.usesCPUOnly = true
//        #endif
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        do {
            try handler.perform([request])
        } catch let reqErr {
            print("failed to perform request:", reqErr)
        }
    }
    
    func handleFacesData(request: VNRequest, error: Error?) {
        
        DispatchQueue.main.async {
            guard let results = request.results as? [VNFaceObservation] else {
                return
            }
            self.detectedFaces = results
            for faces in self.detectedFaces {
                self.addFaceRectToImage(result: faces)
            }
            self.outputImage = self.image
        }
    }
    
    func addFaceRectToImage(result: VNFaceObservation) {
        let imageSize = CGSize(width: image.size.width, height: image.size.height)
        
        let boundingBox = result.boundingBox
        let scaledBox = CGRect(
            x: boundingBox.origin.x * imageSize.width,
            y: (1 - boundingBox.origin.y - boundingBox.size.height) * imageSize.height,
            width: boundingBox.size.width * imageSize.width,
            height: boundingBox.size.height * imageSize.height
        )
        
        let normalizedRect = VNNormalizedRectForImageRect(scaledBox, Int(imageSize.width), Int(imageSize.height))
        
        UIGraphicsBeginImageContext(image.size)
        image.draw(at: .zero)
        let context = UIGraphicsGetCurrentContext()!
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(100.0)
        context.stroke(CGRect(x: normalizedRect.origin.x * imageSize.width,
                              y: normalizedRect.origin.y * imageSize.height,
                              width: normalizedRect.size.width * imageSize.width,
                              height: normalizedRect.size.height * imageSize.height))
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
}
