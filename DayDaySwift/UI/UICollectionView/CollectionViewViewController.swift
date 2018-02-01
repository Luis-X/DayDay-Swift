//
//  CollectionViewViewController.swift
//  DayDaySwift
//
//  Created by LuisX on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UICollectionView"
        createSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func createSubViews() {
        let flowLayout = UICollectionViewFlowLayout()
        //滚动方向
        flowLayout.scrollDirection = .vertical
        //内容大小
        let itemSize = CGFloat((self.view.frame.size.width - 4 * 10) / 3)
        flowLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        //尾部大小
        flowLayout.footerReferenceSize = CGSize(width: 0, height: 0)
        //头部大小
        flowLayout.headerReferenceSize = CGSize(width: 0, height: 0)
        //最小列间距
        flowLayout.minimumInteritemSpacing = 10
        //最小行间距
        flowLayout.minimumLineSpacing = 10
        //上左下右间距
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    
//MARK: -   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
//MARK: -UICollectionViewDelegate
}
