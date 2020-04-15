//
//  AlertModel.swift
//  EggTimer
//
//  Created by Emin Roblack on 13/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import Foundation

struct AlertModel {
    let animation: String
    let title: String
    let subtitle: String
    let buttonString: String
}

let alertConfirmModels: [AlertModel] = [

    AlertModel(animation: "bear",
               title: "Bear says you eggs are done!",
               subtitle: "Bears really like eggs, they just lack the ability to grow them.",
               buttonString: "Yum!"),
    
    AlertModel(animation: "crazyEgg",
               title: "Your done are eggs.",
               subtitle: "Look at this silly bastard. Just look at him.",
               buttonString: "OK?"),
    
    AlertModel(animation: "elephant",
               title: "You'd better hurry!",
               subtitle: "I think this elephant developed a taste for boiled eggs.",
               buttonString: "No, they are mine!"),
    
    AlertModel(animation: "notification",
               title: "Eggs == done!",
               subtitle: "Enjoy your meal! Yeah, this time just a regular notiication.",
               buttonString: "Yum!"),
    
    AlertModel(animation: "sun",
               title: "Egg cycle completes",
               subtitle: "Time for the daily harvest.\nEnjoy your meal!",
               buttonString: "Yum!")
    
    
    ]
