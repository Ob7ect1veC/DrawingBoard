//
//  ViewController.swift
//  Draw
//
//  Created by Objective-C on 2017/1/6.
//  Copyright © 2017年 Quan Wai.Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //两种不同的实现方式
    var drawBoard = DrawBoardView()
    var anotherDrawBoard = AnotherDrawBoard();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawBoard = DrawBoardView(frame: CGRect(x:0, y:0, width:mScreenWidth, height:mScreenHeight));
        self.view.addSubview(self.drawBoard);
        
//        self.anotherDrawBoard = AnotherDrawBoard(frame: CGRect(x:0, y:0, width:mScreenWidth, height:mScreenHeight));
//        self.view.addSubview(self.anotherDrawBoard);
    }

}

