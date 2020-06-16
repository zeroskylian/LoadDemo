//
//  ZLCollectionViewController.swift
//  LoadDemo
//
//  Created by Xinbo Lian on 2020/6/16.
//  Copyright © 2020 Xinbo Lian. All rights reserved.
//

import UIKit


class ZLCollectionViewController<T>: ZLLoadingViewController ,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    required init(withLayout layout:UICollectionViewLayout) {
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        layout = UICollectionViewFlowLayout()
        super.init(coder: coder)
    }
    
    
    var layout:UICollectionViewLayout
    
    lazy var collectionView:UICollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
    
    var dataSource:Array<T> = []
    
    override var container: UICollectionView {
        return collectionView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        deployComponent()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func pullRefresh() {}
    
    func pushLoadMore() {}
}


extension ZLCollectionViewController : ZLLoadAble
{
    var scrollView: UIScrollView {
        return collectionView
    }
    
    var loadType: LoadType  {
        return [.header ,.footer]
    }
}
