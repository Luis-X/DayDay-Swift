//
//  TableViewViewController.swift
//  DayDaySwift
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{   //代理
    var myTableView:UITableView!
    //属性数组声明
    var allTableViewArray:Array<String>!
    var allTableViewArray2:[String]!
    var allTableViewArray3:NSMutableArray!
    //属性字典
    var allTableViewDic:Dictionary<Int, String>!
    var allTableViewDic2:[Int: String]!
    var allTableViewDic3:NSMutableDictionary!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UITableView"
        initailData()
        createTableView()
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
    func initailData(){
        self.allTableViewArray3 = NSMutableArray(objects: "1", "2", "3", "4")
    }
    
    func createTableView(){
//MARK: UITableView
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 64), style: .grouped)
        myTableView.backgroundColor = UIColor.white
        //指定代理人
        myTableView.dataSource = self
        myTableView.delegate = self
//属性
        //分割线
        myTableView.separatorStyle = .singleLine
        //是否允许选中
        myTableView.allowsSelection = true
        //是否允许多选
        myTableView.allowsMultipleSelection = true
        //编辑模式是否可以多选
        myTableView.allowsSelectionDuringEditing = true
        self.view.addSubview(myTableView)
        //注册重用池
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
        
        //表头
       let headerLB = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        headerLB.backgroundColor = UIColor.black
        headerLB.textColor = UIColor.white
        headerLB.numberOfLines = 0
        headerLB.lineBreakMode = .byWordWrapping
        headerLB.text = "HeaderView"
        headerLB.textAlignment = .center
        headerLB.font = UIFont.systemFont(ofSize: 20)
        myTableView.tableHeaderView = headerLB
        
        //表尾
        let footerLB = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        footerLB.backgroundColor = UIColor.black
        footerLB.textColor = UIColor.white
        footerLB.numberOfLines = 0
        footerLB.lineBreakMode = .byWordWrapping
        footerLB.text = "FooterView"
        footerLB.textAlignment = .center
        footerLB.font = UIFont.systemFont(ofSize: 20)
        myTableView.tableFooterView = footerLB
    }

    
    
    
    
//MARK: -UITableViewDataSource
    //内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         //此语句和下面4个不能同时出现                                                               //as 强制转换类型
        //let defaultCell = tableView.dequeueReusableCellWithIdentifier("defaultCell", forIndexPath: indexPath) as UITableViewCell
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell") as UITableViewCell
        let cell1 = UITableViewCell(style: .subtitle, reuseIdentifier: "cell1") as UITableViewCell
        let cell2 = UITableViewCell(style: .value1, reuseIdentifier: "cell2") as UITableViewCell
        let cell3 = UITableViewCell(style: .value2, reuseIdentifier: "cell3") as UITableViewCell
    
        if indexPath.section == 0 {
            //Default样式
            cell.accessoryType = .checkmark
            cell.textLabel?.text = String(describing: self.allTableViewArray3[indexPath.row])
            cell.detailTextLabel?.text = "Default"
            cell.imageView?.image = UIImage(named: "1.jpg")
            return cell
        }
        if indexPath.section == 1 {
            //Subtitle样式
            cell1.accessoryType = .detailButton
            cell1.textLabel?.text = String(describing: self.allTableViewArray3[indexPath.row])
            cell1.detailTextLabel?.text = "Subtitle"
            cell1.imageView?.image = UIImage(named: "2.jpg")
            return cell1
        }
        if indexPath.section == 2 {
            //Value1样式
            cell2.accessoryType = .detailDisclosureButton
            cell2.textLabel?.text = String(describing: self.allTableViewArray3[indexPath.row])
            cell2.detailTextLabel?.text = "Value1"
            cell2.imageView?.image = UIImage(named: "3.jpg")
            return cell2
        }
        if indexPath.section == 3 {
            //Value2样式
            cell3.accessoryType = .disclosureIndicator
            cell3.textLabel?.text = String(describing: self.allTableViewArray3[indexPath.row])
            cell3.detailTextLabel?.text = "Value2"
            cell3.imageView?.image = UIImage(named: "4.jpg")
            return cell3
        }
        
        
        return cell
    }
    
    //分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTableViewArray3.count
    }
    
//MARK: -UITableViewDelegate
    
    //点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //点击按钮动画
        tableView.deselectRow(at: indexPath, animated: true)
        print("section:\(indexPath.section) row:\(indexPath.row)")
    }
    
    //头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < 4 {
            return "系统样式"
        }
        
        return "头部标题"
    }
    
    //头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    //头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    //尾部标题
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "尾部标题"
    }
    
    //尾部视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    //尾部高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}
