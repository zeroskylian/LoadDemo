//
//  UICollectionView+Empty.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/13.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit

extension UICollectionView
{
    var isEmpty :Bool
    {
        var count = numberOfSections
        
        for section in 0..<numberOfSections
        {
            count += numberOfItems(inSection: section)
        }
        return count == 0
    }
}

