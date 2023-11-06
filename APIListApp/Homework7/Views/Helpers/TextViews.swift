import SwiftUI

struct HeaderBoldText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color.blue)
      .font(.title)
      .fontWeight(.black)
  }
}

struct BigBoldText: View {
  let text: String

  var body: some View {
    Text(text)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}

struct DescriptionText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
      .fontWeight(.regular)
  }
  
}

struct AuthText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
      .fontWeight(.regular)
  }
  
}

struct CategoryText: View {
  let text: String
    
    var body: some View {
      Text(text)
        .kerning(2.0)
        .foregroundColor(Color("TextColor"))
        .font(.title3)
        .fontWeight(.regular)
    }
}


struct CorsText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
      .fontWeight(.regular)
  }
  
}




struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HeaderBoldText(text: "API Lists")
      BigBoldText(text: "API")
      DescriptionText(text: "description")
      AuthText(text: "auth")
      CorsText(text: "cors")
      CategoryText(text: "category")
    }
    .padding()
  }
}
