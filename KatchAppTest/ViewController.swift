//
//  ViewController.swift
//  KatchAppTest
//
//  Created by Christian Gonzalo on 10/16/19.
//  Copyright © 2019 Christian Gonzalo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage



class ViewController: UIViewController {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var reset: UIButton!
    
    var digimonArray : [Digimon] = []
    var currentDigimon : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        pictureImageView.layer.cornerRadius = 8.0
        pictureImageView.clipsToBounds = true
        if !digimonArray.isEmpty{
             if let url = URL(string: digimonArray[currentDigimon].sprite){
                 pictureImageView.af_setImage(withURL: url)
             }
         }
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        if xFromCenter > 0 {
            
        } else{
            
        }
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            
            if card.center.x < 85 {
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y + 150)
                })
                return
            } else if card.center.x > (view.frame.width - 85){
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 150 )
                })
                return
            }
            resetCard()

        }

    }
    
    @IBAction func reset(_ sender: UIButton) {
        resetCard()
    }
    
    func resetCard(){
        UIView.animate(withDuration: 0.2, animations: {
            self.card.center = self.view.center
        })
    }
    
/*    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            
        if (sender.direction == .left ) {
           currentDigimon = currentDigimon + 1
           if currentDigimon <= 99 {
               let url = URL(string: digimonArray[currentDigimon].sprite)!
               pictureImageView.af_setImage(withURL: url)
           }
           else if(currentDigimon > 99){
               currentDigimon = 99
           }
           print("Swipe Right")
        }
            
        if (sender.direction == .right) {
            currentDigimon = currentDigimon - 1
                        if currentDigimon >= 0 {
                            let url = URL(string: digimonArray[currentDigimon].sprite)!
                            pictureImageView.af_setImage(withURL: url)
                        }
                        else if(currentDigimon < 0){
                            currentDigimon = 0
                        }
                        print("Swipe Left")

        }
        
 
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        getDigimon()
 
    }
    
    func getDigimon (){
        Alamofire.AF.request(DigimonApi.digimonsUrl).validate()
        .responseJSON(completionHandler: { response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                self.digimonArray = Digimon.buildAll(from: json)
                self.viewDidAppear(false)
            case .failure(let error):
                print("Response Error: \(error.localizedDescription)")
            
            }
        })
    }

}

