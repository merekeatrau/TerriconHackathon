//
//  RegistrationViewController.swift
//  OnayCode
//
//  Created by Artyom Prima on 25.03.2023.
//

import UIKit
class RegistrationViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign Up"
        view.backgroundColor = .white
        setConstraints()

        [userNameField, emailField, passwordField].forEach { field in
            field.delegate = self
        }

        gradePickerView.dataSource = self
        gradePickerView.delegate = self

    }

   private let gradePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    
    private let signGoogleButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Continue with Google", for: .normal)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 12
        button.layer.borderColor = #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    private let signEmailButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Continue with Email", for: .normal)
        button.setImage(UIImage(named: "mail"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.234192282, green: 0.3481882215, blue: 0.5982336402, alpha: 1)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    private let userNameField: UITextField = {
        let login = UITextField()
        login.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        login.leftViewMode = .always
        login.attributedPlaceholder = NSAttributedString (
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
                login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.layer.cornerRadius = 12
        login.clipsToBounds = true

        return login
        
    }()

    private let ageUserField: UITextField = {
        let login = UITextField()
        login.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        login.leftViewMode = .always
        login.attributedPlaceholder = NSAttributedString (
            string: "Age",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
                login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.keyboardType = .emailAddress
        login.font = UIFont.systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.returnKeyType = .done
        login.layer.cornerRadius = 12
        login.clipsToBounds = true

        return login
        
    }()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard when the user taps the "Done" button
        textField.resignFirstResponder()
        return true
    }
    
    private let emailField: UITextField = {
        let email = UITextField()
        email.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        email.leftViewMode = .always
        email.attributedPlaceholder = NSAttributedString (
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
                email.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: email.frame.height))
        email.keyboardType = .emailAddress
        email.font = UIFont.systemFont(ofSize: 16)
        email.layer.cornerRadius = 12
        email.autocapitalizationType = .none
        email.returnKeyType = .done
        return email
        
    }()
    
    private let passwordField: UITextField = {
        let password = UITextField()
        
        password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        password.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.keyboardType = .default
        password.font = UIFont.systemFont(ofSize: 16)
//        password.autocapitalizationType = .none
        password.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        password.returnKeyType = .done
        password.layer.cornerRadius = 12
        password.clipsToBounds = true
       
        let showHideButton = UIButton(type: .custom)
        
        showHideButton.setImage(UIImage(systemName: "eye"), for: .normal)
        showHideButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        showHideButton.tintColor = .black
        showHideButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        password.rightViewMode = .always
        password.rightView = showHideButton
        
        return password
    }()
    
    private let gradeField: UITextField = {
        let textField = UITextField()
        
        textField.attributedPlaceholder = NSAttributedString (
            string: "Choose your grade",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.keyboardType = .default
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        textField.returnKeyType = .done
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        
        return textField
        
    }()
    
    private let experienceField: UITextField = {
        let textField = UITextField()
        
        textField.attributedPlaceholder = NSAttributedString (
            string: "Tell us about your work experience",
            attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)])
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.keyboardType = .default
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.backgroundColor = #colorLiteral(red: 0.9559774995, green: 0.9609488845, blue: 0.9608611465, alpha: 1)
        textField.returnKeyType = .done
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        
        return textField
        
    }()
    
    private let networkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let userInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        return toolbar
    }()
    
    private let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4780646563, blue: 0.9985368848, alpha: 1)
        button.addTarget(nil, action: #selector(signUp), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        return button
    }()
    
    @objc func signUp (){
        
        if let name = userNameField.text, !name.isEmpty,
           let email = emailField.text, !email.isEmpty,
           let password = passwordField.text, !password.isEmpty,
           let grade = gradeField.text, !grade.isEmpty,
           let age = ageUserField.text, !age.isEmpty,
           let experience = experienceField.text, !experience.isEmpty {
            let course = ViewController()
            navigationController?.pushViewController(course, animated: true)
            user.append(Users(name: name, age: Int(age)!, password: password, grade: grade, experience: experience))
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill all the fields ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }

    @objc private func didTapDone() {
        gradeField.resignFirstResponder()
    }
    
    @objc private func showHidePassword(_ sender: UIButton) {
        if passwordField.isSecureTextEntry {
            passwordField.isSecureTextEntry = false // Disable secure text entry
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            passwordField.isSecureTextEntry = true // Enable secure text entry
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.systemBlue, for: .normal)
//        button.addTarget(nil, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0.58187747, green: 0.6370299459, blue: 0.7215286493, alpha: 1)
        label.text = "Already have an account?"
        return label
    }()
    
    private let haveAccountStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 4
        stack.clipsToBounds = true
        return stack
    }()
    
    func setConstraints() {
        view.addSubview(networkStackView)
        view.addSubview(userInformationStackView)
        view.addSubview(haveAccountStackView)
        view.addSubview(signUpButton)
        
        networkStackView.addArrangedSubview(signEmailButton)
        networkStackView.addArrangedSubview(signGoogleButton)
        
        userInformationStackView.addArrangedSubview(userNameField)
        userInformationStackView.addArrangedSubview(ageUserField)
        userInformationStackView.addArrangedSubview(emailField)
        userInformationStackView.addArrangedSubview(passwordField)
        userInformationStackView.addArrangedSubview(gradeField)
        userInformationStackView.addArrangedSubview(experienceField)
        
        haveAccountStackView.addArrangedSubview(haveAccountLabel)
        haveAccountStackView.addArrangedSubview(logInButton)
        
        gradeField.inputView = gradePickerView
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), doneButton], animated: true)
        doneButton.tintColor = #colorLiteral(red: 0.234192282, green: 0.3481882215, blue: 0.5982336402, alpha: 1)
        gradeField.inputAccessoryView = toolbar
        
        [signGoogleButton, signEmailButton, userNameField, ageUserField, emailField, passwordField, gradeField, signUpButton, experienceField].forEach { button in
            
            button.snp.makeConstraints { make in
                make.height.equalTo(46)
            }
        }
        
        networkStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.width.equalTo(view.frame.size.width - 60)
            make.leading.equalTo(view).offset(30)
        }
        
        userInformationStackView.snp.makeConstraints { make in
            make.top.equalTo(networkStackView.snp_bottomMargin).offset(78)
            make.width.equalTo(view.frame.size.width - 60)
            make.leading.equalTo(view).offset(30)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(userInformationStackView.snp_bottomMargin).offset(80)
            make.width.equalTo(view.frame.size.width - 60)
            make.leading.equalTo(view).offset(30)
        }
        
        haveAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp_bottomMargin).offset(24)
            make.leading.equalTo(view).offset(70)
        }
    }
}

extension RegistrationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
   
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // we want 3 sections
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        44
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return "0 to Trainee"
        case 1:
            return "Trainee to Junior"
        case 2:
            return "Junior to Middle"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        let selectedValue = pickerView.selectedRow(inComponent: component)
        
        switch selectedValue {
        case 0:
            gradeField.text = "0 to Trainee"
        case 1:
            gradeField.text = "Trainee to Junior"
        case 2:
            gradeField.text = "Junior to Middle"
        default:
            return print("error")
        }
    }
}
