//
//  ShopProducts.swift
//  EggTimer
//
//  Created by Emin Roblack on 16/03/2020.
//  Copyright © 2020 emiN Roblack. All rights reserved.
//

import Foundation

public struct ShopProducts {
  
  public static let OneCoffee = "com.roblack.EggTimer.onecoffee"
  
  private static let productIdentifiers: Set<ProductIdentifier> = [ShopProducts.OneCoffee]
  public static let store = IAPHelper(productIds: ShopProducts.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
  return productIdentifier.components(separatedBy: ".").last
}
