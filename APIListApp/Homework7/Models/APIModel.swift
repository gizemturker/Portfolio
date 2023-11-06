import Foundation

struct APIModel: Codable {
  let count: Int
  var entries: [Entry]
}

struct Entry: Codable, Identifiable, Equatable {
  var id = UUID()
  let api: String
  let description: String
  let auth: String
  let https: Bool
  let cors: String
  let link: String
  let category: String
  
  
  enum CodingKeys: String, CodingKey {
    case api = "API"
    case description = "Description"
    case auth = "Auth"
    case https = "HTTPS"
    case cors = "Cors"
    case link = "Link"
    case category = "Category"
    
  }
  
  init(id: UUID = UUID(), api: String, description: String, auth: String, https: Bool, cors: String, link: String, category: String) {
    self.id = id
    self.api = api
    self.description = description
    self.auth = auth
    self.https = https
    self.cors = cors
    self.link = link
    self.category = category
  }
}
