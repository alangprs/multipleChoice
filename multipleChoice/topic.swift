//
//  topic.swift
//  multipleChoice
//
//  Created by 翁燮羽 on 2021/1/2.
//

import Foundation
struct Topic:Codable {
    let question:String //題目
    let rightAnswer:String //答案
    let answer1:String //選擇1
    let answer2:String //選擇2
    let answer3:String //選擇3
}
