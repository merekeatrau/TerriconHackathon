//
//  Checkbox.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 24.03.2023.
//

import UIKit
class CheckBox: UIControl {
    private let imageView = UIImageView()

    var isChecked: Bool = false {
        didSet {
            updateImage()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        updateImage()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleChecked))
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func toggleChecked() {
        isChecked = !isChecked
        sendActions(for: .valueChanged)
    }

    private func updateImage() {
        imageView.image = isChecked ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
    }
}
