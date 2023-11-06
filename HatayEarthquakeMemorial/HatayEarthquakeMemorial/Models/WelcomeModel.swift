//
//  WelcomeModel.swift
//  HatayEarthquakeMemorial
//
//  Created by Gizem Turker on 15.04.2023.
//

import Foundation

struct Page: Identifiable, Equatable {
    
    
    let name: String
    let description: String
    let imageName: String
    let earthquake: Bool
    var tag: Int
    
    var id: String {
        name + imageName
    }
    

    
    static var storyPages: [Page] = [
        Page(name: "Hatay",
             
             description: "Hatay city, with its thousands of years of history, is located in a geography stretching from Mesopotamia to Anatolia. Many civilizations, such as the Hittites, Persians, Romans, Byzantines, Arabs and Ottomans, have ruled in this region. In addition to Turkish, languages such as Arabic, Armenian, Syriac, French and Hebrew are also spoken in Hatay. Moreover, Hatay is a city where different religions, such as Christianity, Islam, and Judaism, live together. This diversity reflects Hatay's cultural richness, and the coexistence of other faiths and cultures in the city points to the values of tolerance and respect of the people of Hatay.\nOn one side, surrounded by mountains, and on the other side by the sea, Hatay's streets are scented with daffodils. Looking back at the history of Hatay, the city has been destroyed many times but has always been rebuilt strongly. As Hatay people, we remember this history with strength and hope and look forward to the days when we will stand up again.",
             
             imageName: "hatayculture", earthquake: false, tag: 0),
        
    Page(name: "Hatay Before Earthquakes",
         
         description: "Hatay is a culturally diverse city with a rich history that includes ancient cities, castles, and historical artefacts. The city is linguistically diverse with various languages spoken, and home to people of different religions. As a result, Hatay's structures and ruins reflect different religious and cultural traditions. Its cuisine is famous and included in the UNESCO Creative Cities Network. Hatay is renowned for its cultural heritage preservation, creativity, and culinary excellence.",
         
         imageName: "bhatay", earthquake: false, tag: 1),
    
    Page(name: "Earthquake",
         
         description: "On 6 February 2023, at 04:17 TRT (01:17 UTC), a powerful earthquake with a magnitude of 7.8 on the moment magnitude scale struck southern and central Turkey, as well as northern and western Syria. The epicenter was located 37 km (23 mi) west-northwest of Gaziantep.The earthquake caused extreme shaking with a maximum Mercalli intensity of XII at the epicenter and in Antakya. Later that day, another earthquake measuring 7.7 on the moment magnitude scale occurred at 13:24, with its epicenter located 95 km (59 mi) north-northeast of the first earthquake's epicenter.The earthquakes resulted in widespread damage and tens of thousands of fatalities.",
         
         imageName: "date42", earthquake: true, tag: 2),
    
    Page(name: "Hatay After Earthquakes",
         
         description: "In memory of every person who died in the earthquake and every cultural heritage we lost and the good times we lived with them...",
         
         imageName: "ahatay", earthquake: true, tag: 3)
    ]
    
    
}



