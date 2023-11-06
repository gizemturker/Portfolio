//
//  DetailView.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import SwiftUI

struct DetailView: View {
    @State private var detailTitle = ""
    @State private var notes = ""
    @State private var isCompleted = false
    
    
  @EnvironmentObject var detailStore: DetailStore
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Task Title")) {
          TextField("", text: $detailTitle)
        }
        Section(header: Text("NOTES")) {
            TextField("", text: $notes)
        }
          
          Section(header: Text("Completed")) {
                           Toggle(isOn: $isCompleted) {
                               Text("Completed")
                           }
                       }
      }
    }
    .navigationBarTitle(Text("\(detailTitle) Info"), displayMode: .inline)
    .navigationBarItems(
      trailing:
        Button(action: updateDetailInfo) {
          Text("Update")
        }
    )
    .onAppear {
        if let currentDetailInfo = detailStore.currentDetailInfo {
                       detailTitle = currentDetailInfo.detailTitle
                       notes = currentDetailInfo.notes
                       isCompleted = currentDetailInfo.isCompleted
                   }
    }
  }

  func updateDetailInfo() {
      let newDetailInfo = DetailInfo(detailTitle: detailTitle, notes: notes, isCompleted: isCompleted)
    detailStore.currentDetailInfo = newDetailInfo
    dismiss()
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView()
        .environmentObject(DetailStore())
    }
  }
}
