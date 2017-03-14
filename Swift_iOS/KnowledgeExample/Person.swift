//
//  Person.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class Person: NSObject {
//类属性
    var name:String!
    var age:Int!
    var sex:String!
    lazy var money:Deposit = Deposit()
//lazy关键字   (当第一次被使用才进行初值计算, 懒加载)
    
//类构造器函数                (初始化方法)
    init(name newName:String, age newAge:Int, sex newSex:String) {
        self.name = newName
        self.age = newAge
        self.sex = newSex
    }

//类方法
    func say() -> String {
        return "我是\(name) \(sex), 今年\(age)"
    }
    
    func run() -> String {
        return "\(name)在跑步"
    }
    
    func drive() -> String {
        return "\(name)在开车"
    }
}

class Deposit: NSObject {
    override init() {
        print("output init at Deposit")
    }
}