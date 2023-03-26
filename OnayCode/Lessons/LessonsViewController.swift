import UIKit
import SnapKit

class LessonsViewController: UIViewController {

    let lessons = ["Introduction to Swift", "UIKit Basics", "View Controllers and Navigation"]
    let icons = ["swift", "rectangle.3.offgrid", "list.bullet.indent"]
    var currentLessonIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Lessons"
        self.view.backgroundColor = .white

        let switchControl = UISegmentedControl()
        for (index, lesson) in lessons.enumerated() {
            let icon = UIImage(systemName: icons[index])
            switchControl.insertSegment(with: icon, at: index, animated: false)
        }
        switchControl.selectedSegmentIndex = currentLessonIndex
        switchControl.addTarget(self, action: #selector(switchLesson(_:)), for: .valueChanged)
        self.navigationItem.titleView = switchControl

        let lessonViewController = LessonViewController()
        lessonViewController.lessonContent = """
            In this lesson, we'll introduce you to the Swift programming language. Swift is a powerful and modern language designed for building iOS, macOS, watchOS, and tvOS apps. We'll cover the basics of Swift syntax, including:

            - Variables and constants
            - Data types (e.g., Int, String, Bool)
            - Operators (e.g., +, -, *, /, %)
            - Control flow statements (e.g., if/else, for loops)
            - Functions

            To learn more about Swift, check out the following resources:

            - The Swift Programming Language book: https://docs.swift.org/swift-book/
            - Swift Playgrounds app: https://www.apple.com/swift/playgrounds/
            """
        self.addChild(lessonViewController)
        self.view.addSubview(lessonViewController.view)
        lessonViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin)
        }
        lessonViewController.didMove(toParent: self)
    }

    @objc func switchLesson(_ sender: UISegmentedControl) {
        let lessonViewController = self.children.first as! LessonViewController
        lessonViewController.willMove(toParent: nil)
        lessonViewController.view.removeFromSuperview()
        lessonViewController.removeFromParent()

        let newLessonIndex = sender.selectedSegmentIndex
        let newLessonViewController = LessonViewController()
        if newLessonIndex == 0 {
            newLessonViewController.lessonContent = """
                In this lesson, we'll introduce you to the Swift programming language. Swift is a powerful and modern language designed for building iOS, macOS, watchOS, and tvOS apps. We'll cover the basics of Swift syntax, including:

                - Variables and constants
                - Data types (e.g., Int, String, Bool)
                - Operators (e.g., +, -, *, /, %)
                - Control flow statements (e.g., if/else, for loops)
                - Functions

                To learn more about Swift, check out the following resources:

                - The Swift Programming Language book: https://docs.swift.org/swift-book/
                - Swift Playgrounds app: https://www.apple.com/swift/playgrounds/
                """
        } else if newLessonIndex == 1 {
            newLessonViewController.lessonContent = """
            In this lesson, we'll cover the basics of UIKit, which is the framework used for building iOS user interfaces. We'll cover some of the most commonly used UIKit components, including:
            - UILabel for displaying text
            - UIButton for creating clickable buttons
            - UIImageView for displaying images
            - UITextField for capturing user input
            - UITableView for displaying lists of data

            To learn more about UIKit, check out the following resources:

            - UIKit Framework Reference: https://developer.apple.com/documentation/uikit/
            - iOS Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/ios/overview/themes/
            """
        } else {
            newLessonViewController.lessonContent = """
        In this lesson, we'll cover view controllers and navigation, which are key components of iOS app development. We'll cover:

        - Creating and using view controllers
        - Navigation controllers for managing multiple screens in an app
        - Segues for transitioning between screens
        - Passing data between view controllers

        To learn more about view controllers and navigation, check out the following resources:

        - View Controller Programming Guide for iOS: https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/
        - Navigation Controller Programming Guide for iOS: https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html
        """
        }
        newLessonViewController.view.alpha = 0
        newLessonViewController.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.addChild(newLessonViewController)
        self.view.addSubview(newLessonViewController.view)
        newLessonViewController.view.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin)
        }
        newLessonViewController.didMove(toParent: self)

        UIView.animate(withDuration: 0.3) {
            newLessonViewController.view.alpha = 1
            newLessonViewController.view.transform = CGAffineTransform.identity
        }
        currentLessonIndex = newLessonIndex
    }
}


