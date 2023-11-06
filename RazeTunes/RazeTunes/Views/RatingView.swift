import SwiftUI

// MARK: Rating View
struct RatingView: View {
  // MARK: Properties
  @State var rating: Int = 4

  // MARK: Body
  var body: some View {
    HStack(spacing: 15) {
      ForEach(1..<6) { star in
        Button {
          rating = star
        } label: {
          Image(systemName: star <= rating ? "star.fill" : "star")
            .resizable()
            .frame(maxWidth: 40, maxHeight: 40)
        }
      }
    }
  }
}

// MARK: - Preview Provider
struct RatingView_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    RatingView()
  }
}
