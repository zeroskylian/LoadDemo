//
//  ZLTableViewController.swift
//  SwiftBaseFramework
//
//  Created by Xinbo Lian on 2020/6/11.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit

class ZLTableViewController<T> : ZLLoadingViewController ,UITableViewDelegate, UITableViewDataSource{
    
    required init(withStyle style :UITableView.Style) {
        self.style = style
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        style = .plain
        super.init(coder: coder)
    }
    
    var style:UITableView.Style
    
    lazy var tableView = UITableView(frame: self.view.bounds, style: style)
    
    var dataSource:Array<T> = []
    
    override var container: UITableView {
        return tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        deployComponent()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func pullRefresh() {}
    
    func pushLoadMore() {}
}

extension ZLTableViewController : ZLLoadAble
{
    var scrollView: UIScrollView{
        return tableView
    }
    
    var loadType: LoadType  {
        return [.header ,.footer]
    }
    
}
