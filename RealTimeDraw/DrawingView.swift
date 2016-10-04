//
//  DrawingView.swift
//  RealTimeDraw
//
//  Created by Dan Lindsay on 2016-10-04.
//  Copyright © 2016 Dan Lindsay. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    var currentTouch: UITouch?
    var currentPath: Array<CGPoint>?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if (currentPath == nil) {
         //   currentTouch = UITouch()
           
            currentTouch = touches.first
            let currentPoint = currentTouch?.location(in: self)
            if let currentPoint = currentPoint {
           //      currentPath = Array<CGPoint>()
         
                currentPath?.append(currentPoint)
                print("DAN: Start a new path with point \(currentPoint)")
            } else {
                print("DAN: Find an empty touch")
            }
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (currentPath == nil) {
            for touch in touches {
                if (currentTouch == touch) {
                    let currentPoint = currentTouch?.location(in: self)
                    if let currentPoint = currentPoint {
                        currentPath?.append(currentPoint)
                        print("DAN: Append a new path with point \(currentPoint)")
                    } else {
                        print("DAN: Find an empty touch")
                    }
                }
            }
        }
        super.touchesMoved(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        currentTouch = nil
        currentPath = nil
        print("DAN: Touch cancelled")
        super.touchesCancelled(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (currentPath == nil) {
            for touch in touches {
                if (currentTouch == touch) {
                    let currentPoint = currentTouch?.location(in: self)
                    if let currentPoint = currentPoint {
                        currentPath?.append(currentPoint)
                        print("DAN: End a new path with point \(currentPoint)")
                    } else {
                        print("DAN: Find an empty touch")
                    }
                }
            }
        }
        currentTouch = nil
        currentPath = nil
        super.touchesEnded(touches, with: event)
    }
}
