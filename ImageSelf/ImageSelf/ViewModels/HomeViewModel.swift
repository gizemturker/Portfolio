//
//  HomeViewModel.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: Picker.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?
    @Published var imageName: String = ""
    @Published var isEditing = false
    @Published var selectedImage: ImageSelf?
    @Published var myImages: [ImageSelf] = []
    @Published var showFileAlert = false
    @Published var appError: ImageSelfError.ErrorType?
  

    
    init() {
        print(FileManager.docDirURL.path)
    }
    
    var buttonDisabled: Bool {
        imageName.isEmpty || image == nil
    }
    
    var deleteButtonIsHidden: Bool {
        isEditing || selectedImage == nil
    }
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try Picker.checkPermissions()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
    
    func reset() {
        image = nil
        imageName = ""
        isEditing = false
        selectedImage = nil
    }
    
    func display(_ myImage: ImageSelf) {
        image = myImage.image
        imageName = myImage.name
        selectedImage = myImage
    }
    
    func updateSelected() {
        if let index = myImages.firstIndex(where: {$0.id == selectedImage!.id}) {
            myImages[index].name = imageName
            saveMyImagesJSONFile()
            reset()
        }
    }
    
    func deleteSelected() {
        if let index = myImages.firstIndex(where: {$0.id == selectedImage!.id}) {
            myImages.remove(at: index)
            saveMyImagesJSONFile()
            reset()
        }
    }
    
    func addMyImage(_ name: String, image: UIImage) {
        reset()
        let myImage = ImageSelf(name: name)
        do {
            try FileManager().saveImage("\(myImage.id)", image: image)
            myImages.append(myImage)
            saveMyImagesJSONFile()
            reset()
        } catch {
            showFileAlert = true
            appError = ImageSelfError.ErrorType(error: error as! ImageSelfError)
        }
    }
    
    func saveMyImagesJSONFile() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(myImages)
            let jsonString = String(decoding: data, as: UTF8.self)
            reset()
            do {
                try FileManager().saveDocument(contents: jsonString)
            } catch {
                showFileAlert = true
                appError = ImageSelfError.ErrorType(error: error as! ImageSelfError)
            }
        } catch {
            showFileAlert = true
            appError = ImageSelfError.ErrorType(error: .encodingError)
        }
    }
    
    func loadMyImagesJSONFile() {
        do {
            let data = try FileManager().readDocument()
            let decoder = JSONDecoder()
            do {
                myImages = try decoder.decode([ImageSelf].self, from: data)
            } catch {
                showFileAlert = true
                appError = ImageSelfError.ErrorType(error: .decodingError)
            }
        } catch {
            showFileAlert = true
            appError = ImageSelfError.ErrorType(error: error as! ImageSelfError)
        }
    }
}

