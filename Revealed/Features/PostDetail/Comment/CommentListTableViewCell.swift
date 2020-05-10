//
//  CommentListTableViewCell.swift
//  Revealed
//
//  Created by KokHong on 10/5/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Combine
import SwiftUI

final class CommentListTableViewCell: UITableViewCell {
  
  static let identifier = String(describing: self)
  
  private lazy var contentLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
    return label
  }()
  
  private lazy var companyAuthorLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
    return label
  }()
  
  private lazy var upImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "arrow.up"))
    return imageView
  }()
  
  private lazy var timeImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "clock"))
    return imageView
  }()
  
  private lazy var commentImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(systemName: "text.bubble.fill"))
    return imageView
  }()
  
  private lazy var upLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12.0, weight: .semibold)
    return label
  }()
  
  private lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
    return label
  }()
  

  private lazy var commentLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
    return label
  }()
  
  // MARK: Stack View
  private lazy var upAndTimeStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      upImageView,
      upLabel,
      timeImageView,
      timeLabel
    ])
    
    stackView.axis = .horizontal
    stackView.spacing = 4.0
    
    return stackView
  }()
  
  private lazy var commentStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [
      commentImageView,
      commentLabel
    ])
    
    stackView.axis = .horizontal
    stackView.spacing = 4.0
    
    return stackView
  }()
  
  private var disposables = Set<AnyCancellable>()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
  func layout() {
    [contentLabel, companyAuthorLabel, upAndTimeStackView, commentStackView].forEach(contentView.addSubview)
    
    contentLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().offset(16.0)
      make.trailing.equalToSuperview().offset(-16.0)
    }
    
    companyAuthorLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(16.0)
      make.top.equalTo(contentLabel.snp.bottom).offset(13.0)
    }
    
    upAndTimeStackView.snp.makeConstraints { make in
      make.bottom.equalToSuperview().offset(-16.0)
      make.leading.equalToSuperview().offset(16.0)
      make.top.equalTo(companyAuthorLabel.snp.bottom).offset(8.0)
    }
    
    commentStackView.snp.makeConstraints { make in
      make.trailing.equalToSuperview().offset(-16.0)
      make.top.bottom.equalTo(upAndTimeStackView)
    }
  }
  
  func bind(comment: CommentDetail) {
    
    //TODO: Change orangisation name
    let companyAuthorText = "Ericsson・\(comment.author.fragments.userDetail.username)"
    companyAuthorLabel.text = companyAuthorText
    
    contentLabel.text = comment.content
    //TODO: Integrate up count
    upLabel.text = "1"
    
    timeLabel.text = Date(timeIntervalSince1970: Double(comment.createdAt)).relativeDateString()
    
    //TODO: Integrate comment with comment
    commentStackView.isHidden = true
  }
}
