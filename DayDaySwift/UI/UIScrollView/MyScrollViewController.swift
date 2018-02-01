//
//  myScrollViewController.swift
//  DayDaySwift
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class MyScrollViewController: UIViewController {
    var number:Int!
    //字典
    let colorMap = [1:UIColor.black,
                    2:UIColor.orange,
                    3:UIColor.blue,
                    4:UIColor.red]

    
    
//MARK:重写初始化方法
//------------------------------------------------------------------------
    init(number initNumber:Int) {
        self.number = initNumber
        super.init(nibName: nil, bundle: nil)
    }
    //必须写
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//------------------------------------------------------------------------
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        numberLabel.center = self.view.center
        numberLabel.text = "第\(number!)页"
        numberLabel.textAlignment = .center
        numberLabel.textColor = UIColor.white
        self.view.addSubview(numberLabel)
        self.view.backgroundColor = colorMap[number]
        
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

}
