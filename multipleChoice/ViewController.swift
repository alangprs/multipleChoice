
import UIKit
import CodableCSV
extension Topic {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "題目.tex")?.data {
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print(error)
            }
        }
        return array
    }
}

class ViewController: UIViewController {
    //顯示問題
    @IBOutlet weak var questionLabel: UILabel!
    //顯示狀態
    @IBOutlet weak var LabelView: UILabel!
    //顯示第幾題的label
    @IBOutlet weak var answerView: UILabel!
    @IBOutlet weak var fraction: UILabel!//顯示分數
    
    
    //問題ABC
    @IBOutlet weak var answerNumberA: UIButton!
    @IBOutlet weak var answerNumberB: UIButton!
    @IBOutlet weak var answerNumberC: UIButton!
    @IBOutlet weak var answerNumberD: UIButton!
    
  
    
    var index = 0 //存questionsarray的題目編號
    var option = [""] //存答案array 用來製造亂數
    var answerViewNumber = 1 //存目前第幾題
    var fractions = 0 //存分數
    
    //讀題庫裡的array
    var topics = Topic.data //題目就在topics裡面了
     
    //題目顯示 答案顯示、亂數func
    func topicFunc(){
        //顯示題目
        questionLabel.text = topics[index].question
       
        
        //將答案存入option Array 製作答案順序亂數排列
        option = [topics[index].rightAnswer,topics[index].answer1,topics[index].answer2,topics[index].answer3]
        //顯示答案亂數
        option.shuffle()
        //顯示答案選項
        answerNumberA.setTitle(option[0], for: .normal)
        answerNumberA.titleLabel?.numberOfLines = 0 //讓button字允許超過一行
        
        answerNumberB.setTitle(option[1], for: .normal)
        answerNumberB.titleLabel?.numberOfLines = 0
        
        answerNumberC.setTitle(option[2], for: .normal)
        answerNumberC.titleLabel?.numberOfLines = 0
        
        answerNumberD.setTitle(option[3], for: .normal)
        answerNumberD.titleLabel?.numberOfLines = 0
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topics.shuffle()//題目亂數
        topicFunc() //題目顯示 答案顯示、亂數func
        fraction.text = "分數:\(fractions)" //顯示分數

    }
    //下一題按鈕
    @IBAction func nextQuesrion(_ sender: UIButton) {
        
        if index == 9{ //如果已經從題目array拿出第10題
            
            if fractions == 100{
                LabelView.text = "哇！\(fractions)分\n有考慮當教授嗎？"
            }else if fractions > 80{
                LabelView.text = "哇！\(fractions)分\n對台灣很熟喔？"
            }else if fractions > 60{
                LabelView.text = "哈！有\(fractions)分\n還好免強及格"
            }else{
                LabelView.text = "痾！才\(fractions)分\n你是台灣人嗎"
            }
            LabelView.text = "最後一題了"
            
        }else{
            index = index + 1 //題目array跳下一題編號
            answerViewNumber = answerViewNumber + 1 //答題數增加1
            answerView.text = "第\(answerViewNumber)題" //更新答題數
            topicFunc() //題目顯示、亂數 答案顯示、亂數func
            LabelView.text = ""
        }
        
    }
    //答案選擇
    @IBAction func chooseAnswer(_ sender: UIButton) { //選擇答案button
        if sender.titleLabel?.text == topics[index].rightAnswer{
            LabelView.text = "🎇恭喜答對🎇"
            fractions = fractions + 10
            fraction.text = "分數\(fractions)" //分數+10
            
            
        }else{
            LabelView.text = "🙈不對喔🙈"
           
        }
        
        
    }
    //再來一次
    @IBAction func again(_ sender: Any) {
        index = 0
        LabelView.text = ""
        answerViewNumber = 1 //目前題數變回1
        answerView.text = "第\(answerViewNumber)題" //顯示目前第幾題
        topics.shuffle()//題目亂數
        topicFunc() //題目顯示 答案顯示、亂數func
        fractions = 0 //分數歸零
    }
    
    
    

}

