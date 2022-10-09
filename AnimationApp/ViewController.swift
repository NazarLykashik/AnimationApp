//
//  ViewController.swift
//  AnimationApp
//
//  Created by Nazar Lykashik on 9.08.22.
//

import Spring

class ViewController: UIViewController {
    @IBOutlet var coreAnimationView: UIView!

    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springButton: SpringButton!
    
    
    private var originCoordinate: CGFloat?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        springAnimationView.animate()
        springButton.animate()
        originCoordinate = coreAnimationView.frame.origin.x
    }

    @IBAction func startCoreAnimation(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat,], animations: {
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 40
            } else {
                self.coreAnimationView.frame.origin.x += 40
            }
        })

    }
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        springAnimationView.animation = "fadeIn"
        springAnimationView.curve = "linear"
                springAnimationView.force = 2
                springAnimationView.duration = 1
                springAnimationView.delay = 0.3
                springAnimationView.animate()
        
        springButton.animation = "morph"
        springButton.curve = "easeOut"
        springButton.force = 0.5
        springButton.animate()
    }
    
    
}

