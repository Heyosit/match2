//
//  RootViewController
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class RootViewController: UIViewController {
    static let shared = RootViewController()
    
    let startScreen = StartScreen()
    
    var skView: SKView {
        return view as! SKView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SKView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        skView.presentScene(startScreen)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
