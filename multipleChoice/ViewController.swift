

import UIKit

class ViewController: UIViewController {
    //顯示問題
    @IBOutlet weak var questionLabel: UILabel!
    
    //問題ABC
    @IBOutlet weak var answerNumberA: UIButton!
    @IBOutlet weak var answerNumberB: UIButton!
    @IBOutlet weak var answerNumberC: UIButton!
  
    var questions = [Question]()//加入問題的array
    var index = 0 //存questions陣列的題目編號
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //創造題目
        let questions0 = Question(問題: "台灣最高山是哪座？", 答案: "玉山")
        questions.append(questions0)
        let questions1 = Question(問題: "台灣有風城之稱的城市是哪？", 答案: "新竹")
        questions.append(questions1)
        let questions2 = Question(問題: "雪山隧道全長多少？", 答案: "12.9公里")
        questions.append(questions2)
        let questions3 = Question(問題: "太魯閣國家公園佔地面積多少？", 答案: "920坪方公里")
        questions.append(questions3)
        let questions4 = Question(問題: "橫跨台灣花蓮、南投、台中三個城市的國家公園是？", 答案: "太魯閣國家公園")
        questions.append(questions4)
        let questions5 = Question(問題: "台灣第一個24H營業的是什麼店？", 答案: "永和豆漿")
        questions.append(questions5)
        let questions6 = Question(問題: "台灣唯一不靠海的城市是？", 答案: "南投")
        questions.append(questions6)
        let questions7 = Question(問題: "台灣保育戰地的國家公園為哪座？", 答案: "金門")
        questions.append(questions7)
        questions.shuffle() //隨機亂數排列題目
        questionLabel.text = questions[index].問題
        
        answerNumberA.setTitle(questions[index].答案, for: .normal)
        
    }

    @IBAction func nextQuesrion(_ sender: Any) {
        index = index + 1
        if index == questions.count{
            index = 0
            questions.shuffle() //隨機亂數排列題目
        }
        questionLabel.text = questions[index].問題 //顯示問題要放if外面，不然題目跑不出來
    }
    
    @IBAction func chooseAnswer(_ sender: Any) { //選擇答案button
        var numberA = answerNumberA
        var numberB = answerNumberB
        var numberC = answerNumberC
        // 存相對應的題目答案
        
    }
    
    
    
    

}

