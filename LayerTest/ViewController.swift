//
//  ViewController.swift
//  LayerTest
//
//  Created by Scott Gardner on 11/30/14.
//  Copyright (c) 2014 Scott Gardner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var testView: UIView!
  
  var l: CALayer {
    return testView.layer
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLayer()
  }
  
  func setUpLayer(){
    l.backgroundColor = UIColor.blueColor().CGColor
    l.contents = UIImage(named: "star")?.CGImage
    l.contentsGravity = kCAGravityCenter
    l.geometryFlipped = true
    l.borderWidth = 100.0
    l.borderColor = UIColor.redColor().CGColor
    l.shadowOpacity = 0.7
    l.shadowRadius = 10.0
  }
  
  @IBAction func tapGestureRecognized(sender: UITapGestureRecognizer) {
    l.shadowOpacity = l.shadowOpacity == 0.7 ? 0.0 : 0.7
  }
  
  @IBAction func pinchGestureRecognized(sender: UIPinchGestureRecognizer) {
    let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
    let oldFrame = l.frame
    let oldOrigin = oldFrame.origin
    let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
    let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
    let newFrame = CGRect(origin: newOrigin, size: newSize)
    if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
      l.borderWidth -= offset
      l.cornerRadius += (offset / 2.0)
      l.frame = newFrame
    }
  }

}

