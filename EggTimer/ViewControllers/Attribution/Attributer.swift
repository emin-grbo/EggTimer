//
//  Attributer.swift
//  EggTimer
//
//  Created by Emin Roblack on 13/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import Foundation

struct Attributer {
    let name: String
    let asset: String
    let url: String
    let animationString: String
    
    func assetUrl() -> URL {
        return URL(string: url) ?? URL(string: "")!
    }
}

let appAttributors: [Attributer] = [
    
    Attributer(name: "Syuji Higa",
               asset: "menu animation",
               url: "https://lottiefiles.com/user/17996",
               animationString: "menuBlack"),
    
    Attributer(name: "Dmitry S",
               asset: "bear animation",
               url: "https://lottiefiles.com/kipoed",
               animationString: "bear"),
    
    Attributer(name: "LloydEvans09",
               asset: "button sounds",
               url: "https://freesound.org/people/LloydEvans09/",
               animationString: "sound"),
    
    Attributer(name: "dogwomble",
               asset: "alert sound",
               url: "https://freesound.org/people/dogwomble/",
               animationString: "sound"),
    
    Attributer(name: "Gabriel Lima",
               asset: "literaly this animation for sound attributors. I know right?",
               url: "https://lottiefiles.com/user/241222",
               animationString: "sound")

]
