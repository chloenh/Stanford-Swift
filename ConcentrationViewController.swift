import UIKit

class ConcentrationViewController: UIViewController {

    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
            return (CardButtons.count+1) / 2
        }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
        }
    }
    private func updateFlipCountLabel() {
    let attributes: [NSAttributedString.Key:Any] = [
        .strokeWidth : 5.0,
        .strokeColor : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    ]
    let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
    flipCountLabel.attributedText = attributedString
            
           // flipCountLabel.text = "Flips: \(flipCount)"
    //}
   }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var CardButtons: [UIButton]!
    
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let CardNumber = CardButtons.index(of: sender) {
            game.chooseCard(at: CardNumber)
            updateViewFromModel()
            } else {
        print("chosen card was not in CardButtons")
    }
        }
    
    
private func updateViewFromModel() {
    if CardButtons !=  nil {
    for index in CardButtons.indices {
        let button = CardButtons[index]
        let card = game.cards[index]
        if card.isFaceUp {
            button.setTitle(emoji(for: card), for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9990349388, green: 0.9865710582, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.4761282699, blue: 0.6492892926, alpha: 1)
        }
    }
}
    }
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    // private var emojiChoices = ["🔪","🔫","⚔️","🔮","🚀","💴","🚬","⚰️"]
    private var emojiChoices = "🔪🔫⚔️🔮🚀💴🚬⚰️"
    
    private var emoji = [Card:String]()

    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
        emoji[card] = String(emojiChoices.remove(at: randomStringIndex))

        
        }
        
        return emoji[card] ?? "?"
    
}
}
extension Int {
    var arc4random: Int{
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
    }
}
}
