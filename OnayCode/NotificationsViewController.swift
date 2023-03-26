//
//  NotificationsViewController.swift
//  OnayCode
//
//  Created by Mereke on 26.03.2023.
//

import UIKit
import SnapKit

class NotificationsViewController: UIViewController {

    private let notifications: [String] = [
        "You've got a review: 13 days ago\n\nYour solution was graded 3 out of 3 according to the assignment's criteria.\n\n15.3 Debugging",
        "You've got a review: 23 days ago\n\nYour solution was graded 7 out of 7 according to the assignment's criteria.\n\n13.3 Data persistency",
        "You've got a review: 23 days ago\n\nYour solution was graded 2 out of 2 according to the assignment's criteria.\n\n14.3 Паттерны проектирования. Поведенческие паттерны",
        "You've got a review: 23 days ago\n\nYour solution was graded 2 out of 2 according to the assignment's criteria.\n\n14.3 Паттерны проектирования. Поведенческие паттерны",
        "You've got a review: 23 days ago\n\nYour solution was graded 7 out of 7 according to the assignment's criteria.\n\n13.3 Data persistency",
        "You've got a review: 23 days ago\n\nYour solution was graded 2 out of 2 according to the assignment's criteria.\n\n14.3 Паттерны проектирования. Поведенческие паттерны"
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: NotificationTableViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Notifications"

        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        tableView.separatorStyle = .singleLine
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifier, for: indexPath) as? NotificationTableViewCell else {
            return UITableViewCell()
        }

        let notification = notifications[indexPath.row]

        if notification.contains("Debugging") {
            cell.configure(icon: UIImage(systemName: "exclamationmark.triangle.fill"), detailText: notification)
            cell.notificationIcon.tintColor = .systemOrange
        } else if notification.contains("Data persistency") {
            cell.configure(icon: UIImage(systemName: "doc.on.doc"), detailText: notification)
            cell.notificationIcon.tintColor = .systemGreen
        } else if notification.contains("Паттерны проектирования") {
            cell.configure(icon: UIImage(systemName: "paintbrush"), detailText: notification)
            cell.notificationIcon.tintColor = .systemPurple
        } else {
            cell.configure(icon: UIImage(systemName: "doc.text"), detailText: notification)
            cell.notificationIcon.tintColor = .systemBlue
        }

        return cell
    }



    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
