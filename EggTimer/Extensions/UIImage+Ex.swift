//
//  UIImage+Ex.swift
//  EggTimer
//
//  Created by Emin Roblack on 05/04/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import UIKit

extension UIImage {

func noir() -> UIImage {
    let context = CIContext(options: nil)

    let currentFilter = CIFilter(name: "CIPhotoEffectTonal")
    currentFilter!.setValue(CIImage(image: self), forKey: kCIInputImageKey)
    let output = currentFilter!.outputImage
    let cgimg = context.createCGImage(output!, from: output!.extent)
    let processedImage = UIImage(cgImage: cgimg!, scale: scale, orientation: imageOrientation)
    return processedImage
}}
