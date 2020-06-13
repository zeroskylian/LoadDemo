//
//  ZLLoadingAble.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/12.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit


enum LoadingState :String {
    case loading = "loading"
    case empty = "empty"
    case failed = "failed"
    case networkError = "networkError"
}

protocol ZLLoadingType {
    
}

protocol ZLLoadingAble : class {
    
    var container:UIView {  get }
    
    var stateViewFrame:CGRect { get }
    
    var state:LoadingState {set get }
    
    var stateViews:[LoadingState:UIView] {set get}
    
    func view(forState state:LoadingState) -> UIView?
    
    func set(stateView view:UIView, forState state:LoadingState)
    
    func show(state:LoadingState)
    
    func hideStateView()
    
    func startLoading()
    
    func endLoading()
}


extension ZLLoadingAble
{
    var stateViewFrame:CGRect {
        return container.bounds
    }
    
    func view(forState state:LoadingState) -> UIView? {
        return stateViews[state]
    }
    
    func set(stateView view:UIView, forState state:LoadingState) {
        stateViews[state] = view
        view.frame = stateViewFrame
    }
    
    func show(state:LoadingState) {
        if let oldStateView = stateViews[self.state] {
            oldStateView.removeFromSuperview()
        }
        self.state = state
        if let stateView = stateViews[state]{
            if container.isMember(of: UIView.self) {
                container.addSubview(stateView)
            }else if container.isMember(of: UITableView.self) , let tableView = container as? UITableView{
                tableView.backgroundView = stateView
            }else if container.isMember(of: UICollectionView.self), let collectionView = container as? UICollectionView{
                collectionView.backgroundView = stateView
            }
        }
    }
    
    func hideStateView(){
        if let stateView = stateViews[state]{
            if container.isMember(of: UIView.self) {
                stateView.removeFromSuperview()
            }else if container.isMember(of: UITableView.self) , let tableView = container as? UITableView{
                tableView.backgroundView = nil
            }else if container.isMember(of: UICollectionView.self), let collectionView = container as? UICollectionView{
                collectionView.backgroundView = nil
            }
        }
    }
    
    
    func startLoading() {
        show(state: .loading)
        
    }
    
    func endLoading() {
        if container.isMember(of: UIView.self) {
            
        }else if container.isMember(of: UITableView.self) , let tableView = container as? UITableView{
            if tableView.isEmpty {
                show(state: .empty)
            }else {
                hideStateView()
            }
            
        }else if container.isMember(of: UICollectionView.self), let collectionView = container as? UICollectionView{
            if collectionView.isEmpty {
                show(state: .empty)
            }else {
                hideStateView()
            }
        }
    }
    
}
