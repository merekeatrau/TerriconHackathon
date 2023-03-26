//
//  CardEntity.swift
//  OnayCode
//
//  Created by Mereke on 05.03.2023.
//

import Foundation
import UIKit

struct Card {
    var progress: String
    var header: String
    var subheader: String
    var bgImage: UIImage?
}

let cardInfo = [
    Card(progress: "51", header: "Roadmap", subheader: "Learning materials", bgImage: UIImage(named: "level1")),
    Card(progress: "0", header: "Technical Skills", subheader: "Assessing Mastery of Technical Concepts", bgImage: UIImage(named: "level2")),
    Card(progress: "0", header: "Soft Skills", subheader: "Evaluating Emotional Competence", bgImage: UIImage(named: "level3")),
    Card(progress: "0", header: "Creativity", subheader: "Measuring Creative Performance", bgImage: UIImage(named: "level4")),
    Card(progress: "0", header: "Analytical thinking", subheader: "Assessing Problem-Solving Abilities", bgImage: UIImage(named: "level5"))
]
