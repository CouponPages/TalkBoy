//
//  SoundsTableViewTableViewController.swift
//  TalkBoy
//
//  Created by Joe Crescenzi on 9/4/17.
//  Copyright © 2017 Joe Crescenzi. All rights reserved.
//

import UIKit
import AVFoundation

class SoundsTableViewTableViewController: UITableViewController {

    var SoundArray : [SoundEntity] = []
    var MyAudioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getSounds()
    }


    
    func getSounds()
    {
        print("getting sounds")
        if let myContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let SoundList = try? myContext.fetch(SoundEntity.fetchRequest()) as? [SoundEntity]{
                if let TheList = SoundList {
                    SoundArray = TheList
                    tableView.reloadData()
                    print(TheList.count)
                }
            }
            
            
        }
    }
    




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("reached number of rows in section")
        print(SoundArray.count)
        return SoundArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let sound = SoundArray[indexPath.row]
        cell.textLabel?.text = sound.audioName
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sound = SoundArray[indexPath.row]
        if let ThisAudio = sound.audioData {
             MyAudioPlayer = try? AVAudioPlayer(data: ThisAudio)
            MyAudioPlayer?.play()
        }
        
    }

    /*
     override func didReceiveMemoryWarning() {
     super.didReceiveMemoryWarning()
     // Dispose of any resources that can be recreated.
     }
     
     // MARK: - Table view data source
     
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }

     
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
