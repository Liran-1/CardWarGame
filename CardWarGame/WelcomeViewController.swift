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
        
        initLocationManager()
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
            welcome_LBL_enterName.text = "\(WelcomeConstants.welcome) \(userName)"
            welcome_TXTF_enterName.isHidden = true
        } else {                                                                // if name not found in UserDefaults
            welcome_LBL_enterName.text = WelcomeConstants.enterYourName
            welcome_TXTF_enterName.isHidden = false
        }
    }
    
    func saveToDefaults(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    @objc func textFieldDidChange(_ userNameField: UITextField){
        if let name = welcome_TXTF_enterName.text, !name.isEmpty{
            welcome_BTN_start.isEnabled = true
        } else {
            welcome_BTN_start.isEnabled = false
        }
    }
        
    @IBAction func welcome_BTN_start(_ sender: Any) {
        if let _ = UserDefaults.standard.string(forKey: UserDefaultsConstants.userName) {
            return
        } else if let userName = welcome_TXTF_enterName.text {
            saveToDefaults(value: userName, key: UserDefaultsConstants.userName)
        }
    }
    
    func loadFromUserDefaults(key: String) -> String?{
        if let loadedData = UserDefaults.standard.string(forKey: key) {
            return loadedData
        }
        return nil
    }

    deinit {
        locationManager.delegate = nil
    }
    
    
}

extension WelcomeViewController:  CLLocationManagerDelegate  {

    func initLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            _ = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            var playerSide: String = ""
            print("\(longitude)")
            if longitude > LocationConstants.sideLongitude {
                playerSide = LocationConstants.east
            } else {
                playerSide = LocationConstants.west
            }
            updateUILocation(playerSide: playerSide)
            saveToDefaults(value: playerSide, key: UserDefaultsConstants.playerSide)
        } // end if
    } // end func locationManager
    
    func updateUILocation(playerSide: String) {
        if playerSide == LocationConstants.east {
            self.welcome_IMG_westSide.isHidden = true
            self.welcome_IMG_eastSide.isHidden = false
        } else {
            self.welcome_IMG_eastSide.isHidden = true
            self.welcome_IMG_westSide.isHidden = false
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print("Authorization changed")
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location manager failed \(error.localizedDescription)")
    }
    
}
