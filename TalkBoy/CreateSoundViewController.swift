//
//  CreateSoundViewController.swift
//  TalkBoy
//
//  Created by Joe Crescenzi on 9/4/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit
import AVFoundation

class CreateSoundViewController: UIViewController {

    
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var TitleBox: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    
    var audioRecorder : AVAudioRecorder?
    var audioPlayer : AVAudioPlayer?
    var audioURL : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayButton.isEnabled = false
        TitleBox.isEnabled = false
        AddButton.isEnabled = false
        
        
        // step 1 create audio session
        let myAudioSession = AVAudioSession.sharedInstance()
        try? myAudioSession.setCategory(AVAudioSessionCategoryRecord)
        try? myAudioSession.overrideOutputAudioPort(.speaker)
        try? myAudioSession.setActive(true)
        
        
        // step 2 URL to save audio
        if let BasePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let PathComponents = [BasePath, "audio.m4a"]
            if let ThisAudioUrl = NSURL.fileURL(withPathComponents: PathComponents){
                // step 3 create some settings
                self.audioURL = ThisAudioUrl
                var MyAudioSettings : [String:Any] = [:]
                MyAudioSettings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
                MyAudioSettings[AVSampleRateKey] = 44100.0
                MyAudioSettings[AVNumberOfChannelsKey] = 2
                
                // step 4 create audio recorder
                audioRecorder = try? AVAudioRecorder(url: ThisAudioUrl, settings: MyAudioSettings)
                audioRecorder?.prepareToRecord()
                
            }
            

            
        }
      
    }
    
    
    
    @IBAction func RecordWasTapped(_ sender: Any) {
        if let audioRecorder = self.audioRecorder {
            if audioRecorder.isRecording{
                audioRecorder.stop()
                RecordButton.setTitle("Record", for: .normal)
                PlayButton.isEnabled = true
                TitleBox.isEnabled = true
                AddButton.isEnabled = true

                
            }
            else
            {
                PlayButton.isEnabled = false
                TitleBox.isEnabled = false
                AddButton.isEnabled = true

                audioRecorder.record()
                RecordButton.setTitle("Stop", for: .normal)

            }

        }
        
    }
    
    
    @IBAction func PlayWasTapped(_ sender: Any) {
        if let audioURL = self.audioURL{
            audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
            audioPlayer?.play()
        }
        
    }
    
    
    @IBAction func AddWasTapped(_ sender: Any) {
        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
             let MySound = SoundEntity(entity: SoundEntity.entity(), insertInto: myContext)
            MySound.audioName = TitleBox.text
            if let audioURL = self.audioURL{
                MySound.audioData = try? Data(contentsOf: audioURL)
                try? myContext.save()
                navigationController?.popViewController(animated: true)
            }
        }
        
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
