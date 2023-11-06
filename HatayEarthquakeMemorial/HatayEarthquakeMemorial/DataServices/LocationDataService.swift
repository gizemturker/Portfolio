//
//  LocationDataService.swift
//  HatayEarthquakeMemorial
//
//  Created by Gizem Turker on 13.04.2023.
//


import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        
        Location(
            name: "Habib-i Neccar Mosque",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.033333,  longitude: 36.166667),
            description: "Habib-i Najjar Mosque is a historical mosque in Antakya, Hatay Province, Turkey named after Habib the Carpenter. The mosque is to the east of Orontes River (Turkish: Asi Irmağı). The mosque was severely damaged by earthquakes in February 2023. \nIn antiquity, there was most probably a pagan temple in place of the current mosque. During the Christian era, it was converted into a church named after John the Baptist. In the Medieval Age, the city was captured first by the Rashidun Caliphate in 637, by the Byzantine Empire in 969, by the Seljuk Turks in 1084, by the Crusades in 1098, and by the Baibars of the Mamluk Sultanate in 1268. Concurrently in each case, the status of the building was changed from church to mosque and from mosque to church. However, in the inscription of the mosque, it reads that it was rebuilt in 1275 soon after Baibars had converted it to a mosque. The mosque was demolished during the 1853 earthquake. It was rebuilt by the Ottomans but the minaret was left standing and is older. The shadirvan (ablution fountain) is a later addition.The mosque was destroyed in the 2023 earthquake.The two sarcophagi found in the yard of the mosque are believed to belong to Jonah and John the Baptist, or the tomb of Habib along with that of Sham'un Al-Safa (Saint Peter, also known as Simon the Pure). ",
            imageNames: [
                "habibi",
            ]
        ),
        
        Location(
            name: "The Hatay Archaeology Museum",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.2019,  longitude: 36.16),
            description: "The Hatay Archaeology Museum (Turkish: Hatay Arkeoloji Müzesi) is the archaeology museum of Antakya, Turkey. It is known for its extensive collection of Roman and Byzantine Era mosaics.The museum is located in Antakya, the main city of Hatay. Construction of the museum started in 1934 on the recommendation of the French archaeologist and antiquities inspector Claude M. Prost.It was completed in 1938 and came under Turkish control in 1939 following Hatay's unification with Turkey. The museum was opened to the public in 1948 and re-opened in 1975 following renovation and expansion.With 3,500 sqm of mosaics displayed in 10,700 sqm of exhibition space and 32,754 sqm of total indoor space, the museum is claimed to be the largest mosaic museum in the world.The museum sustained heavy damage in the 2023 Turkey–Syria earthquake.\nHatay has a rich collection of mosaics dating back to the Hellenistic and to the Roman era in the 2nd and 3rd centuries.They have been found in the ancient cities of Daphne, Seleucia Pieria (Samandağ), Antioch and Tarsus.The most famous figures among those depicted by the mosaics are the drunken Dionysos, Orpheus, Dancers, Ariadne Abandoned from Defne (Yakto). Column capitals, a sacrificial altar, a cult image, a bas-relief, a fresco and statues date from the Hittites to Roman periods. They were found by excavations in barrows in the plain of Amik. The works in the museum are arranged according to where they were found.Excavations have been carried out at barrows, tells and ruins such as Guneyde, Dehep, Çatalhöyük, Tainat, Al Mina, Ac-ana, Defne-Harbiye and so on. The collection also includes objects from Antakya and its surrounding regions.The museum's collection also includes items that reflect the art and culture of the region, from the Paleolithic Age through the present day. The objects are displayed in wall niches. Against the other walls of the room are cases that display a rare coin collection arranged chronologically. The museum's garden includes Roman period sarcophagi, building stones and water jars.[citation needed] In 1999 German archeologist Jutta Meischner received permission to study and publicize Greek and Roman sculptures from the Hatay Archeology Museum.In early 2012, a section of the museum's collection was digitized as part of an effort to increase museum attendance.",
            imageNames: [
                "hataymuseum1",
                "hataymuseum2",
            ]
        ),
        
        
        Location(
            name: "Church of Saint Peter",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.2094, longitude: 36.1783),
            description: "For the church in the Vatican City, see St. Peter's Basilica. For other uses, see St. Peter's (disambiguation) and St. Peter's Church (disambiguation)The Church of Saint Peter (Classical Syriac: Knisset Mar Semaan Kefa; Turkish: Senpiyer Kilisesi; St. Peter's Cave Church, Cave-Church of St. Peter) near Antakya (Antioch), Turkey, is composed of a cave carved into the mountainside on Mount Starius with a depth of 13 m (42 ft.), a width of 9.5 m (31 ft.) and a height of 7 m (23 ft). This cave is one of Christianity's oldest churches. The church reportedly is still intact after 2023 Turkey–Syria earthquake.\nThe oldest surviving parts of the church building date from at least the 4th or 5th century; these include some pieces of floor mosaics, and traces of frescoes on the right side of the altar. The tunnel inside which opens to the mountainside is thought to have served the Christians for evacuation of the church in case of sudden raids and attacks. Water which seeps from the nearby rocks was gathered inside to drink and to use for baptism; flow of this water, which visitors drank and collected to give to those who were ill (believing that it was healing and curative), has lessened as a result of recent earthquakes.Crusaders of the First Crusade who captured Antakya in 1098 lengthened the church by a few meters and connected it with two arches to the facade, which they constructed. Acting on orders from Pope Pius IX, Capuchin Friars restored the church and rebuilt the facade in 1863; French Emperor Napoleon III contributed to the restoration. The remains to the left of the entrance belong to colonnades which formerly stood in front of the present facade.Atop the stone altar in the middle of the church is a stonework platform placed in memory of Saint Peter's Platform Holiday, which was celebrated every 21 February in Antakya. A marble statue of Saint Peter was placed above the altar in 1932.The garden of the church has been used as a cemetery for hundreds of years. Graves and burials have also been located inside the church, especially around the altar. The church is the burial place of Tancred, Prince of Galilee, as well as one of the three final resting places of the remains of the Holy Roman Emperor Frederick Barbarossa, who died in the Third Crusade.The church is a museum today, but it is possible to perform worship services inside the church under the inspection of the Museum Management by obtaining a permit from the Office of the Provincial Governor. The church underwent restoration in 2013, with plans including repairs on the rock, construction of a service building and attempts to uncover fourth to fifth-century mosaics from the church’s earliest period.",
            imageNames: [
                "saintpeter",
            ]
        ),
        
        Location(
            name: "Monastery of Saint Simeon Stylites the Younger",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.0917, longitude: 36.0356),
            description: "The Monastery of Saint Simeon Stylites the Younger (Turkish: Aziz Simon manastır) is a former Christian monastery that lies on a hill roughly 29 kilometres (18 miles) southwest of Antakya and six kilometres (3.7 miles) to the east of Samandağ, in the southernmost Turkish province of Hatay. The site is extensive but the monastery buildings are in ruins.The monastery sits on top of a hill called Saman Dağı (summit elevation: 479 m (1,572 ft)).\nThe monastery commemorates the (pillar saint), Simeon Stylites the Younger (521–597) and marks the last of several pillars on top of which he lived his life. According to one version, he lived on this pillar for the final 45 years of his long life. He preached from the top of it. Miraculous healing were attributed to him and he was venerated as a saint even while he was still alive. Until the thirteenth century the place was a pilgrimage destination.Ibn Butlan said of the monastery in the mid of the 11th century that it's buildings occupied an area as big as half of Baghdad.[3] The monastery was sacked in 1084 during the conquest of Antioch by Suleiman ibn Qutalmish who attempted to expand his sphere of influence and led to the dispersal of monks such as of author Nikon who complained of the difficulty of maintaining contact with other monasteries under Seljuk occupation.Only after the reconquest of Antioch by the forces of the First Crusade the monastery could be rebuilt and it continued to flourish during most of the 12th and 13th century.The monastery of Saint Simeon was destroyed by Sultan Baybars during his campaign against Antioch in 1268 and never recovered.\nWithin the cruciform monastery site, the ruins of three churches can be seen. The first contains the remnants of mosaics while the second was richly ornamented. The third is more basic and was probably used by monks, The base section of the pillar on which Simeon lived can still be seen, surrounded by an octagonal space.The monastery gave its name to the nearby settlement of Seleucia Pieria, known today by its Turkish name, Samandağ.",
            imageNames: [
                "stsimon",
            ]
        ),
        
        Location(
            name: "Sokollu Mehmet Pasha Caravanserai",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.7544,  longitude: 36.2038),
            description: "The caravanserai is in Payas town, İskenderun ilçe (district) of Hatay Province. It is easily accessible from Turkish state highway D.817 which connects İskenderun to North. There is also a castle to the west of the caravanserai.\nPayas is a seaside town on the Mediterranean Sea. In the 1567–68 term, Ottoman government Sublime Porte built a shipyard in Payas in preparation for the Cyprus campaign. After the conquest of Cyprus in 1571, the Grand vizier Sokollu Mehmet Pasha built the caravansarai financing it privately.[1] The architect of the caravanserai was Mimar Sinan. It is not known if Sinan actually supervised the construction. According to the inscription of the caravanserai, it was completed in 1574.\nThe purpose of the caravanserai was to provide accommodation for merchants traveling to nearby Aleppo, and for the pilgrims on the wat to Mecca. The caravanserai is a rectangular plan building about 13,000 m2 (140,000 sq ft).[2] In addition to trade section, it has many units such as a mosque, a hammam, a madrasa etc. Thus, some sources call it a külliye, a building complex.",
            imageNames: [
                "payas",
            ]
        ),
        
        
        Location(
            name: "Harbiye - Daphne",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.52999024430274, longitude: 36.09824833539793),
            description: "Daphne (/ˈdæfni/; DAFF-nee; Greek: Δάφνη, Dáphnē, lit. 'laurel'),a minor figure in Greek mythology, is a naiad, a variety of female nymph associated with fountains, wells, springs, streams, brooks and other bodies of freshwater.\nThere are several versions of the myth in which she appears, but the general narrative, found in Greco-Roman mythology, is that due to a curse made by the fierce wrath of the god Cupid, son of Venus, on the god Apollo (Phoebus), she became the unwilling object of the infatuation of Apollo, who chased her against her wishes. Just before being kissed by him, Daphne invoked her river god father, who transformed her into a laurel tree, thus foiling Apollo.\nThenceforth Apollo developed a special reverence for laurel. At the Pythian Games, which were held every four years in Delphi in honour of Apollo, a wreath of laurel gathered from the Vale of Tempe in Thessaly was given as a prize. Hence it later became customary to award prizes in the form of laurel wreaths to victorious generals, athletes, poets and musicians, worn as a chaplet on the head. The Poet Laureate is a well-known modern example of such a prize-winner, dating from the early Renaissance in Italy. According to Pausanias the reason for this was (simply and solely because the prevailing tradition has it that Apollo fell in love with the daughter of Ladon (Daphne)).Most artistic depictions of the myth focus on the moment of Daphne's transformation.\nApollo and Daphne, a marble sculpture made 1622–1625 by Bernini (1598–1680), inspired by Ovid's Metamorphoses, Galleria Borghese, Rome. Depicting the initial stage of Daphne's transformation, with her fingers shown as branches of laurel and her toes taking root into the ground",
            imageNames: [
                "daphne",
            ]
        ),
        
        Location(
            name: "Maria Hanna Church",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.412778, longitude: 35.886667),
            description: "The Arsuz Meryem Ana Church is a historical church located in the Arsuz district of Hatay province. The church was built in the late 19th century and the stones used in its construction were brought from the ancient Roman cities in the region. The church is dedicated to the Virgin Mary and is an important religious center for Christians.\nThe significance of the Arsuz Meryem Ana Church lies in its historical and cultural value. The church has witnessed many events during the Ottoman period and afterwards. As an important place of worship for Christians in the region, the church is also visited by tourists.\nThe architecture of the Arsuz Meryem Ana Church is also important. The church combines Ottoman and European architectural styles to create a unique structure. Additionally, the interior of the church is impressive with its frescoes and mosaics, which are beautiful examples of Christian art.\nFurthermore, the Seidi Meryem Ana Pool, which is located nearby, is also worth mentioning. The pool is believed to have healing powers, and it is a popular destination for those seeking a cure for various ailments.\nIn conclusion, the Arsuz Meryem Ana Church is an important structure from a historical, cultural, and architectural standpoint. As a significant place of worship for Christians and a tourist attraction, it is a valuable part of Hatay province's and Turkey's cultural heritage. The nearby Seidi Meryem Ana Pool is also a fascinating site to visit.",
            imageNames: [
                "mariachurch",
            ]
        ),
        
        Location(
            name: "Ilk Kursun Museum",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.838861, longitude: 36.235853),
            description: "Dörtyol is a town located in the Hatay province of Turkey. Atatürk, the founder of modern Turkey, visited Dörtyol on several occasions during his travels across the country. However, there is no record of Atatürk owning a house in Dörtyol or residing there permanently.\nIn the Hatay province, there is a museum known as the Hatay Archeology Museum, which contains various artifacts and exhibits related to the history of the region. The museum also features a section dedicated to Atatürk's visits to Hatay, including Dörtyol, and displays some of his personal belongings.\nDortyol is a district of the Hatay province in the southeast of Turkey, known for its rich history and culture. Ilk Kursun Museum and Atatürk House located in Dörtyol are important tourist attractions.\nIlk Kursun Museum commemorates an important event of the Turkish War of Independence, which was led by the founder of the Republic of Turkey. The museum is located at the site where the occupying forces first opened fire on the Turkish people, to remember this historical event.\nThe museum displays weapons, ammunition, photographs, and other historical artifacts from the War of Independence period. Additionally, visitors can watch a diorama that portrays the events of that period.\nAtatürk House is a residence where Mustafa Kemal Atatürk frequently stayed between 1924 and 1938. The pomegranate tree in the garden of the house, which was Atatürk's favorite fruit, is still standing and is a popular attraction for visitors.\nInside the house, some of the objects, clothes, and photographs used by Atatürk are on display. Visitors can also see the living room, bedroom, and study where Atatürk received his guests.",
            imageNames: [
                "dortyolmuseum",
            ]
        ),
        
        Location(
            name: "Issos Ancient City",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.953333, longitude: 36.203333),
            description: "Erzin is a district of Hatay province in Turkey, known for its rich history and cultural heritage. The Isos Ruins, located within the district, are one of the most important historical sites in Erzin.\nThe Isos Ruins are the remains of a Roman city dating back to the 1st century BC. The city is located in the Cilicia region and was an important port city during the Roman Empire. The Isos Ruins still fascinate visitors today with their ancient ruins.\nAmong the structures in the city are an ancient theater, bathhouse, agora, colonnaded street, and other structures from the Roman period. Additionally, the aqueducts near the Isos Ruins, which provided access to water sources, are quite impressive.\nThe Isos Ruins have been restored and opened to tourism in order to protect Hatay's historical and cultural heritage. These ancient city ruins provide visitors with an understanding of Roman period architecture, lifestyle, and culture. Moreover, the Isos Ruins hold an important place among the ancient cities in the region and are a must-visit due to their historical value.\nIn conclusion, the Isos Ruins in Erzin are an important place to understand the history and culture of Hatay province. The ancient city ruins offer visitors important insights into the architecture, lifestyle, and culture of the Roman period.",
            imageNames: [
                "issos",
            ]
        ),
        
        Location(
            name: "Vespasianus Titus Tunnel",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.120556, longitude: 35.921944),
            description: "The Vespasianus Titus Tunnel is an ancient water tunnel built for the city of Seleucia Pieria, the port of Antioch (modern Antakya), in the 1st and 2nd centuries AD.\nIt is located at the foot of the Nur Mountains, near the modern village of Çevlik, 7 km (4.3 mi) northwest of central Samandağ (the medieval port of Saint Symeon) and 35 km (22 mi) southwest of Antakya.\nThe tunnel is part of a water diversion system consisting of a dam, a short approach channel, the first tunnel section, a short intermediary channel, the second tunnel section and a long discharge channel.\nThe construction of the tunnel was ordered by the Roman emperor Vespasian (reigned 69–79 AD) to divert the floodwaters running down the mountain and threatening the harbor. It was built by digging the rocks using manpower only. The construction began under Vespasian and continued under his son Titus (r. 79–81 AD) and his successors. It was completed in the 2nd century under Antoninus Pius (r. 138–161). An inscription carved in rock at the entrance of the first tunnel section shows the names of Vespasianus and Titus, and another one at the discharge tunnel the name of Antoninus.\nThe tunnel was added to the tentative list in the cultural category of UNESCO World Heritage Site on April 15, 2014.",
            imageNames: [
                "titus",
            ]
        ),
        
        Location(
            name: "Barleam Monastery",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 35.9025, longitude: 36.060556),
            description: "Yayladağı district is located on Mount Kel, which was a sacred place during both the Seleucid and Roman periods. During those times, there was a Doric temple here, dating back to the 3rd century BC. In the 4th century AD, St. Barlaham came here and destroyed the statue of Zeus, forming a community of monks. In the early 6th century, a church was built in the southeast corner of the monastery, but it was destroyed in an earthquake in 526.\nThe monastery was rebuilt between 950-1050 and was active until 1268, after which it was abandoned. To get to the Barlaham Monastery, one must walk for 2.5 hours up the mountain from the Yeditepe neighborhood of Yayladağı district. The small footpath passes through steep cliffs. The ruins on the flat hill near the Border Station were built by Georgian priests in the 9th century and belong to the monastery and church dedicated to St. Barlaham.\nAccording to legends, there were so many vineyards, gardens, and mulberry trees around the Barlaham Monastery that the world's first wine and silk monopolies were established here. The Roman king who conquered the area was so enamored by the beauty and scenery that he said: For three days, I have not been able to sleep from watching the sunrise and sunset of the sun. He praised the Asi River for flowing into the sea.",
            imageNames: [
                "barleam",
                
            ]
        ),
        
        
        Location(
            name: "Old City of Antakya",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.200062, longitude: 36.162695),
            description: "The historic houses of the old city of Antakya are a remarkable example of 19th-century Ottoman architecture, and showcase the cultural richness of the region. The old city center of Antakya is a typical Ottoman city with narrow streets and arched passages.Two or three-story stone houses are lined up and situated close together in this area. Some of the houses have walls made of stacked stone blocks, a construction technique that dates back thousands of years.\nThe historic houses are mostly designed as courtyard structures. The courtyards provide an area where families can carry out their daily lives. The rooms around the courtyards are arranged as bedrooms, guest rooms, and living rooms for daily use.\nThe old city center of Antakya is also known as the historic Antakya houses. These houses have a unique style that results from the fusion of traditional Antakya architecture with Ottoman architecture. The roofs of the houses are covered with tiles, and the balconies are usually made of wood.\nToday, the old city center of Antakya attracts visitors not only with its historic houses but also with its ancient ruins, historic mosques and churches. The area is a popular tourist destination due to its rich historical and cultural heritage, and many tourists visit this area.",
            imageNames: [
                "old",
            ]
        ),
        
        Location(
            name: "Iskenderun",
            cityName: "Hatay",
            coordinates: CLLocationCoordinate2D(latitude: 36.842778, longitude: 36.224444),
            description: "İskenderun (Arabic: إسكندرونة), historically known as Alexandretta (Greek: Αλεξανδρέττα, lit. little Alexandria) and Scanderoon,is a city in Hatay Province on the Mediterranean coast of Turkey. Located on an alluvial plain, the city was heavily damaged by powerful earthquakes in February 2023 and subsequent aftershocks, floods and fires.\nThe city's history dates back to 333 BC, when it was founded by Alexander the Great as Alexandretta. It subsequently fell under Seleucid rule before being conquered by the Romans. After defeating the Byzantines in the 8th century, the Abbasid Caliphate gained control of the city. During the First Crusade, it came under the control of the Principality of Antioch before being captured by the Mamluk Sultanate.\nBy the 15th century, the Ottomans had conquered the city, maintaining control over it until the partition of the Ottoman Empire after the Allied victory in World War I. It subsequently became a sanjak in the French mandate of Syria until 1938, when France granted the region independence. The city became part of the Hatay State which in turn united with Turkey in 1939. İskenderun preserves the name, but probably not the exact site, of Alexandria ad Issum. The settlement was founded by Alexander the Great in 333 BC to supersede Myriandus as the key to the Syrian Gates, about 37 km (23 miles) south of the scene of his victory at the Battle of Issus against the Persian King Darius III. Alexander camped in the highlands of İskenderun, around Esentepe, and then ordered the city to be established and named Alexandria. İskenderun is one of many cities founded on Alexander's orders, including Alexandria, Egypt. A memorial, a monument and a bronze statue for the victory raised at the city, and Herodian writes that they were there even at his time, ca. 200 AD.\nThe importance of the place comes from its relation to the Syrian Gates, the easiest approach to the open ground of Hatay Province and Aleppo.The bishopric of Alexandria Minor was a suffragan of Anazarbus, the capital and so also the ecclesiastical metropolis of the Roman province of Cilicia Secunda. Greek menologia speak of Saint Helenus, and the martyr saints Aristio and Theodore as early bishops of the See. But the first documented one is Hesychius, who took part in the First Council of Nicaea in 325 and in a synod at Antioch in 341. Philomusus participated in the First Council of Constantinople in 381. Baranes is mentioned in connection with a synod at Antioch in 445. At the Council of Chalcedon in 451, Julianus was represented by his metropolitan, Cyrus of Anazarbus. Basilius was at the synod in Constantinople in 459 that condemned simoniacs. In 518, Paulus was deposed by the Byzantine Emperor Justinian for supporting the Jacobite Severus of Antioch.\nNo longer a residential diocese, Alexandria Minor is today listed by the Catholic Church as a titular see.In that list it was long named Cambysopolis,[11] but the Annuario Pontificio now gives the correct ancient name.",
            imageNames: [
                "isk",
            ]
        ),
        
    ]
    
}
