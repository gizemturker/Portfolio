//
//  ImageSelf.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import UIKit

struct ImageSelf: Identifiable, Codable {
    var id = UUID()
    var name: String
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}
