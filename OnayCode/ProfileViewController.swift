//
//  ProfileViewController.swift
//  OnayCode
//
//  Created by Mereke on 25.03.2023.
//
import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    let profilePictureImageView = UIImageView()
    let userNameLabel = UILabel()
    let gradingLabel = UILabel()
    let userBioLabel = UILabel()
    let userInfoView = UIView()
    let bgView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"


        userInfoView.backgroundColor = .systemGray6
        userInfoView.layer.cornerRadius = 12
        bgView.backgroundColor = .systemGray6
        bgView.layer.cornerRadius = 12

        view.addSubview(userInfoView)
        view.addSubview(bgView)

        profilePictureImageView.image = UIImage(named: "profile")
        profilePictureImageView.contentMode = .scaleAspectFill
        profilePictureImageView.clipsToBounds = true
        profilePictureImageView.layer.cornerRadius = 16

        userNameLabel.text = user[0].name
        userNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)

        gradingLabel.text = user[0].grade
        gradingLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        gradingLabel.textColor = .secondaryLabel

        userBioLabel.text = user[0].experience
        //"An experienced iOS developer with 5+ years of experience in Swift and Objective-C. He has developed a variety of user-friendly apps, from small utilities to large-scale enterprise solutions. In his free time, he enjoys playing guitar and traveling to explore new cultures."
        userBioLabel.numberOfLines = 0
        userBioLabel.textColor = .secondaryLabel

        let nameStackView = UIStackView(arrangedSubviews: [userNameLabel, gradingLabel])
        nameStackView.axis = .vertical
        nameStackView.alignment = .leading
        nameStackView.spacing = 4

        let profileStackView = UIStackView(arrangedSubviews: [profilePictureImageView, nameStackView])
        profileStackView.axis = .horizontal
        profileStackView.alignment = .center
        profileStackView.spacing = 12

        let iconView = UIImageView(image: UIImage(systemName: "clock"))
        let titleLabel = UILabel()
        titleLabel.text = "Learned today"
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .black

        let timeLabel = UILabel()
        timeLabel.text = "5 mins spent"
        timeLabel.font = UIFont.systemFont(ofSize: 12)
        timeLabel.textColor = .gray

        let labelStackView = UIStackView(arrangedSubviews: [titleLabel, timeLabel])
        labelStackView.axis = .horizontal
        labelStackView.spacing = 4

        let stackView = UIStackView(arrangedSubviews: [iconView, labelStackView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center

        userInfoView.addSubview(profileStackView)
        userInfoView.addSubview(userBioLabel)
        bgView.addSubview(stackView)

        iconView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }

        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }

        profileStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }

        userBioLabel.snp.makeConstraints { make in
            make.top.equalTo(profileStackView.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }

        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.right.equalToSuperview().inset(16)
        }

        bgView.snp.makeConstraints { make in
            make.top.equalTo(userInfoView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }
    }

}


