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
    @IBOutlet weak var pictureImageView1: UIImageView!
    @IBOutlet weak var card1: UIView!
    @IBOutlet weak var pictureImageView2: UIImageView!
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var pictureImageView3: UIImageView!
    @IBOutlet weak var card3: UIView!
    @IBOutlet weak var pictureImageView4: UIImageView!
    @IBOutlet weak var card4: UIView!
    
    var digimonArray : [Digimon] = []
    var currentDigimon : Int = 0

    override func viewDidLoad() {
        self.view.bringSubviewToFront(card1)
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        pictureImageView1.layer.cornerRadius = 8.0
        pictureImageView1.clipsToBounds = true
        if !digimonArray.isEmpty{
            let url1 = URL(string: digimonArray[currentDigimon].sprite)
            let url2 = URL(string: digimonArray[currentDigimon+1].sprite)
            let url3 = URL(string: digimonArray[currentDigimon+2].sprite)
            let url4 = URL(string: digimonArray[currentDigimon+3].sprite)
            
            if url1 != nil && url2 != nil && url3 != nil && url4 != nil {
                pictureImageView1.af_setImage(withURL: url1!)
                pictureImageView2.af_setImage(withURL: url2!)
                pictureImageView3.af_setImage(withURL: url3!)
                pictureImageView4.af_setImage(withURL: url4!)
            }

            bringNextCardToFront(card: card4)
            bringNextCardToFront(card: card3)
            bringNextCardToFront(card: card2)
            bringNextCardToFront(card: card1)
         }
    }
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)

        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 85 {
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y + 150)
                    card.alpha = 0
                })

                currentDigimon += 4
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon].sprite)!
                    pictureImageView1.af_setImage(withURL: url)
                }
                resetCard(card: self.card1!)
                bringNextCardToFront(card: card2)
                return
            } else if card.center.x > (view.frame.width - 85){
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 150 )
                    card.alpha = 0
                })
                currentDigimon += 4
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon].sprite)!
                    pictureImageView1.af_setImage(withURL: url)
                }
                resetCard(card: self.card1!)
                bringNextCardToFront(card: card2)
                return
            }
        }
    }
    @IBAction func panCard2(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 85 {
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y + 150)
                })
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon+1].sprite)!
                    pictureImageView2.af_setImage(withURL: url)
                }
                resetCard(card: self.card2!)
                bringNextCardToFront(card: card3)
                return
            } else if card.center.x > (view.frame.width - 85){
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 150 )
                })
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon+1].sprite)!
                    pictureImageView2.af_setImage(withURL: url)
                }
                resetCard(card: self.card2!)
                bringNextCardToFront(card: card3)
                return
            }
        }
    }
    @IBAction func panCard3(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)

        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 85 {
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y + 150)
                })
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon+2].sprite)!
                    pictureImageView3.af_setImage(withURL: url)
                }
                resetCard(card: self.card3!)
                bringNextCardToFront(card: card4)
                return
            } else if card.center.x > (view.frame.width - 85){
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 150 )
                })
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon+2].sprite)!
                    pictureImageView3.af_setImage(withURL: url)
                }
                resetCard(card: self.card3!)
                bringNextCardToFront(card: card4)
                return
            }
        }
    }
    
    @IBAction func panCard4(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)

        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 85 {
                // Move off to the left
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y + 150)
                })
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon+3].sprite)!
                    pictureImageView4.af_setImage(withURL: url)
                }
                resetCard(card: self.card4!)
                bringNextCardToFront(card: card1)
                return
            } else if card.center.x > (view.frame.width - 85){
                // Move off to the right
                UIView.animate(withDuration: 0.3, animations: {
                    card.alpha = 0
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 150 )
                })
                if currentDigimon <= 99 {
                    let url = URL(string: digimonArray[currentDigimon+3].sprite)!
                    pictureImageView4.af_setImage(withURL: url)
                }
                resetCard(card: self.card4!)
                bringNextCardToFront(card: card1)
                return
            }
        }
    }
    
    func resetCard(card: UIView){
        card.center = view.center
        self.view.sendSubviewToBack(card)
        card.alpha = 1
    }
    
    func bringNextCardToFront(card: UIView){
        self.view.bringSubviewToFront(card)
    }

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

