//
//  DrawBoardView.swift
//  Draw
//
//  Created by Objective-C on 2017/1/6.
//  Copyright © 2017年 Quan Wai.Inc. All rights reserved.
//

/**
 画板
 */

import UIKit

class DrawBoardView: UIView {
    let count = CGFloat()
    
    var path = UIBezierPath() //当前画线的路径
    var color = UIColor() //当前画线的颜色
    var font_size = CGFloat() //当前画线的线宽
    var pointArray = NSMutableArray() //保存当前路径上的点
    var pathArray = NSMutableArray() //保存绘制线条的path
    var currentPath = UIBezierPath() //当前绘制的路径
    var currentPoint = CGPoint() //当前点
    
    //初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow;
        
        //初始化线的颜色和宽度
        self.color = UIColor.black;
        self.font_size = 4;
    }
    
    //不写下面的方法就报错
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //画线
    //触摸开始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //创建path
        let path = UIBezierPath();
        self.pathArray.add(path);
        self.currentPath = path;
        
        //获取当前触摸点
        let touch:UITouch = touches.first! as UITouch;
        //当前点赋值
        self.currentPoint = touch.location(in: self);
        //移动到触摸点（原点）
        self.currentPath.move(to: self.currentPoint);
        
        //百分比转换
        let point_x:CGFloat = self.currentPoint.x;
        let point_y:CGFloat = self.currentPoint.y;
        let point_dict:NSDictionary = ["x":100*point_x/mScreenWidth,
                                       "y":100*point_y/mScreenHeight]
        //保存下这个点
        self.pointArray.add(point_dict);
    }
    
    //触摸移动
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //当前移动点
        let touch:UITouch = touches.first! as UITouch;
        self.currentPoint = touch.location(in: self);
        let path = self.currentPath;
        path.addLine(to: self.currentPoint);
        
        //百分比转换
        let point_x:CGFloat = self.currentPoint.x;
        let point_y:CGFloat = self.currentPoint.y;
        let point_dict:NSDictionary = ["x":100*point_x/mScreenWidth,
                                       "y":100*point_y/mScreenHeight]
        //保存下这个点
        self.pointArray.add(point_dict);
        
        self.setNeedsDisplay();
    }
    
    //触摸结束
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //上传保存的点
        NSLog("%@", self.pointArray);
    }
    
    //触摸取消
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    //draw rect
    override func draw(_ rect: CGRect) {
        for index in 0 ..< self.pathArray.count {
            let path:UIBezierPath = self.pathArray.object(at: index) as! UIBezierPath;
            //线条宽度
            path.lineWidth = self.font_size;
            //填充色(透明)
            UIColor.clear.set();
            path.fill();
            //线条颜色
            self.color.set();
            path.stroke();
            //圆角线条
            path.lineCapStyle = CGLineCap(rawValue: 1)!;
            path.lineJoinStyle = CGLineJoin(rawValue: 1)!;
        }
    }
    
    
    
    //temp code
//    for touch: AnyObject in touches {
//    let temp_touch:UITouch = touch as! UITouch
//    NSLog("-*- %f -*- %f", temp_touch.location(in: self).x, temp_touch.location(in: self).y)
//    }
    
    //如果当前panth为空，要remove掉
//    if __CGSizeEqualToSize(self.currentPath.bounds.size, CGSize.zero) {
//    self.pathArray.remove(self.currentPath);
//    NSLog("******");
//    } else {
//    //上传保存的点
//    NSLog("%@", self.pointArray);
//    }

}
