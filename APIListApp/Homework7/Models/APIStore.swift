import Foundation


class APIStore: ObservableObject {
  @Published var entries: APIModel?
  var storedFileManager = StoredFileManager()
  
  init() {
    entries = storedFileManager.loadJSON(fileName: "apilist", fileType: "json", userType: APIModel.self)
  }
  
  func loadJSON() {
    guard let jsonURL = Bundle.main.url(forResource: "apilist", withExtension: "json") else 
    { return }
      
      do {
        let jsonData = try Data(contentsOf: jsonURL)
        
        entries = try JSONDecoder().decode(APIModel.self, from: jsonData)
     
      } catch DecodingError.dataCorrupted(let context) {
          print("Data corrupted: \(context.debugDescription)")
      } catch DecodingError.keyNotFound(let key, let context) {
          print("Key '\(key.stringValue)' not found: \(context.debugDescription)")
      } catch DecodingError.typeMismatch(let type, let context) {
          print("Type mismatch for type \(type): \(context.debugDescription)")
      } catch DecodingError.valueNotFound(let type, let context) {
          print("Value not found for type \(type): \(context.debugDescription)")
      } catch {
          print("Other decoding error: \(error)")
    }
  }

  
  func saveJSON() {
    do {
      let jsonData = try JSONEncoder().encode(entries)
      let jsonURL = URL(fileURLWithPath: "apilist",
                        relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
      print(jsonURL.absoluteString)
      try jsonData.write(to: jsonURL, options: .atomicWrite)
    } catch let error {
      print("Error saving: \(error)")
    }
  }
}
  
public extension FileManager {
  static var documentsDirectoryURL: URL {
    return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
}
  
