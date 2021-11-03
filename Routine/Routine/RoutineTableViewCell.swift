//
//  RoutineTableViewCell.swift
//  Routine
//
//  Created by doremin on 2021/11/02.
//

import UIKit
import SnapKit

class RoutineTableViewCell: UITableViewCell {
  
  let iconImageView = UIImageView()
  
  let backgroundColorView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1.0)
    view.layer.cornerRadius = 15
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .systemFont(ofSize: 16, weight: .semibold)
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = .systemFont(ofSize: 13)
    return label
  }()
  
  var routine: Routine? {
    willSet {
      self.iconImageView.image = newValue?.image
      self.titleLabel.text = newValue?.title
      self.timeLabel.text = "\(newValue?.minutes ?? 0)분"
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    self.addSubview(self.backgroundColorView)
    self.backgroundColorView.addSubview(self.iconImageView)
    self.backgroundColorView.addSubview(self.titleLabel)
    self.backgroundColorView.addSubview(self.timeLabel)
    
    self.makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func makeConstraints() {
    self.backgroundColorView.snp.makeConstraints { make in
      make.top.equalTo(5)
      make.height.equalTo(50)
      make.left.right.equalToSuperview()
      make.bottom.equalTo(-5)
    }
    
    self.iconImageView.snp.makeConstraints { make in
      make.left.equalTo(10)
      make.centerY.equalToSuperview()
      make.width.equalTo(30)
      make.height.equalTo(30)
    }
    
    self.titleLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalTo(self.iconImageView.snp.right).offset(10)
    }
    
    self.timeLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.left.equalTo(self.titleLabel.snp.right).offset(20)
    }
  }
}
