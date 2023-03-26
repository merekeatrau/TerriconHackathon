import UIKit
import SnapKit

class NotificationTableViewCell: UITableViewCell {

    static let identifier = "NotificationTableCell"

    let notificationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        return imageView
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .top
        stackView.distribution = .fill
        return stackView
    }()

    func configure(icon: UIImage?, detailText: String) {
        notificationIcon.image = icon
        detailLabel.text = detailText
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        stackView.addArrangedSubview(notificationIcon)
        stackView.addArrangedSubview(detailLabel)
        contentView.addSubview(stackView)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.topMargin).offset(16)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }

        notificationIcon.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.leading.equalToSuperview()
            make.top.equalTo(stackView.snp.top)
        }
    }
}

