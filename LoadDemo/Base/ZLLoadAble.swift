//
//  ScrollViewLoadProtocol.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/11.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import Foundation
import MJRefresh



struct LoadType:OptionSet {
    let rawValue: UInt
    static let none =  LoadType(rawValue: 1 << 0)
    static let footer =  LoadType(rawValue: 1 << 1)
    static let header =  LoadType(rawValue: 1 << 2)
}


enum LoadComponent {
    case header
    case footer
}

protocol ZLLoadAble : class {
    
    var scrollView : UIScrollView { get }
    
    var loadType:LoadType { get }
    
    func pullRefresh()
    
    func pushLoadMore()
    
    func deployComponent()
    
    func addComponent(component:LoadComponent)
    
    func removeComponent(component:LoadComponent)
    
    func hideComponent(component:LoadComponent)
    
    func endRefresh(noMoreData:Bool)
    
    func endRefresh(error:Error)
    
}

extension ZLLoadAble
{
    var loadType: LoadType  {
        return [.none]
    }
    
    func deployComponent(){
        if loadType.contains(.header) {
            addComponent(component: .header)
        }
        if loadType.contains(.footer) {
            addComponent(component: .footer)
        }
    }
    
    
    func addComponent(component:LoadComponent) {
        switch component {
        case .header:
            scrollView.mj_header = MJRefreshStateHeader(refreshingBlock: { [unowned self] in
                self.pullRefresh()
            })
        case .footer:
            scrollView.mj_footer = MJRefreshAutoStateFooter(refreshingBlock: {[unowned self] in
                self.pushLoadMore()
            })
            scrollView.mj_footer?.isHidden = true
        }
    }
    
    func removeComponent(component:LoadComponent){
        switch component {
        case .header:
            scrollView.mj_header = nil
        case .footer:
            scrollView.mj_footer = nil
        }
    }
    
    func hideComponent(component:LoadComponent)
    {
        switch component {
        case .header:
            scrollView.mj_header?.isHidden = true
        case .footer:
            scrollView.mj_footer?.isHidden = true
        }
    }
    
    func endRefresh(noMoreData:Bool){
        
        if scrollView.mj_footer?.isHidden == true {
            scrollView.mj_footer?.isHidden = false
        }
        scrollView.mj_header?.endRefreshing()
        if noMoreData {
            scrollView.mj_footer?.endRefreshingWithNoMoreData()
        }else
        {
            scrollView.mj_footer?.endRefreshing()
        }
        
    }
    
    
    func endRefresh(error:Error)
    {
        scrollView.mj_header?.endRefreshing()
        scrollView.mj_footer?.endRefreshing()
        if scrollView.mj_footer?.isHidden == true {
            scrollView.mj_footer?.isHidden = false
        }
    }
    
}
