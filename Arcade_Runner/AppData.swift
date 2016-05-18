//
//  AppData.swift
//  LiftingGame
//
//  Created by Leevi on 23/08/14.
//  Copyright (c) 2014 TERVAdev. All rights reserved.
//

// AppData manages user's data with NSUserDefaults.

import Foundation

let userDefaults = NSUserDefaults.standardUserDefaults()

class AppData {

  func synchronize() {

    userDefaults.synchronize()

  }

  func isFirstRun() -> Bool {

    if userDefaults.integerForKey("hasStarted") == 42 {
      setStartups(getStartups() + 1)
      return false
    }
    userDefaults.setInteger(42, forKey: "hasStarted")

    // Set initial values for user defaults.
    setStartups(1)
    setHighscore(0)
    setMute(false)

    return true

  }

  func setStartups(startups: Int) {

    userDefaults.setInteger(startups, forKey: "startups")
    synchronize()

  }

  func getStartups() -> Int {

    return userDefaults.integerForKey("startups")

  }

  func setHighscore(score: Int) {

    userDefaults.setInteger(score, forKey: "highscore")
    synchronize()

  }

  func getHighscore() -> Int {

    return userDefaults.integerForKey("highscore")

  }

  func setMute(bool: Bool) {
    userDefaults.setBool(bool, forKey: "mute")
  }

  func getMute() -> Bool {
    return userDefaults.boolForKey("mute")
  }
  
}
