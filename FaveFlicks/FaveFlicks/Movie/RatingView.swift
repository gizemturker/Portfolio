//
//  RatingView.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import SwiftUI

struct RatingView: View {
    
    @ObservedObject var lookAndFeelStore: LookAndFeelStore
    
  let rating: Double

  var fullStarCount: Int {
    Int(rating / 1)
  }

  var hasHalfStar: Bool {
    rating.truncatingRemainder(dividingBy: 1) != 0
  }

  var body: some View {
    HStack {
      ForEach(0..<fullStarCount, id: \.self) { _ in
          Image(systemName: "\(lookAndFeelStore.currentLookAndFeelInfo.symbolName).fill")
      }
      if hasHalfStar {
          Image(systemName: "\(lookAndFeelStore.currentLookAndFeelInfo.symbolName).lefthalf.fill")
      }
    }
    .foregroundColor(.accentColor)
  }
}

struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
      RatingView(lookAndFeelStore: LookAndFeelStore(), rating: 4.5)
  }
}
