//
//  RoutineDetailViewController.swift
//  Routine
//
//  Created by doremin on 2021/11/04.
//

import UIKit

class RoutineDetailViewController: UIViewController {
  
  // MARK: UI
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.text = self.routine.title
    return label
  }()
  
  private lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.text = "\(self.routine.minutes)분"
    return label
  }()
  
  // MARK: Properties
  private let routine: Routine
  
  // MARK: Initialize
  init(routine: Routine) {
    self.routine = routine
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.timeLabel)
    
    self.makeConstraints()
  }
  
  // MARK: Constraints
  func makeConstraints() {
    self.titleLabel.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
      make.centerX.equalToSuperview()
    }
    
    self.timeLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(self.titleLabel.snp.bottom).offset(30)
    }
  }
}
