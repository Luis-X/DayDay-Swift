//
//  ScrollViewViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController, UIScrollViewDelegate {
    var scrollView:UIScrollView!
    let numberPages:Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIScrollView"
        self.createUIScrollView()
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

    func createUIScrollView(){
//MARK: UIScrollView
        scrollView = UIScrollView()
        //屏幕大小
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        //内容为图片的大小
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * CGFloat(numberPages), height: scrollView.frame.size.height)
        //触摸状态栏是否可以滚动到顶部
        scrollView.scrollsToTop = false
        //滚动条样式
        scrollView.indicatorStyle = .black
        //是否整屏滚动
        scrollView.isPagingEnabled = true
        //水平滚动条
        scrollView.showsHorizontalScrollIndicator = true
        //竖直滚动条
        scrollView.showsVerticalScrollIndicator = true
        //缩放
        //最小尺寸
        scrollView.minimumZoomScale = 0.1
        //最大尺寸
        scrollView.maximumZoomScale = 3
        scrollView.delegate = self
    
/*
         //图片
        for i in 0..<numberPages {
            let imageView = UIImageView(frame: CGRectMake(scrollView.frame.size.width * CGFloat(i), 0, scrollView.frame.size.width, scrollView.frame.size.height - 64))
            imageView.contentMode = .ScaleAspectFit
            imageView.image = UIImage(named: "\(i + 1).jpg")
            //打开交互
            imageView.userInteractionEnabled = true
            scrollView.addSubview(imageView)
        }
*/
        //视图控制器
        for i in 0..<numberPages {
            //重写了初始化方法
            let myViewController = MyScrollViewController(number: (i + 1))
            myViewController.view.frame = CGRect(x: scrollView.frame.size.width * CGFloat(i), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height - 48)
            scrollView.addSubview(myViewController.view)
        }
        self.view.addSubview(scrollView)
    }
    
    
    
    
    
//MARK: UIScrollViewDelegate
    //缩放触发
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("缩放中...")
        for subView:AnyObject in scrollView.subviews {
            if subView.isKind(of: UIImageView.self) {
                return subView as? UIView
            }
        }
        return nil
    }
}
