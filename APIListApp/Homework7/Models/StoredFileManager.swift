import Foundation

class StoredFileManager {

  func loadJSON<T: Decodable>(fileName: String, fileType: String, userType: T.Type) -> T? {
      guard let jsonURL = Bundle.main.url(forResource: fileName, withExtension: fileType)
        else { return nil }

      do {
          let jsonData = try Data(contentsOf: jsonURL)
          let decodedData = try JSONDecoder().decode(userType, from: jsonData)
          return decodedData
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
      return nil
  }

  func saveJSON<T: Encodable>(data: T, fileName: String, fileExtension: String) {
      do {
          let jsonData = try JSONEncoder().encode(data)
          let jsonURL = URL(fileURLWithPath: fileName,
                            relativeTo: 
                              FileManager.documentsDirectoryURL)
                            .appendingPathExtension(fileExtension)
          print(jsonURL.absoluteString)

          try jsonData.write(to: jsonURL, options: .atomicWrite)
      } catch {
          print("Error saving: \(error)")
      }
  }
}
