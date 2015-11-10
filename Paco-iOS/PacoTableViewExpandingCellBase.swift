//
//  PacoTableViewExpandingCellBase.swift
//  Paco
//
//  Created by northropo on 11/5/15.
//  Copyright (c) 2015 Paco. All rights reserved.
//

import UIKit

class PacoTableViewExpandingCellBase: UITableViewCell {
    

    var frameAdded = false
    func getView() -> UIView {
        
        return UIView()
        
    }
    
    
    func getHeight() -> CGFloat
    {
       return 0
    }
    
    
    func getNoneExpandedHeight() -> CGFloat
    {
        return 0
    }
    
    
    func checkHeight() {
       getView().hidden = (frame.size.height < getHeight())
    }
    
    func watchFrameChanges() {
        if(!frameAdded){
            addObserver(self, forKeyPath: "frame", options: NSKeyValueObservingOptions.New|NSKeyValueObservingOptions.Initial, context: nil)
            frameAdded = true
        }
    }
    
    func ignoreFrameChanges() {
        if(frameAdded){
            removeObserver(self, forKeyPath: "frame")
            frameAdded = false
        }
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
    deinit {
        
        ignoreFrameChanges()
    }
 
}
