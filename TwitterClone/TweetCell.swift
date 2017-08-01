//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/28/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [ NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameWithSpaceString = " \(tweet.user.username)\n"
            
            attributedText.append(NSMutableAttributedString(string: usernameWithSpaceString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            attributedText.append(NSMutableAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            messageTextView.attributedText = attributedText
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        
        addSubview(profileImageView)
        addSubview(messageTextView)
       // addSubview(replyButton)
        setupBottomButtons()

        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
       // replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        


        backgroundColor = .white
        
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    } ()
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "sample TEXT for tor the MESSAge text view and lets have it go around a little bit"
        tv.backgroundColor = .clear
        return tv
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply"), for: .normal)
        button.tintColor = UIColor(r: 230, g: 230, b: 230)
        button.backgroundColor = .clear
        return button
    } ()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet"), for: .normal)
        button.tintColor = UIColor(r: 230, g: 230, b: 230)
        button.backgroundColor = .clear
        return button
    } ()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        button.tintColor = UIColor(r: 230, g: 230, b: 230)
        button.backgroundColor = .clear
        return button
    } ()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "message"), for: .normal)
        button.tintColor = UIColor(r: 230, g: 230, b: 230)
        //button.backgroundColor = .clear
        return button
    } ()
    
    fileprivate func setupBottomButtons(){
       
        
        let replyButtonContainerView = UIView()
        let retweetButtonContainerView = UIView()
        let likeButtonContainerView = UIView()
        let messageButtonContainerView = UIView()
        
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, messageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
       // buttonStackView.backgroundColor = .clear
        
        addSubview(buttonStackView)
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(messageButton)
        
        
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        messageButton.anchor(messageButtonContainerView.topAnchor, left: messageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
}
