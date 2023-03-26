//
//  ViewController.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Roadmap"

        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.backIndicatorImage = nil
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = nil

        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(userButtonTapped))
        userButton.tintColor = .systemBlue
        navigationItem.leftBarButtonItem = userButton

        let bellButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(bellButtonTapped))
        bellButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = bellButton

        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        setConstraints()
    }

    private func setConstraints() {
        tableView.separatorStyle = .none
//        tableView.separatorStyle = .singleLine

        tableView.contentInset = .zero
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 450
        tableView.backgroundColor = .clear

        tableView.snp.makeConstraints {
                    $0.edges.equalTo(view.safeAreaLayoutGuide)
                }
    }

    @objc func userButtonTapped() {
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }

    @objc func bellButtonTapped() {
        let profileVC = NotificationsViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        if indexPath.row == 0 {
            cell.config(with: cardInfo[indexPath.row], isFirstCell: true)
        } else {
            cell.config(with: cardInfo[indexPath.row], isFirstCell: false)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let quizVc = TopicsViewController()
            navigationController?.pushViewController(quizVc, animated: true)
        case 1:
            let mock = MockInterview()
            navigationController?.pushViewController(mock, animated: true)
        default:
            print("Something wrong")
        }
    }
}

