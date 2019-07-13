//
//  Extensions.swift
//  
//
//  Created by Emin Roblack on 11/28/18.
//

import Foundation
import UIKit

extension UIScrollView {
  var currentPage:Int{
    return Int((self.contentOffset.x + (0.5 * self.frame.size.width)) / self.frame.width) + 1
  }
}
