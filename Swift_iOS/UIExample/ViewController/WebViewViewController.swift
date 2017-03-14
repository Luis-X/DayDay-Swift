//
//  WebViewViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class WebViewViewController: UIViewController, UIWebViewDelegate {
    var segmentControl:UISegmentedControl!
    var webView:UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIWebView"
        createUIWebView()
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

    func createUIWebView(){
        
        let segmentItmes = ["Request", "HTML", "Data"]
        segmentControl = UISegmentedControl(items: segmentItmes)
        segmentControl.frame = CGRect(x: 10, y: 10, width: self.view.frame.size.width - 20, height: 30)
        segmentControl.selectedSegmentIndex = 0
        self.view.addSubview(segmentControl)
        segmentControl.addTarget(self, action: #selector(self.segmentChange(_:)), for: .valueChanged)
        
        
        
        
        
//MARK: -UIWebView
        webView = UIWebView(frame: CGRect(x: 0, y: segmentControl.frame.origin.y + segmentControl.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height - segmentControl.frame.size.height - 64 - 10))
//属性
        //是否可以放大缩小页面            (默认:false)
        webView.scalesPageToFit = true
        //探测类型          (自动变成可点击的链接)
        webView.dataDetectorTypes = .all
        //决定内嵌HTML5播放视频还是用本地的全屏控制
        webView.allowsInlineMediaPlayback = true
        //是否需要用户触发来启动媒体播放
        webView.mediaPlaybackRequiresUserAction = true
        //页面是否可以Air Play
        webView.mediaPlaybackAllowsAirPlay = true
        //网页内容的渲染是否在把内容全部加载到内存中再去处理
        webView.suppressesIncrementalRendering = false
        //用户点击页面的元素或者相关联的输入显示键盘
        webView.keyboardDisplayRequiresUserAction = true
        //自动分页模式
        webView.paginationMode = .unpaginated
//加载
        //加载网页  异步
        //webView.loadRequest(<#T##request: NSURLRequest##NSURLRequest#>)
        //加载HTML字符串
        //webView.loadHTMLString(<#T##string: String##String#>, baseURL: <#T##NSURL?#>)
        //加载指定内容           (主页内容, MIME类型, 内容编码, 基准URL)
        //webView.loadData(<#T##data: NSData##NSData#>, MIMEType: <#T##String#>, textEncodingName: <#T##String#>, baseURL: <#T##NSURL#>)
//方法
/*
        //停止加载
        webView.stopLoading()
        //重新加载
        webView.reload()
        //返回浏览历史上一页
        webView.goBack()
        //前进浏览历史下一页
        webView.goForward()
*/
        self.view.addSubview(webView)
    }
    
    
    
    

//MARK: -UIWebViewDelegate
    //加载网页时
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("加载中")
        return true
    }
    
    //开始加载之前
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("加载前")
    }
    //加载完成之后
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("加载后")
    }
    //加载错误
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("加载错误")
    }
    
    
    
    
    
    func segmentChange(_ sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0://Request
            webView.loadRequest(URLRequest(url: URL(string: "https://www.baidu.com")!))
        case 1://HTML
            let html = "<h1><a href='http://ucai.cn'>百度(https://www.baidu.com)</a>,助力优秀人才成长!</h1>"
            webView.loadHTMLString(html, baseURL: nil)
        case 2://Data
            let path = Bundle.main.path(forResource: "2048", ofType: "pdf")
            if (path == nil) {
                print("本地没有此文件!")
                break
            }
            let urlStr = URL(fileURLWithPath: path!)
            let data = try? Data(contentsOf: urlStr)
            
            if (data != nil) {
                //webView.load(data!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL:URL())
            }

        default:
            print("是不是出错了?")
            break
        }
    }
}
