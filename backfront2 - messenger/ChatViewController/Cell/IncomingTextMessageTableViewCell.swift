//
//  IncomingTextMessageTableViewCell.swift
//  backfront2 - messenger
//
//  Created by Hugo Silva on 17/11/22.
//

import UIKit

class IncomingTextMessageTableViewCell: UITableViewCell {
   
   static let identifier = "IncomingTextMessageTableViewCell"
   
   lazy var contactMessage: UIView = {
      let bv = UIView()
      bv.translatesAutoresizingMaskIntoConstraints = false
      bv.backgroundColor = UIColor(white: 0, alpha: 0.06)
      bv.layer.cornerRadius = 20
      bv.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
      return bv
   }()
   
   lazy var messageTextLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 0
      label.textColor = .darkGray
      label.font = UIFont(name: CustomFont.poppinsMedium, size: 14)
      return label
   }()
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.addViews()
      self.addConstraints()
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
}

extension IncomingTextMessageTableViewCell {
   public func setupCell(message: Message?) {
      self.messageTextLabel.text = message?.texto
   }
}

extension IncomingTextMessageTableViewCell {
   func addViews() {
      self.addSubview(self.contactMessage)
      self.contactMessage.addSubview(self.messageTextLabel)
      self.isSelected = false
   }
   func addConstraints () {
      NSLayoutConstraint.activate([
         self.contactMessage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.contactMessage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         self.contactMessage.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
         
         self.messageTextLabel.leadingAnchor.constraint(equalTo: self.contactMessage.leadingAnchor, constant: 15),
         self.messageTextLabel.topAnchor.constraint(equalTo: self.contactMessage.topAnchor, constant: 15),
         self.messageTextLabel.bottomAnchor.constraint(equalTo: self.contactMessage.bottomAnchor, constant: -15),
         self.messageTextLabel.trailingAnchor.constraint(equalTo: self.contactMessage.trailingAnchor, constant: -15)
      ])
   }
}
