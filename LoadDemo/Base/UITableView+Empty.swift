//
//  UITableView+Empty.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/13.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit

extension UITableView
{
    var isEmpty :Bool
    {
        var count = 0;
        for section in 0..<numberOfSections {
            count += numberOfRows(inSection: section)
        }
        return count == 0
    }
}
