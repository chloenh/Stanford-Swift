import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sports":"🎾🎱⛸🏂🏹🤼‍♀️🥊🏄🏼‍♀️🏊‍♀️",
        "Emoji": "👶🏻👧🧒🏿👩👲👵👷‍♀️👮‍♂️👩‍🍳",
        "Countries":"🇵🇫🇬🇭🇬🇪🇬🇹🇫🇴🇨🇼🇰🇲🇰🇾🇨🇾",
        ]
    
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
        if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
            if let cvc = segue.destination as? ConcentrationViewController {
                cvc.theme = theme
            }
            }
                }
        }
        }
