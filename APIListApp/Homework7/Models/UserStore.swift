import Foundation
 
 class UserStore: ObservableObject {
   @Published var profile: UserModel?
   var storedFileManager = StoredFileManager()
   
   init() {
     profile = storedFileManager.loadJSON(fileName: "week7aboveandbeyond", fileType: "json", userType: UserModel.self)
   }
   
   func loadJSON() {
     guard let jsonURL = Bundle.main.url(forResource: "apilist", withExtension: "json") else
     { return }
       
       do {
         let jsonData = try Data(contentsOf: jsonURL)
         
         profile = try JSONDecoder().decode(UserModel.self, from: jsonData)
      
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
       let jsonData = try JSONEncoder().encode(profile)
       let jsonURL = URL(fileURLWithPath: "week7aboveandbeyond",
                         relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
       print(jsonURL.absoluteString)
       try jsonData.write(to: jsonURL, options: .atomicWrite)
     } catch let error {
       print("Error saving: \(error)")
     }
   }
 }
   
   


