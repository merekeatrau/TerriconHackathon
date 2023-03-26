//
//  NamingViewController.swift
//  OnayCode
//
//  Created by Arnur Sakenov on 05.03.2023.
//

import UIKit
import SnapKit

class MockInterview: UIViewController {

    private var currentChatId: String?
    private var currentQuestion: String?
    private var chatID: String?
    private var finalGrade: String?

    var selectedIndexPath: IndexPath?

    private let checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        return button
    }()

    private let taskText: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.cornerRadius = 12
        textView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
        textView.textContainerInset = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        textView.clipsToBounds = true
        return textView
    }()

    private let inputContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        return containerView
    }()

    private let inputTextField: UITextView = {
        let textView = UITextView()
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 0)
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 0)
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Interview"
        loadQuestion()
        setConstraints()
    }

    private func setConstraints() {
        let topStackView = UIStackView(arrangedSubviews: [taskText])
        topStackView.axis = .vertical
        topStackView.spacing = 16
        topStackView.alignment = .fill
        topStackView.distribution = .fill

        let inputStackView = UIStackView(arrangedSubviews: [inputTextField, checkButton])
        inputStackView.axis = .horizontal
        inputStackView.spacing = 8
        inputStackView.alignment = .center

        inputStackView.distribution = .fill
        inputContainerView.addSubview(inputStackView)

        view.addSubview(topStackView)
        view.addSubview(inputContainerView)

        inputTextField.snp.makeConstraints {
            $0.height.equalTo(48)
        }

        topStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        inputContainerView.snp.makeConstraints { make in
            make.top.equalTo(topStackView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        inputStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(24)
        }

        checkButton.snp.makeConstraints { make in
            make.width.equalTo(36)
            make.height.equalTo(36)
        }
    }
}


extension MockInterview {

    @objc private func checkButtonTapped() {
        guard let chatID = currentChatId, let userAnswer = inputTextField.text, !userAnswer.isEmpty else {
            print("No chat ID or user answer")
            return
        }

        if currentQuestion == "Hello! Are you ready to start the interview?" {
            loadQuestion()
            inputTextField.text = ""
            return
        }

        inputTextField.text = ""

        createMessage(chatID: chatID, message: userAnswer) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let messageResponse):
                    print("Message sent:", messageResponse)
                    if messageResponse.message_author == "assistant" {
                        let responseText = messageResponse.text

                        if responseText.starts(with: "Grade:") {
                            self?.finalGrade = responseText
                        } else if responseText.starts(with: "Comment:") {
                            let alert = UIAlertController(title: "Interview Results", message: "Grade: \(self?.finalGrade ?? "")\n\(responseText)", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alert.addAction(okAction)
                            self?.present(alert, animated: true, completion: nil)
                        } else {
                            self?.taskText.text = responseText
                        }
                    }
                case .failure(let error):
                    print("Error sending message:", error)
                }
            }
        }
    }

    private func loadQuestion() {
        let chatRequest = CreateChatRequest(target_grade: "middle", technologies: ["Swift", "UIKit"], stack: "iOS")
        createChat(request: chatRequest) { [weak self] result in
            switch result {
            case .success(let chatResponse):

                self?.currentChatId = chatResponse.chat_id

                if let firstMessage = chatResponse.messages.first(where: { $0.message_author == "assistant" }) {
                    self?.currentQuestion = firstMessage.text
                    DispatchQueue.main.async {
                        self?.taskText.text = firstMessage.text
                    }
                }
            case .failure(let error):
                print("Error creating chat:", error.localizedDescription)
            }
        }

    }

    func requestQuestion() {
        guard let chatID = currentChatId else {
            print("No chat ID")
            return
        }

        createMessage(chatID: chatID, message: "next") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let messageResponse):
                    print("Message sent:", messageResponse)
                    if messageResponse.message_author == "assistant" {
                        self?.taskText.text = messageResponse.text
                    }
                case .failure(let error):
                    print("Error sending message:", error)
                }
            }
        }
    }
}
