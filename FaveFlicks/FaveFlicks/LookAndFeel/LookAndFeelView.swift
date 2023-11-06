//
//  LookAndFeelView.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import SwiftUI


let symbols = ["star", "rectangle", "triangle", "circle"]


struct LookAndFeelView: View {
  
  //TODO: reference the LookAndFeelStore here
    @ObservedObject var lookandFeelStore: LookAndFeelStore
    @State private var accentColor = Color.red
    @State private var symbolName = ""
  //TODO: You'll also need some @State properties here - views below need bindings
  
  var body: some View {
    NavigationView {
      Form {
        Section("Accent Color") {
          ColorPicker("Accent Color", selection: $accentColor)
        }
        Section("Rating Symbol") {
          Picker(selection: $symbolName, label: Text("Symbol")) {
            ForEach(symbols, id: \.self) {
              Text($0)
            }
          }
        }
      }
      .navigationBarTitle(Text("Look and Feel"), displayMode: .inline)
      .navigationBarItems(
        trailing:
          Button(action: { updateLookAndFeelInfo() }
                ) {
            Text("Update")
          }
      )
    }
    //TODO: like the UserView, be sure to update thing in onAppear
      
    .onAppear {
        accentColor = lookandFeelStore.currentLookAndFeelInfo.accentColor
        symbolName = lookandFeelStore.currentLookAndFeelInfo.symbolName
    }
  }
  
  
  func updateLookAndFeelInfo() {
    //TODO: update the store here
      let newLookAndFeelInfo = LookAndFeelInfo(accentColor: accentColor, symbolName: symbolName)
      lookandFeelStore.currentLookAndFeelInfo = newLookAndFeelInfo
  }
}

struct LookAndFeelView_Previews: PreviewProvider {
  static var previews: some View {
      LookAndFeelView(lookandFeelStore: LookAndFeelStore())
  }
}
