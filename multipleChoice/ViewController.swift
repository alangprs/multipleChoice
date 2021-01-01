

import UIKit

class ViewController: UIViewController {
    //顯示問題
    @IBOutlet weak var questionLabel: UILabel!
    //顯示狀態
    @IBOutlet weak var LabelView: UILabel!
    //顯示第幾題的label
    @IBOutlet weak var answerView: UILabel!
    
    //問題ABC
    @IBOutlet weak var answerNumberA: UIButton!
    @IBOutlet weak var answerNumberB: UIButton!
    @IBOutlet weak var answerNumberC: UIButton!
    @IBOutlet weak var answerNumberD: UIButton!
    
  
    var questions = [Question]()//加入問題的array
    var index = 0 //存questions陣列的題目編號
    var option = [""]
    var answerViewNumber = 1 //存目前第幾題
    
    //問題選項亂數
    func randomAnswer(){
    option = [questions[index].答案,questions[index].選項1,questions[index].選項2,questions[index].選項3]
    option.shuffle()
    answerNumberA.setTitle(option[0], for: .normal)
    answerNumberB.setTitle(option[1], for: .normal)
    answerNumberC.setTitle(option[2], for: .normal)
    answerNumberD.setTitle(option[3], for: .normal)
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //創造題目
       let questions0 = Question(問題: "台灣最高山是哪座", 答案: "玉山", 選項1: "雪山", 選項2: "大霸尖山", 選項3: "南湖大山")
        questions.append(questions0)
       
        
        let questions1 = Question(問題: "台灣有風城之稱的城市是哪", 答案: "新竹", 選項1: "基隆", 選項2: "桃園", 選項3: "屏東")
         questions.append(questions1)
       
        let questions2 = Question(問題: "太魯閣國家公園佔地面積多少", 答案: "920坪方公里", 選項1: "900平方公里", 選項2: "850平方公里", 選項3: "800平方公里")
         questions.append(questions2)
      
        let questions3 = Question(問題: "跨台灣花蓮、南投、台中三個城市的國家公園是？", 答案: "太魯閣國家公園", 選項1: "陽明山國家公園", 選項2: "玉山國家公園", 選項3: "雪霸國家公園")
         questions.append(questions3)
       
        let questions4 = Question(問題: "台灣第一個24H營業的是什麼店？", 答案: "永和豆漿", 選項1: "7-11", 選項2: "全家便利商店", 選項3: "麥當勞")
         questions.append(questions4)
        
        let questions5 = Question(問題: "台灣唯一不靠海的城市是？", 答案: "南投", 選項1: "嘉義", 選項2: "彰化", 選項3: "雲林")
         questions.append(questions5)
       
        let questions6 = Question(問題: "台灣保育戰地的國家公園為哪座？", 答案: "金門國家公園", 選項1: "南方四島國家公園", 選項2: "雪霸國家公園", 選項3: "太魯閣國家公園")
        
         questions.append(questions6)
        let questions7 = Question(問題: "雪山隧道全長多少？", 答案: "12.9公里", 選項1: "10.9公里", 選項2: "9.9公里", 選項3: "8.9公里")
         questions.append(questions7)
        questions.shuffle() //隨機亂數排列題目
        questionLabel.text = questions[index].問題 //顯示問題
        answerView.text = "第\(answerViewNumber)題" //顯示目前第幾題
        randomAnswer()//答案顯示順序亂數func
        
        
    }
    //下一題按鈕
    @IBAction func nextQuesrion(_ sender: UIButton) {
        index = index + 1 //題目＋1
                answerViewNumber = answerViewNumber + 1 //目前答題數+1
                LabelView.text = "" //清空狀態文字
                if index == questions.count{
                    index = 0
                    questions.shuffle() //隨機亂數排列題目
                    questionLabel.text = questions[index].問題
                    randomAnswer()
                    answerView.text = "最後一題"
                    answerViewNumber = 0 //顯示目前題目歸零
                }else {
                    questionLabel.text = questions[index].問題
                    randomAnswer()
                    answerView.text = "第\(answerViewNumber)題"
                }
        
    }
    //答案選擇
    @IBAction func chooseAnswer(_ sender: UIButton) { //選擇答案button
        var rightAnswer = questions[index].答案
        let selectAnswer = sender.titleLabel?.text

        answerNumberA.setTitle(option[0], for: .normal)
        answerNumberB.setTitle(option[1], for: .normal)
        answerNumberC.setTitle(option[2], for: .normal)
        answerNumberD.setTitle(option[3], for: .normal)
        if selectAnswer == rightAnswer{
            
            LabelView.text = "🎇恭喜答對了🎇"
            
        }else{
            LabelView.text = "😞不對喔"
        }
       
        
    }
    //再來一次
    @IBAction func again(_ sender: Any) {
        questions.shuffle() //隨機亂數排列題目
        index = 0
        
        questionLabel.text = questions[index].問題
        randomAnswer()//答案顯示順序亂數func
        LabelView.text = ""
        answerViewNumber = 1 //目前題數變回1
        answerView.text = "第\(answerViewNumber)題" //顯示目前第幾題
        
    }
    
    
    

}

