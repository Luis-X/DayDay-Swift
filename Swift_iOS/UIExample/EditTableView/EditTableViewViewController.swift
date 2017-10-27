//
//  EditTableViewViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class EditTableViewViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource {
    var myTableView:UITableView!
    var allNamesArr:[String]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "编辑UITableView"
        initailData()
        createEditTableView()
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
    func initailData() {
        self.allNamesArr = ["1", "2", "3"]
    }
    
    func createEditTableView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "编辑", style: .done, target: self, action: #selector(self.tableViewCellLongPressEvent(_:)))
        
        //表格
        self.myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .grouped)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.view.addSubview(self.myTableView)
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        //长按手势
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.tableViewCellLongPressEvent(_:)))
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        self.myTableView.addGestureRecognizer(longPress)
        
    }
    
//长按触发(编辑状态切换)
    @objc func tableViewCellLongPressEvent(_ sender:AnyObject) {
        if (sender.isKind(of: UILongPressGestureRecognizer.self)) {
            if (sender.state == .began) {
                print("长按开始")
            }
            if (sender.state == .changed) {
                print("长按改变")
            }
            if (sender.state == .ended) {
                print("长按结束")
                changeTableEditStyle()
            }
        }else{
           changeTableEditStyle()
        }
    }
    

//在正常状态下和编辑状态之间切换
    func changeTableEditStyle() {
        if (self.myTableView.isEditing == false) {
            self.myTableView.setEditing(true, animated: true)
        }else{
            self.myTableView.setEditing(false, animated: true)
        }

    }
 
//MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = self.allNamesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allNamesArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
//MARK: -UITableViewDelegate
    //编辑样式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if (indexPath.section == 0) {
            return .delete
        }
        
        if (indexPath.section == 1) {
            return .insert
        }
        return .none
    }
    
    //删除文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "确定删除\(indexPath.section)-\(indexPath.row)?"
    }
    
    //头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "删除"
        }
        if (section == 1) {
            return  "插入"
        }
        return "无"
    }
    
    //让添加,删除生效
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //删除
        if (editingStyle == .delete) {
            self.allNamesArr.remove(at: indexPath.row)
            self.myTableView.reloadData()
            self.myTableView.setEditing(true, animated: true)
        }
        
        //插入
        if (editingStyle == .insert) {
            self.allNamesArr.insert("新插入", at: indexPath.row + 1)
            self.myTableView.reloadData()
        }
    }
}
