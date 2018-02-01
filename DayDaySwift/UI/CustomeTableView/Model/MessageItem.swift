//
//  MessageItem.swift
//  DayDaySwift
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

//消息类型枚举
enum ChatType {
    case mine
    case someone
}


class MessageItem: NSObject {
    var logo:String!                        //头像
    var date:Date!                        //日期
    var mType:ChatType!                     //消息类型
    var view:UIView!                        //内容视图
    var insets:UIEdgeInsets!                //边距
    
//MARK:    class    为类（class）定义类型属性
//MARK:    static   值类型的类型属性
    
    
    
    
    //设置我的文本消息边距
    class func getTextInsetsMine() -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 11, right: 17)
    }
    
    //设置他人文本消息边距
    class func getTextInsetsSomeone() -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 15, bottom: 11, right: 10)
    }
    
    //设置我的图片消息边距
    class func getImageInsetsMine() -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 13, bottom: 16, right: 22)
    }
    
    //设置他人的图片消息边距
    class func getImageInsetsSomeone() -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 13, bottom: 16, right: 22)
    }
    
    
    
    
//MARK: convenience关键字
/*
1.便利初始化方法
2.所有的convenience初始化方法都必须调用同一个类中的designated初始化完成设置，另外convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的
*/
    
//构造文本消息体
   convenience init(body:NSString, logo:String, date:Date, mtype:ChatType) {
        //自适应高度
        let font = UIFont.systemFont(ofSize: 12)
        let width = 375
        let height = 1000.0
        let atts = [NSAttributedStringKey.font : font]
        /*
        let attsDic = NSMutableDictionary()
        attsDic.setObject(font, forKey: NSFontAttributeName)
        */
        
        let size = body.boundingRect(with: CGSize(width: CGFloat(width), height: CGFloat(height)), options: .usesLineFragmentOrigin, attributes: atts, context: nil)
        
        //文本LB
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.size.width, height: size.size.height))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = (body.length != 0 ? body as String : "")
        label.font = font
        label.backgroundColor = UIColor.clear
        
        //根据类型判断边距
        let insets:UIEdgeInsets = (mtype == ChatType.mine ? MessageItem.getTextInsetsMine() : MessageItem.getTextInsetsSomeone())
        self.init(logo:logo, date:date, mtype:mtype, view:label, insets:insets)
    }
    
    
    
    
    
//可以传入更多的自定义视图
    init(logo:String, date:Date, mtype:ChatType, view:UIView, insets:UIEdgeInsets) {
        self.view = view
        self.logo = logo
        self.date = date
        self.mType = mtype
        self.insets = insets
    }
    
    
    
    
    
//构造图片消息体
   convenience init(image:UIImage, logo:String, date:Date, mtype:ChatType) {
        var size = image.size
        //等比缩放
        if (size.width > 220) {
            size.height /= (size.width / 220)
            size.width = 220
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        imageView.image = image
        imageView.layer.cornerRadius = 5.0
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        
        let insets:UIEdgeInsets = (mtype == ChatType.mine ? MessageItem.getImageInsetsMine() : MessageItem.getTextInsetsSomeone())
        self.init(logo:logo, date:date, mtype:mtype, view:imageView, insets:insets)
        
    }
    
}
