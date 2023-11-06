//
//  ImageSelfError.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import SwiftUI

enum ImageSelfError: Error, LocalizedError {
    case readError
    case decodingError
    case encodingError
    case saveError
    case saveImageError
    case readImageError

    
    var errorDescription: String? {
        switch self {
        case .readError:
            return NSLocalizedString("Could not load MyImage.json, please reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your list of images, please create a new image to start over.", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save your MyImage data, please reinstall the app.", comment: "")
        case .saveError:
            return NSLocalizedString("Could not save the My Image json file.  Please reinstall the app.", comment: "")
        case .saveImageError:
            return NSLocalizedString("Could not save image.  Please reinstall the app.", comment: "")
        case .readImageError:
            return NSLocalizedString("Could not load image.  Please reinstall the app.", comment: "")
            
        }
    }
    
    struct ErrorType: Identifiable {
        let id = UUID()
        let error: ImageSelfError
        var message: String {
            error.localizedDescription
        }
        let button = Button("OK", role: .cancel) {}
    }
}
