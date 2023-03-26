import UIKit

class TopicsViewController: UIViewController {
    let topicsTableView = UITableView()
    
    let topics = [
        "Swift Basics",
        "Object-Oriented Programming in Swift",
        "UIKit and Interface Builder",
        "Autolayout and Constraints",
        "Working with Networking and URLSession",
        "Core Data",
        "Working with Files",
        "Testing Fundamentals",
        "Git Basics"
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Roadmap"
        topicsTableView.delegate = self
        topicsTableView.dataSource = self
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(topicsTableView)
        topicsTableView.translatesAutoresizingMaskIntoConstraints = false
        topicsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topicsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topicsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topicsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        topicsTableView.dataSource = self
        topicsTableView.delegate = self
        topicsTableView.register(TopicCell.self, forCellReuseIdentifier: "TopicCell")
    }
}

extension TopicsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
           cell.topicLabel.text = topics[indexPath.row]
           cell.delegate = self
           return cell
       }
}
extension TopicsViewController: TopicCellDelegate {
    func didTapCheckBox(_ cell: TopicCell) {
        guard let indexPath = topicsTableView.indexPath(for: cell) else { return }
        print("Tapped CheckBox at index: \(indexPath.row)")
        cell.checkBox.isChecked.toggle()
    }

    func didSelectCell(_ cell: TopicCell) {
        guard let indexPath = topicsTableView.indexPath(for: cell) else { return }
        print("Selected cell at index: \(indexPath.row)")
        // Откройте новый контроллер здесь
        navigationController?.pushViewController(LessonsViewController(), animated: true)
    }
}


