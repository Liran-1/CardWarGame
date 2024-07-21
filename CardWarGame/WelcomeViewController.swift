//
//  WelcomeViewController.swift
//  CardWarGame
//
//  Created by Student20 on 21/07/2024.
//

import Foundation
import UIKit
import CoreLocation

class WelcomeViewController: UIViewController{
    @IBOutlet weak var welcome_LBL_enterName: UILabel!
    @IBOutlet weak var welcome_TXTF_enterName: UITextField!
    @IBOutlet weak var welcome_IMG_westSide: UIImageView!
    @IBOutlet weak var welcome_BTN_start: UIButton!
    @IBOutlet weak var welcome_IMG_eastSide: UIImageView!
    
    var userName: String = ""
    var side: String = ""
    
    var locationManager: CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
        welcomeUser()
        setLocationManager()
    }
    
    func initUI() {
        let orientationSetting = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(orientationSetting, forKey: "orientation")                // set orientation
        
        // Set UI images
        self.welcome_IMG_eastSide.image = UIImage(named: "east_earth")
        self.welcome_IMG_westSide.image = UIImage(named: "west_earth")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {               // set orientation to landscape only
        return .landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    func welcomeUser() {
        welcome_TXTF_enterName.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged) // update UI on textField changes
        
        if let userName = UserDefaults.standard.string(forKey: UserDefaultsConstants.userName){     // if name found in UserDefaults
            welcome_LBL_enterName.text = "Welcome \(userName)"
            welcome_TXTF_enterName.isHidden = true
        } else {                                                                // if name not found in UserDefaults
            welcome_LBL_enterName.text = "Enter your name"
            welcome_TXTF_enterName.isHidden = false
        }
    }
    
    @objc func textFieldDidChange(_ userNameField: UITextField){
        if let name = welcome_TXTF_enterName.text, !name.isEmpty{
            welcome_BTN_start.isEnabled = true
        } else {
            welcome_BTN_start.isEnabled = false
        }
    }
        
    @IBAction func welcome_BTN_start(_ sender: Any) {
        if let userName = UserDefaults.standard.string(forKey: UserDefaultsConstants.userName) {
            return
        } else if let userName = welcome_TXTF_enterName.text {
            UserDefaults.standard.set(userName, forKey: UserDefaultsConstants.userName)
        }
    }

}

extension WelcomeViewController:  CLLocationManagerDelegate  {

    func setLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    

}
