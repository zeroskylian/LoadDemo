//
//  ZLLoadingViewController.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/11.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit

class ZLLoadingViewController: UIViewController {
    
    var state: LoadingState = .loading
    
    var stateViews: [LoadingState : UIView] = [:]
    
    var stateViewFrame: CGRect {
        return container.bounds
    }
    
    var container: UIView {
        return view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ZLLoadingViewController : ZLLoadingAble {
    
}
