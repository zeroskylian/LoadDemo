//
//  ListVIewController.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/11.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit
import Dispatch

class ListViewController: ZLTableViewController<Int> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        addStateViews()
        loadData()
    }
    
    
    func addStateViews()
    {
        let loading = UIView()
        loading.backgroundColor = .red
        set(stateView: loading, forState: .loading)
        
        let empty = UIView()
        empty.backgroundColor = .black
        stateViews[.empty] = empty
        set(stateView: empty, forState: .empty)
        
        let failed = UIView()
        failed.backgroundColor = .blue
        set(stateView: failed, forState: .failed)
        
        
        let networkError = UIView()
        networkError.backgroundColor = .green
        set(stateView: networkError, forState: .networkError)
    }
    func loadData() {
        startLoading()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.tableView .reloadData()
            self.endLoading()
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: self.view.safeAreaInsets.top, width: self.view.frame.size.width, height: self.view.frame.size.height - self.view.safeAreaInsets.top)
    }
    override func pullRefresh() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.endRefresh(noMoreData: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = String( dataSource[indexPath.row])
        return cell
    }
}
