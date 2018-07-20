//
//  parallaxViewController.swift
//  sideScrollDemo
//
//  Created by Justin Young on 7/19/18.
//  Copyright © 2018 Justin Young. All rights reserved.
//

import UIKit

struct scrollViewDataStruct {
    let title : String?
    let foreground : UIImage?
    let background : UIImage?
    
    
}

class parallaxViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var pageControl : UIPageControl = UIPageControl(frame: CGRect(x:0,y: 590, width:370, height:100))
    var scrollViewData = [scrollViewDataStruct]()
    var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
    
    var BackViewTagValue = 1000
    var ForeViewTagValue = 10
    var tagValue = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        for index in 0..<4 {
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
        }
        
        //self.scrollView.contentSize = CGSize(width:self.scrollView.frame.size.width * 4,height: self.scrollView.frame.size.height)
        //pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)

        // Do any additional setup after loading the view.
        
        scrollViewData = [scrollViewDataStruct.init(title: "Now time ", foreground: #imageLiteral(resourceName: "image_part_001"), background: #imageLiteral(resourceName: "image_part_002-1")),
                          scrollViewDataStruct.init(title: "to figure out", foreground: #imageLiteral(resourceName: "image_part_002"), background: #imageLiteral(resourceName: "image_part_003-1")),
                          scrollViewDataStruct.init(title: "how to parallax", foreground: #imageLiteral(resourceName: "image_part_003"), background: #imageLiteral(resourceName: "image_part_004-1")),
                          scrollViewDataStruct.init(title: "images", foreground: #imageLiteral(resourceName: "image_part_004"), background: #imageLiteral(resourceName: "image_part_005"))]
        
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(scrollViewData.count)
        
        //adding part 1 of background, seperate from the other views.
        let sideViewLeft = CustomView(frame: CGRect(x: 100,y: 0,width: self.scrollView.frame.width-180, height: self.scrollView.frame.height-90))
        sideViewLeft.imageView.image = #imageLiteral(resourceName: "image_part_001-1.png")
        sideViewLeft.tag = 10000
        self.scrollView.addSubview(sideViewLeft)
        //print("HEIGHT IS \(self.scrollView.frame.height-90)" )
        
        
        
        var i = 0
        for data in scrollViewData{
            
            let view2 = CustomView(frame: CGRect(x: (self.scrollView.frame.width * CGFloat(i)),y: 0,width: self.scrollView.frame.width-180, height: self.scrollView.frame.height - 90))
            
            view2.imageView.image = data.background
            view2.tag = i + BackViewTagValue
            //THIS IS WHERE TO ADD SUBVIEWS... CREATE IN STORY BOARDS?
            self.scrollView.addSubview(view2)
            print("HEIGHT IS \(self.scrollView.frame.height-90)" )
            
            let view = CustomView(frame: CGRect(x: (self.scrollView.frame.width * CGFloat(i)),y: 300,width: self.scrollView.frame.width, height: self.scrollView.frame.height - 90))
            view.imageView.image = data.foreground
            view.tag = i + ForeViewTagValue
            //THIS IS WHERE TO ADD SUBVIEWS... CREATE IN STORY BOARDS? 
            self.scrollView.addSubview(view)
            
            let label = UILabel(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 20), size: CGSize.init(width: 0, height: 40)))
            label.text = data.title
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.textColor = UIColor.black
            label.sizeToFit()
            label.tag = i + tagValue
            if i == 0{
                label.center.x = view.center.x
            } else {
                label.center.x = view.center.x - self.scrollView.frame.width / 2
            }
          
            self.scrollView.addSubview(label)
            
            i += 1
        }
        
        let sideViewRight = CustomView(frame: CGRect(x: 1005,y: 0,width: self.scrollView.frame.width-180, height: self.scrollView.frame.height-90))
        sideViewRight.imageView.image = #imageLiteral(resourceName: "image_part_006.png")
        sideViewRight.tag = 100000
        self.scrollView.addSubview(sideViewRight)
        //print("HEIGHT IS \(self.scrollView.frame.height-90)" )
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView {
            for i in 0..<scrollViewData.count {
                let label = scrollView.viewWithTag(i+tagValue) as! UILabel
                let view = scrollView.viewWithTag(i + ForeViewTagValue) as! CustomView
                let view2 = scrollView.viewWithTag(i + BackViewTagValue) as! CustomView
                let backgroundLeft = scrollView.viewWithTag(10000) as! CustomView
                let backgroundRight = scrollView.viewWithTag(100000) as! CustomView
                let scrollContentOffset = scrollView.contentOffset.x + self.scrollView.frame.width
                let viewOffset = (view.center.x - scrollView.bounds.width / 4) - scrollContentOffset
                label.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset / 2))
                view2.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset / 2)) + 50
                backgroundLeft.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset / 2)) - 695
                backgroundRight.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset / 2)) + 245
                print(backgroundLeft.center.x)
                print(backgroundRight.center.x)
            }
        }
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        self.view.addSubview(pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

class CustomView: UIView {
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = UIColor.white
            imageView.contentMode = .scaleAspectFit
            return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
