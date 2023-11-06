//
//  TextViews.swift
//  TaskList
//
//  Created by Gizem Turker on 3.10.2023.
//

import SwiftUI

struct TaskText: View {
  var text: String

  var body: some View {
    Text(text)
          .font(.title2)
          .fontWeight(.bold)
          .foregroundStyle(Color.blue)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      TaskText(text: "Instructions")
      
    }
  }
}
