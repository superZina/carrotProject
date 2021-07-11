//
//  myLocationViewController+Layout.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/09.
//

import UIKit

extension myLocationViewController{
    //navigation bar layout
    func setNavLayout() {
        //title
        let title = UIBarButtonItem(title: "내 근처",
                                    style: .plain,
                                    target: nil,
                                    action: nil)
        title.isEnabled = false
        title.setTitleTextAttributes([ .font : UIFont.systemFont(ofSize: 20, weight: .heavy) ,
                                       .foregroundColor : UIColor.black ],
                                     for: .disabled)
        
        //right tabbar Buttons
        let search = UIBarButtonItem(image: UIImage(named: "search"),
                                       style: .plain,
                                       target: nil,
                                       action: nil)
        
        let categroy = UIBarButtonItem(image: UIImage(named: "pencil"),
                                       style: .plain,
                                       target: nil,
                                       action: nil)
        
        let qr = UIBarButtonItem(image: UIImage(named: "qrIcon"),
                                       style: .plain,
                                       target: nil,
                                       action: nil)
        
        let bell = UIBarButtonItem(image: UIImage(named: "bell"),
                                       style: .plain,
                                       target: nil,
                                       action: nil)
        
        search.imageInsets = UIEdgeInsets(top: 0, left: 90, bottom: 0, right: -25)
        categroy.imageInsets = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: -25)
        qr.imageInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: -25)
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        navigationItem.leftBarButtonItem = title
        navigationItem.rightBarButtonItems = [ bell , qr , categroy , search ]
        
    }
    
    //scrollView layout
    func setScrollViewLayout() {
        
        var scrollView: UIScrollView!
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: scrollViewHeight))
        scrollView.contentSize = CGSize(width: screenSize.width, height: scrollViewHeight)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        scrollView.setTop(view.topAnchor, 0)
        scrollView.setLeading(view.leadingAnchor, 0)
        scrollView.setTrailing(view.trailingAnchor, 0)
        scrollView.setBottom(view.bottomAnchor, 0)
        
        contentView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: scrollViewHeight)
        scrollView.addSubview(contentView)
        contentView.backgroundColor = .textFieldBlue
        
        contentView.setTop(scrollView.topAnchor, 0)
        contentView.setLeading(scrollView.leadingAnchor, 0)
        contentView.setTrailing(scrollView.trailingAnchor, 0)
        contentView.setBottom(scrollView.bottomAnchor, 0)
    }
    
    //search view Layout
    func setSearchButtonLayout() {
        searchContainerView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 123)
        
        contentView.addSubview(searchContainerView)
        searchContainerView.addSubview(searchButton)
        
        searchContainerView.backgroundColor = .white

                
        searchButton.anchor(top: searchContainerView.topAnchor, left: searchContainerView.leftAnchor,
                            right: searchContainerView.rightAnchor,
                            paddingTop: 15, paddingLeft: 15, paddingRight: 15, height: 50)

    }
    
    //keyword collection view
    func setKeywordCollectionViewLayout() {
        searchContainerView.addSubview(keywordCollectionView)
        keywordCollectionView.frame = CGRect(x: 0, y: 65, width: screenSize.width, height: 58)

    }
    
    //menu collection view
    func setMenuCollectionViewLayout() {
        bottomContainerView.frame = CGRect(x: 0, y: searchContainerView.frame.maxY + 8, width: screenSize.width, height: scrollViewHeight - searchContainerView.frame.maxY)
        contentView.addSubview(bottomContainerView)
        bottomContainerView.setBottom(contentView.bottomAnchor, 0)
        bottomContainerView.backgroundColor = .white
        
        bottomContainerView.addSubview(menuCollectionView)
        menuCollectionView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 400)
    }
    
    //nearby table view
    func setNearbyTableViewLayout(){
        bottomContainerView.addSubview(nearbyLabel)
        bottomContainerView.addSubview(nearbyTableview)
        bottomContainerView.addSubview(nearbyDetailButton)
        
        nearbyLabel.frame = CGRect(x: 15, y: menuCollectionView.frame.maxY, width: 100, height: 35)
        nearbyTableview.anchor(top: nearbyLabel.bottomAnchor, left: bottomContainerView.leftAnchor, right: bottomContainerView.rightAnchor,
                               paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 15,
                               height: 345)
        nearbyDetailButton.anchor(top: nearbyTableview.bottomAnchor, left: bottomContainerView.leftAnchor, right:bottomContainerView.rightAnchor,
                                  paddingTop: 10, paddingLeft: 15, paddingRight: 15,
                                  height: 35)
    }
        
    func recommendLayout(){
        bottomContainerView.addSubview(recommendLabel)
        bottomContainerView.addSubview(recommendCollectionView)
        
        recommendLabel.anchor(top: nearbyDetailButton.bottomAnchor, left: bottomContainerView.leftAnchor,
                              paddingTop: 50, paddingLeft: 15)
        recommendCollectionView.anchor(top: recommendLabel.bottomAnchor, left: bottomContainerView.leftAnchor, right: bottomContainerView.rightAnchor,
                                               paddingTop: 0, paddingLeft: 0, paddingRight: 0, height: 300)
    }
    
    func setBusinessLayout() {
        bottomContainerView.addSubview(businessView)
        businessView.addSubview(businessLabel)
        businessView.addSubview(businessProfileButton)
        
        businessView.anchor(top: recommendCollectionView.bottomAnchor, left: bottomContainerView.leftAnchor, bottom: bottomContainerView.bottomAnchor, right: bottomContainerView.rightAnchor,
                            paddingTop: 0, paddingLeft: 15, paddingBottom: 15, paddingRight: 15)
        
        businessLabel.anchor(top: businessView.topAnchor, left: businessView.leftAnchor, right: businessView.rightAnchor,
                             paddingTop: 20, paddingLeft: 15)
        
        businessProfileButton.anchor(top: businessLabel.bottomAnchor, left: businessView.leftAnchor, right: businessView.rightAnchor, paddingTop: 10, paddingLeft: 15)
    }
}


