//
//  EVKFeedListViewController.swift
//  iFeed
//
//  Created by Evgeny Karkan on 8/14/15.
//  Copyright (c) 2015 Evgeny Karkan. All rights reserved.
//

import UIKit


class EVKFeedListViewController: EVKBaseViewController, EVKXMLParserProtocol {

    //MARK: - property
    
    var feedView: EVKFeedListView
    
    
    //MARK: - Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        feedView = EVKFeedListView()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Life cycle
    
    override func loadView() {
        
        var aView = EVKFeedListView (frame: UIScreen.mainScreen().bounds)
        
        feedView = aView
        self.view = aView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var addButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add,
                                                                     target: self,
                                                                     action: "addPressed:")
        self.navigationItem.setRightBarButtonItems([addButton], animated: false)
    }
    
    
    //MARK: - Private
    
    private func startParsingURL(URL: String) {
        
        let parser            = EVKXMLParser()
        parser.parserDelegate = self
        
        parser.beginParseURL(NSURL(string: URL)!)
        
        //parser.beginParseURL(NSURL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=25/xml")!)
        
        //http://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml
    }
    
    
    //MARK: - Actions
    
    func addPressed (sender:UIButton) {
        
        assert(!sender.isEqual(nil), "sender is nil")
        
        showAlertView(sender);
    }
    
    
    //MARK: - Inherited from base
    
    override func addFeedPressed (URL: String) {
        
        startParsingURL(URL)
    }
    
    
    //MARK: - EVKXMLParserProtocol API
    
    func didEndParsingFeed(feed: EVKFeed) {
        
        println(feed)
        
        println(feed.feedItemsArray)
    }
}
