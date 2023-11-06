import SwiftUI

struct APIDetailView: View {
    var entry: Entry
    @StateObject private var apiRequestHandler = APIRequestHandler()

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if entry == entry {
                BigBoldText(text: "API Name: \(entry.api)")
                DescriptionText(text: "Description: \(entry.description)")
                AuthText(text: "Auth: \(entry.auth)")
                Text("isHttpsSupported: \(entry.https  ? "Yes" : "No")")
                CorsText(text: "Cors: \(entry.cors)")
                Link("Link", destination: URL(string: entry.link)!)
                    .font(.title3)
                CategoryText(text: "Category: \(entry.category)")
            } else {
                Text("Loading...")
                    .task {
                        do {
                            let url = URL(string: "https://api.publicapis.org/entries")!
                             apiRequestHandler.fetchDataFromAPI(apiURL: url) { result in
                                switch result {
                                case .success(let data):
                                    apiRequestHandler.entries = data
                                case .failure(let error):
                                    print("Error fetching data from API: \(error)")
                                }
                            }
                        } catch {
                            print("Error fetching data from API: \(error)")
                        }
                    }
            }
        }
        .padding()
    }
}

struct APIDetailView_Previews: PreviewProvider {
    static var previews: some View {
        APIDetailView(entry: Entry(api: "Sample API", description: "Sample Description", auth: "Sample Auth", https: true, cors: "Sample Cors", link: "https://samplelink.com", category: "Sample Category"))
    }
}








