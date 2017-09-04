//
//  CreateSoundViewController.swift
//  TalkBoy
//
//  Created by Joe Crescenzi on 9/4/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit

class CreateSoundViewController: UIViewController {

    
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var TitleBox: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    
    @IBAction func RecordWasTapped(_ sender: Any) {
    }
    
    
    @IBAction func PlayWasTapped(_ sender: Any) {
    }
    
    
    @IBAction func AddWasTapped(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
