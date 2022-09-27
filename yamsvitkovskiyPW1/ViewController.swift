//
//  ViewController.swift
//  yamsvitkovskiyPW1
//
//  Created by byst_er on 17.09.2022.
//

import UIKit
/* Trying use global variable to change names not randomly from set, but it didn't work out
import OrderedCollections

struct B {
    var ButtonTitles: OrderedSet = ["Don't press me!", "Don't do that", "one more time?", "Again?!?", "Why?", "I'm angry", "And again?", "Okey, PRESS", "PRESS", "DO IT"]
} */


class ViewController: UIViewController {

    @IBOutlet var views: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func MagicButton(_ sender: Any) {
        
        
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
            UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1
            )
            )
        }
        
        let button = sender as? UIButton
        button?.isEnabled = false
        
        UIView.animate(withDuration: 1, animations: {
            for view in self.views {
                view.layer.cornerRadius = 10
                view.backgroundColor = set.popFirst()
            }
        }) { completion in
            button?.isEnabled = true
        }
        
        
        button?.tag = 5
        button?.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
    }
   
    @objc func buttonPressed(sender:UIButton) { // Changes button title from "(set)ButtonTitles". It chooses title randomly, becouse Set is unordered.
        if(sender.tag == 5) {
            var ButtonTitles: Set = ["Don't press me!", "Don't do that", "one more time?", "Again?!?", "Why?", "I'm angry", "And again?", "Okey, PRESS", "PRESS", "DO IT", "DO NOT PRESS ME"]
            sender.setTitle(ButtonTitles.removeFirst(), for: .normal)
        }
    }
    
}

