//
//  ScrollViewPagerExtension.swift
//  FitnessApp
//
//  Created by Emin Grbo on 7/4/19.
//  Copyright © 2019 telego. All rights reserved.
//

import UIKit

extension UIScrollView {
    var currentPage:Int{
        return Int((self.contentOffset.x + (0.5 * self.frame.size.width)) / self.frame.width) + 1
    }
    
    func scrollTo(_ page: Int) {
        UIView.animate(withDuration: 0.3) {
            self.contentOffset.x = self.frame.width * CGFloat(page)
        }
    }
}
