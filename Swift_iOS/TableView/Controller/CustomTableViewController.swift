//
//  CustomTableViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CustomTableViewController: UIViewController, CustomTableViewCellDelegate, UITableViewDelegate, UITableViewDataSource{ //签订代理
    var chatsArr:Array<MessageItem>!
    var customTV:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "自定义 UITableView"
        initalData()
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
//初始化数据
    func initalData() {
        let me = "3.jpg"
        let you = "1.jpg"
        let first = MessageItem(body: "嘿,这张照片咋样, 我在大明湖拍的呢", logo: me, date: Date(timeIntervalSinceNow: -600), mtype: ChatType.mine)
        let second = MessageItem(image: UIImage(named: "2.jpg")!, logo: me, date: Date(timeIntervalSinceNow: -290), mtype: ChatType.mine)
        let third = MessageItem(body: "太赞了,我也想去那看看!", logo: you, date: Date(timeIntervalSinceNow: -60), mtype: ChatType.someone)
        let fouth = MessageItem(body: "恩,下次我们一起去吧!", logo: me, date: Date(timeIntervalSinceNow: -20), mtype: ChatType.mine)
        let fifth = MessageItem(body: "好的,一定!", logo: you, date: Date(timeIntervalSinceNow: 0), mtype: ChatType.someone)
        
       chatsArr = [first, second, third, fouth, fifth]
        
        
        
        
    }
    
//初始化视图
    func createSubViews(){
        customTV = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 64), style: .grouped)
        customTV.backgroundColor = UIColor.clear
        customTV.separatorStyle = .none
        customTV.delegate = self
        customTV.dataSource = self
        self.view.addSubview(customTV)
        customTV.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    
   
    
    
    
    
//MARK: -UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
        if (indexPath.row > 0) {
            let data = self.chatsArr[indexPath.row - 1]
            let cell = CustomTableViewCell(data: data, reuseIdentifier: "cell")
            cell.myDelegate = self
            return cell
        }else{
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section >= self.chatsArr.count) {
            return 1
        }
        return self.chatsArr.count + 1
    }
    
//MARK: -UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Header
        if (indexPath.row == 0) {
            return 30.0
        }
        let data = self.chatsArr[indexPath.row - 1]
        return max(data.insets.top, data.view.frame.size.height + data.insets.bottom, 52)
    }
    
    
//MARK: -CustomTableViewCellDelegate
    func rowsForChatTable(tableviewCell cell: UITableViewCell) -> Int {
        print("CustomTableViewCellDelegate代理")
        return 1
    }
    func chatTableView(tableviewCell cell: UITableViewCell, dataForRow row: Int) -> MessageItem {
        return self.chatsArr[row]
    }
}

