//
//  MeowMixHeader.swift
//  RepeatViews Stacks
//
//  Created by Gizem Turker on 30.09.2023.
//

import SwiftUI

struct MeowMixHeader: View {
  var body: some View {
    HStack(alignment: .bottom, spacing: 20) {
      Thumbnail()
      VStack(alignment: .leading) {
        MixDescription()
        Buttons()
      }
    }
    .frame(minHeight: 150, maxHeight: 250)
  }
}

struct Thumbnail: View {
  var body: some View {
    ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
      ZStack {
        RoundedRectangle(cornerRadius: 12)
          .foregroundColor(.orange)
          .aspectRatio(1, contentMode: .fit)
          .shadow(radius: 10)
        
        Image(systemName: "play.fill")
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.white)
          .opacity(0.4)
      }
      
      VStack(alignment: .leading) {
        Text("Meow!")
          .font(.largeTitle)
          .fontWeight(.black)
        Text("Mix")
          .font(.largeTitle)
        
        Spacer()
      }
      .foregroundColor(.white)
      .padding()
    }
  }
}

struct MixDescription: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20.0) {
      VStack(alignment: .leading) {
        Text("Meow! Mix")
          .font(.title)
          .fontWeight(.semibold)
        Text("Music for Luna")
          .font(.title)
          .fontWeight(.light)
          .foregroundColor(.accentColor)
        Text("Updated Caturday")
          .font(Font.system(.body).smallCaps())
      }
      
      Text("Whether you're a kitten or an old-timer, get meowing with this purrsonalized mix of music to meow to!")
    }
  }
}

struct Buttons: View {
  var body: some View {
    HStack(spacing: 20.0) {
      Button { print("Play!") }
        label: { ButtonLabel(title: "Play", systemImage: "play.fill") }
      
      Button { print("Shuffle!") }
        label: { ButtonLabel(title: "Shuffle", systemImage: "shuffle") }
    }
  }
}

struct ButtonLabel: View {
  let title: String
  let systemImage: String
  
  var body: some View {
    HStack {
      Spacer()
      Label(title, systemImage: systemImage)
      Spacer()
    }
    .padding(.vertical)
    .background(Color.gray.opacity(0.15))
    .cornerRadius(6)
  }
}

struct MeowMixHeader_Previews: PreviewProvider {
  static var previews: some View {
    MeowMixHeader()
      .previewLayout(.sizeThatFits)
    
    Thumbnail()
          .padding()
          .previewLayout(.fixed(width: 250, height: 250))

    Buttons()
          .previewLayout(.sizeThatFits)
    
    MixDescription()
      .previewLayout(.sizeThatFits)
  }
}
