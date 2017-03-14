//
//  SceondViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import Foundation

class SceondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "基础"
        self.navigationController?.navigationBar.isTranslucent = false
        
        createPerson()
        createSubViews()
        
        useSwiftToObjective_C()
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
    
    //初始化视图
    func createSubViews(){
//        let homeTable = UITableView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64), style: .Plain)
//        homeTable.backgroundColor = UIColor.whiteColor()
//        homeTable.delegate = self
//        homeTable.dataSource = self
//        self.view.addSubview(homeTable)
//        homeTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
//使用Person类
    func createPerson() {
        //使用类初始化一个对象,传入具体的属性
        let person1 = Person(name: "wuXing", age: 21, sex: "male")
        //调用相应的类方法
        print("\(person1.say())")
        print("\(person1.run())")
        print("\(person1.drive())")
        
        //赋值
        person1.age = 25
        person1.sex = "woman"
        print(person1.say())
    }
    
//TODO: Swift调用OC代码
    func useSwiftToObjective_C() {
        
        var string = NSString(format: "%@ %@", "hello", "world")
        string = string.lowercased as NSString
        string = string.replacingOccurrences(of: "world", with: "swift") as NSString
        print(string)
        
        let useOC = UseObject()
        //调用OC中的方法
        useOC.showLanage()
        
    }
    
}
