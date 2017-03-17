//
//  CustomTableViewCell.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit


//协议
protocol CustomTableViewCellDelegate {
    func rowsForChatTable(tableviewCell cell:UITableViewCell) -> Int                             //返回对话记录中的全部行数
    func chatTableView(tableviewCell cell:UITableViewCell, dataForRow row:Int) -> MessageItem        //返回某一行的内容
    //外部形参 dataForRow
}



class CustomTableViewCell: UITableViewCell {
    var customView:UIView!
    var bubbleImage:UIImageView!
    var avatarImage:UIImageView!
    var msgItem:MessageItem!
    var myDelegate:CustomTableViewCellDelegate?                                     //设置代理人
    
    
//重写初始化
    init(data:MessageItem, reuseIdentifier cellId:String){
        super.init(style: .default, reuseIdentifier: cellId)
        self.msgItem = data
        self.rebuildUserInterface()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //重建视图
    func rebuildUserInterface(){
        self.selectionStyle = .none
        if (self.bubbleImage == nil) {
            self.bubbleImage = UIImageView()
            self.addSubview(self.bubbleImage)
        }
        
        let type = self.msgItem.mType
        let width = self.msgItem.view.frame.size.width
        let height = self.msgItem.view.frame.size.height
        var x = (type == ChatType.someone) ? 0 : self.frame.size.width - width - self.msgItem.insets.left - self.msgItem.insets.right
        var y:CGFloat = 0
        
        //显示头像
        if (self.msgItem.logo != "") {
            let logo = self.msgItem.logo
            self.avatarImage = UIImageView(image: UIImage(named: (logo != "" ? logo! : "1.jpg")))
            self.avatarImage.layer.cornerRadius = 9.0
            self.avatarImage.layer.masksToBounds = true
            self.avatarImage.layer.borderColor = UIColor(white: 0.0, alpha: 0.2).cgColor
            self.avatarImage.layer.borderWidth = 1.0
            
            //别人头像,在左边,我的头像在右边
            let avatarX = (type == ChatType.someone) ? 2 : self.frame.size.width - 52
            let avatarY = height
            
            //头像居于消息底部
            self.avatarImage.frame = CGRect(x: avatarX, y: avatarY, width: 50, height: 50)
            self.addSubview(self.avatarImage)

            let delta = self.frame.size.height - (self.msgItem.insets.top + self.msgItem.insets.bottom + self.msgItem.view.frame.size.height)
            if (delta > 0) {
                y = delta
            }
            if (type == ChatType.someone) {
                x += 54
            }
            if (type == ChatType.mine) {
                x -= 54
            }
            
            self.customView = self.msgItem.view
            self.customView.frame = CGRect(x: x + self.msgItem.insets.left, y: y + self.msgItem.insets.top, width: width, height: height)
            self.addSubview(self.customView)
            
            //如果是别人的消息,在左边,如果是我输入的消息,在右边
            if (type == .someone) {
                //self.bubbleImage.image = UIImage(named: ("1.jpg"))?.stretchableImageWithLeftCapWidth(21, topCapHeight: 14)
            }else{
                //self.bubbleImage.image = UIImage(named: "2.jpg")?.stretchableImageWithLeftCapWidth(15, topCapHeight: 14)
            }
            
            self.bubbleImage.frame = CGRect(x: x, y: y, width: width + self.msgItem.insets.left + self.msgItem.insets.right, height: height + self.msgItem.insets.top + self.msgItem.insets.bottom)
            
            
            //轻拍手势(使用代理)
            self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.useMyDelegateFunc)))
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
//代理方法

    func useMyDelegateFunc() {
        self.myDelegate?.rowsForChatTable(tableviewCell: self)
        self.myDelegate?.chatTableView(tableviewCell: self, dataForRow: 1)
    }
}
