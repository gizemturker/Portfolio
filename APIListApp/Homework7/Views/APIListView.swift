import SwiftUI

struct APIListView: View {
    @ObservedObject var apiStore: APIStore
  @EnvironmentObject var networkMonitor: NetworkMonitor
    let apiRequest = APIRequestHandler()

    @State var modalIsPresented = false
    @State var entries: [Entry] = []

    var body: some View {
        NavigationView {
          if networkMonitor.isConnected {
            if entries.isEmpty {
                Text("Loading...")
                    .task {
                        do {
                            let url = URL(string: "https://api.publicapis.org/entries")!
                            try await apiRequest.fetchDataFromAPI(apiURL: url) { result in
                                switch result {
                                case .success(let data):
                                    entries = data.entries
                                case .failure(let error):
                                    print("Error fetching data from API: \(error)")
                                }
                            }
                        } catch {
                            print("Error fetching data from API: \(error)")
                        }
                    }
            } else {
                List(entries) { entry in
                    NavigationLink(destination: APIDetailView(entry: entry)) {
                        Text(entry.api)
                    }
                }
                .navigationBarTitle("API Names")
            }
          } else {
            if let entries = apiStore.entries?.entries {
                List(entries) { entry in
                    NavigationLink(destination: APIDetailView(entry: entry)) {
                        Text(entry.api)
                            .onTapGesture {
                                self.modalIsPresented = true
                            }
                    }
                }
                .navigationBarTitle("API Lists")
            } else {
                Text("Loading...")
            }
          }
          
          
          
          

        }
    }
}
