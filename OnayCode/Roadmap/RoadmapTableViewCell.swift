import UIKit
protocol TopicCellDelegate: AnyObject {
    func didTapCheckBox(_ cell: TopicCell)
    func didSelectCell(_ cell: TopicCell)
}

class TopicCell: UITableViewCell {
    let topicLabel = UILabel()
    let checkBox = CheckBox()

    weak var delegate: TopicCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        addSubview(topicLabel)
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        topicLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        topicLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        checkBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)

        if checkBox.frame.contains(touchLocation) {
            delegate?.didTapCheckBox(self)
        } else {
            delegate?.didSelectCell(self)
        }
    }
}
