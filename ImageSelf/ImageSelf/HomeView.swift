//
//  HomeView.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @FocusState var nameField:Bool
  
    @ObservedObject var faceDetector = DetectFaces()
    
    var body: some View {
        NavigationView {
            VStack {
                if !vm.isEditing {
                    imageScroll
                }
                selectedImage
                VStack {
                    if vm.image != nil {
                       editGroup
                    }
                    if !vm.isEditing {
                        pickerButtons
                    }
                    if faceDetector.outputImage != nil {
                        Image(uiImage: faceDetector.outputImage!)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(uiImage: vm.image ?? UIImage(named: "img1")!)
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Button("Detect Face") {
                        if let selectedImage = vm.image {
                            faceDetector.detectFaces(in: selectedImage)
                        } else {
                            print("No image selected.")
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .task {
                if FileManager().docExist(named: fileName) {
                    vm.loadMyImagesJSONFile()
                }
            }
            .sheet(isPresented: $vm.showPicker) {
                ImagePicker(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $vm.showFileAlert, presenting: vm.appError, actions: { cameraError in
                cameraError.button
            }, message: { cameraError in
                Text(cameraError.message)
            })
            .navigationTitle("Create AI Image")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            nameField = false
                        } label : {
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}
