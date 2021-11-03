//
//  ViewController.swift
//  Routine
//
//  Created by doremin on 2021/11/02.
//

import UIKit

import SnapKit

class RoutineViewController: UIViewController {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "아침 루틴"
    label.font = .systemFont(ofSize: 26, weight: .bold)
    return label
  }()
  
  let moreButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1.0)
    button.setImage(UIImage(systemName: "ellipsis")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
    button.layer.cornerRadius = 15
    return button
  }()
  
  let subtitleLabel: UILabel = {
    let label = UILabel()
    label.text = "7:00am ~ 7:35am"
    label.textColor = .lightGray
    label.font = .systemFont(ofSize: 14)
    return label
  }()
  
  let startButton: UIButton = {
    let button = UIButton()
    button.layer.cornerRadius = 22
    button.backgroundColor = UIColor(red: 45 / 255, green: 47 / 255, blue: 61 / 255, alpha: 1.0)
    return button
  }()
  
  let startLabel: UILabel = {
    let label = UILabel()
    label.text = "시작"
    label.textColor = .white
    label.font = .systemFont(ofSize: 17)
    return label
  }()
  
  let tableView = UITableView()
  
  let routines = [
    Routine(image: .init(systemName: "person"), title: "공부하기", minutes: 15),
    Routine(image: .init(systemName: "person"), title: "공부하기", minutes: 15),
    Routine(image: .init(systemName: "person"), title: "공부하기", minutes: 15),
    Routine(image: .init(systemName: "person"), title: "공부하기", minutes: 15),
    Routine(image: .init(systemName: "person"), title: "공부하기", minutes: 15),
    Routine(image: .init(systemName: "person"), title: "공부하기", minutes: 15)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.moreButton)
    self.view.addSubview(self.subtitleLabel)
    self.view.addSubview(self.tableView)
    self.view.addSubview(self.startButton)
    self.startButton.addSubview(self.startLabel)
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: "aa")
    self.tableView.separatorStyle = .none
    
    self.makeConstraints()
  }
  
  func makeConstraints() {
    self.titleLabel.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(30)
      make.left.equalTo(30)
    }
    
    self.subtitleLabel.snp.makeConstraints { make in
      make.left.equalTo(self.titleLabel)
      make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
    }
    
    self.moreButton.snp.makeConstraints { make in
      make.right.equalTo(-20)
      make.centerY.equalTo(self.titleLabel)
      make.size.equalTo(30)
    }
    
    self.startButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.width.equalTo(140)
      make.height.equalTo(44)
      make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
    }
    
    self.startLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
    
    self.tableView.snp.makeConstraints { make in
      make.left.equalTo(30)
      make.right.equalTo(-30)
      make.top.equalTo(self.subtitleLabel.snp.bottom).offset(20)
      make.bottom.equalToSuperview()
    }
  }
}

extension RoutineViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    self.present(RoutineDetailViewController(routine: self.routines[indexPath.row]), animated: true, completion: nil)
  }
}

extension RoutineViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.routines.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "aa") as? RoutineTableViewCell else {
      return UITableViewCell()
    }
    
    cell.routine = self.routines[indexPath.row]
    return cell
  }
}
