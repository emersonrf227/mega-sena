//
//  ViewController.swift
//  mega sena
//
//  Created by Usuário Convidado on 18/09/19.
//  Copyright © 2019 Usuário Convidado. All rights reserved.
//

import UIKit
import Intents
import IntentsUI
import CoreServices
import CoreSpotlight

struct UserActivitytype {
    static let GenerateMegaSenaNumbers = "br.com.ilikeweb.megasena"
}

class ViewController: UIViewController {
    
    
    lazy var activity: NSUserActivity = {
        
        let activity = NSUserActivity(activityType: UserActivitytype.GenerateMegaSenaNumbers)
        
        
        let attributes = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        
        attributes.contentDescription = "Gerador de Números da MegaSena"
        attributes.thumbnailData = UIImage(named: "ball")?.jpegData(compressionQuality: 1.0)
        
        activity.contentAttributeSet = attributes
        activity.title = "Gerador MegaSena"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.persistentIdentifier = UserActivitytype.GenerateMegaSenaNumbers
        activity.suggestedInvocationPhrase = "Gerar número MegaSena"
        
        return activity
    }()
    
    
    
    
    
    @IBOutlet var balls: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        genereteNumber()
    }
    
    func genereteNumber()  {
        
        var numbers: [Int] = []
        
        while numbers.count < 6 {
            
            let number = Int.random(in: 1...60)
            if numbers.contains(number){
                
                numbers.append(number)
            }
            
        }
        
        numbers.sort()
        
        for(index, number) in numbers.enumerated(){
            balls[index].setTitle("\(number)", for: .normal)
            
            
        }
        
        
        userActivity = activity
        userActivity?.becomeCurrent()
    }
}


