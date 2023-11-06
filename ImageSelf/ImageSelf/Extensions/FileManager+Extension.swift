//
//  FileManager+Extension.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import UIKit

let fileName = "MyImages.json"

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
    
    func saveDocument(contents: String) throws {
        let url = Self.docDirURL.appendingPathComponent(fileName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            throw ImageSelfError.saveError
        }
    }
    
    func readDocument() throws -> Data {
        let url = Self.docDirURL.appendingPathComponent(fileName)
        do {
            return try Data(contentsOf: url)
        } catch {
            throw ImageSelfError.readError
        }
    }
    
    func saveImage(_ id: String, image: UIImage) throws {
        if let data = image.jpegData(compressionQuality: 0.6) {
            let imageURL = FileManager.docDirURL.appendingPathComponent("\(id).jpg")
            do {
                try data.write(to: imageURL)
            } catch {
                throw ImageSelfError.saveImageError
            }
        } else {
            throw ImageSelfError.saveImageError
        }
    }
    
    func readImage(with id: UUID) throws -> UIImage {
        let imageURL = FileManager.docDirURL.appendingPathComponent("\(id).jpg")
        do {
            let imageData = try Data(contentsOf: imageURL)
            if let image = UIImage(data: imageData) {
                return image
            } else {
                throw ImageSelfError.readImageError
            }
        } catch {
            throw ImageSelfError.readImageError
        }
    }
}
