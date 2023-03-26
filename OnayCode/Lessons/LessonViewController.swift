import UIKit
import SnapKit

class LessonViewController: UIViewController {

    var lessonContent: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.text = lessonContent
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
