import Foundation

// MARK: Media Response
struct MediaResponse: Codable {
  // MARK: Properties
  var results: [MusicItem]
}

// MARK: - Music Item
struct MusicItem: Codable, Identifiable {
  // MARK: Properties
  let id: Int
  let artistName: String
  let artwork: String
  let collectionName: String
  let preview: String
  let trackName: String
  var isDownloading = false
  var downloadLocation: URL?
  var localFile: URL?
  var previewURL: URL? {
    return URL(string: preview)
  }
  // MARK: Coding Keys
  enum CodingKeys: String, CodingKey {
    case id = "trackId"
    case artistName
    case artwork = "artworkUrl100"
    case collectionName
    case preview = "previewUrl"
    case trackName
  }
  // MARK: Initialization
  init(id: Int, artistName: String, artwork: String, collectionName: String, preview: String, trackName: String) {
    self.id = id
    self.artistName = artistName
    self.artwork = artwork
    self.collectionName = collectionName
    self.preview = preview
    self.trackName = trackName
  }
  // MARK: Static Functions
  static func demo() -> MusicItem {
    MusicItem(
      id: 312256808,
      artistName: "Armin van Buuren",
      artwork: "https://is3-ssl.mzstatic.com/image/thumb/Music/v4/f5/cd/9e/f5cd9e5d-9d3f-b15f-f315-81baea0a86f8/source/100x100bb.jpg",
      collectionName: "Ultra Trance 09",
      preview: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/33/a7/1a/33a71a2e-337f-029d-b2fe-f275d90dd77f/mzaf_5000426809766395357.plus.aac.p.m4a",
      trackName: "In and Out of Love (Extended Mix)"
    )
  }
}
