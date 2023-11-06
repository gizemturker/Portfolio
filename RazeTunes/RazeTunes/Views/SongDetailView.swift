import SwiftUI

// MARK: Song Detail View
struct SongDetailView: View {
  // MARK: Properties
  @Binding var musicItem: MusicItem

  @ObservedObject private var downloader = SongDownloader()
  @ObservedObject private var mutableDownloader = MutableSongDownloader()
  @ObservedObject private var uploader = RatingUploader()

  // swiftlint:disable:next force_unwrapping
  @MainActor @State private var artworkImage = UIImage(named: "URLSessionArtwork")!
  @MainActor @State private var downloadProgress: Float = 0.0
  @MainActor @State private var isDownloading = false
  @MainActor @State private var playMusic = false
  @MainActor @State private var ratingSubmitted = false
  @MainActor @State private var ratingView = RatingView()
  @MainActor @State private var showDownloadFailedAlert = false
  @MainActor @State private var showRatingSubmitFailedAlert = false

  // MARK: Body
  var body: some View {
    // swiftlint:disable:next trailing_closure
    VStack {
      GeometryReader { reader in
        VStack {
          Image(uiImage: artworkImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: reader.size.width, height: reader.size.height * 0.2)
            .shadow(radius: 10)

          Text(musicItem.trackName)

          Text(musicItem.artistName)

          Text(musicItem.collectionName)

          Spacer()

          VStack(spacing: 16) {
            Button(action: {
              Task {
                await downloadTapped()
              }
            }, label: {
              if isDownloading {
                Text("Downloading...")
              } else {
                Text(downloader.downloadLocation == nil ? "Download" : "Listen")
              }
            })
            .alert("Download Failed", isPresented: $showDownloadFailedAlert) {
              Button("Dismiss", role: .cancel) {
                showDownloadFailedAlert = false
              }
            }
            .disabled(isDownloading)

            if isDownloading {
              ProgressView(value: downloadProgress)
            }
          }

          Spacer()

          VStack(spacing: 16) {
            ratingView

            Button {
              Task {
                await submitRatingTapped()
              }
            } label: {
              Text("Submit")
            }
          }

          Spacer()
        }
      }
    }
    .padding()
    .onAppear(perform: {
      Task {
        await downloadArtwork()
      }
    })
    .alert("Failed to download the song", isPresented: $showDownloadFailedAlert) {
      Button(role: .cancel, action: {
        showDownloadFailedAlert = false
      }, label: {
        Text("Dismiss")
      })
    }
    .alert("Failed to submit your rating", isPresented: $showRatingSubmitFailedAlert) {
      Button(role: .cancel, action: {
        showRatingSubmitFailedAlert = false
      }, label: {
        Text("Dismiss")
      })
    }
    .alert("Rating submitted successfully", isPresented: $ratingSubmitted) {
      Button(role: .cancel, action: {
        ratingSubmitted = false
      }, label: {
        Text("Dismiss")
      })
    }
    .sheet(isPresented: $playMusic) {
      // swiftlint:disable:next force_unwrapping
      AudioPlayer(songUrl: downloader.downloadLocation!)
    }
  }

  // MARK: Functions
  private func downloadArtwork() async {
    guard let artworkURL = URL(string: musicItem.artwork) else {
      return
    }

    do {
      let data = try await downloader.downloadArtwork(at: artworkURL)

      guard let image = UIImage(data: data) else {
        return
      }

      artworkImage = image
    } catch {
      // swiftlint:disable all
      /*
       There's a default image here, so no specific
       error-handling needed for now.
       */
      // swiftlint:enable all
    }
  }

  private func downloadSongTapped() async {
    if downloader.downloadLocation == nil {
      guard let artworkURL = URL(string: musicItem.artwork),
        let previewURL = musicItem.previewURL
      else {
        return
      }

      isDownloading = true

      defer {
        isDownloading = false
      }

      do {
        let data = try await downloader.download(songAt: previewURL, artworkAt: artworkURL)

        guard let image = UIImage(data: data) else {
          return
        }

        artworkImage = image
      } catch {
        showDownloadFailedAlert = true
      }
    } else {
      playMusic = true
    }
  }

  private func downloadTapped() async {
    if downloader.downloadLocation == nil {
      isDownloading = true

      defer {
        isDownloading = false
      }

      guard let previewURL = musicItem.previewURL else {
        return
      }

      do {
        // try await downloader.downloadSong(at: previewURL)
        try await downloader.downloadSongBytes(at: previewURL, progress: $downloadProgress)
      } catch {
        showDownloadFailedAlert = true
      }
    } else {
      playMusic = true
    }
  }

  private func mutableDownloadTapped() {
    switch mutableDownloader.state {
    case .downloading:
      mutableDownloader.pause()

    case .failed, .waiting:
      guard let previewURL = musicItem.previewURL else {
        return
      }

      mutableDownloader.downloadSong(at: previewURL)

    case .finished:
      playMusic = true

    case .paused:
      mutableDownloader.resume()
    }
  }

  private func submitRatingTapped() async {
    do {
      try await uploader.submit(rating: ratingView.rating, for: musicItem)

      ratingSubmitted = true
    } catch {
      showRatingSubmitFailedAlert = true
    }
  }
}

// MARK: - Preview Provider
struct SongDetailView_Previews: PreviewProvider {
  // MARK: Preview Wrapper
  struct PreviewWrapper: View {
    // MARK: Properties
    @State private var musicItem = MusicItem.demo()

    // MARK: Body
    var body: some View {
      SongDetailView(musicItem: $musicItem)
    }
  }

  // MARK: Previews
  static var previews: some View {
    PreviewWrapper()
  }
}
