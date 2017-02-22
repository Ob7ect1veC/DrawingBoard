//
//  ViewController.swift
//  Draw
//
//  Created by Objective-C on 2017/1/6.
//  Copyright © 2017年 Quan Wai.Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var drawBoard = DrawBoardView()
    var anotherDrawBoard = AnotherDrawBoard();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.drawBoard = DrawBoardView(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height));
//        self.view.addSubview(self.drawBoard);
        
        self.anotherDrawBoard = AnotherDrawBoard(frame: CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height));
        self.view.addSubview(self.anotherDrawBoard);
    }

}

