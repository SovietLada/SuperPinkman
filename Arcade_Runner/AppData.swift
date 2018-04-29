//
//  AppData.swift
//  LiftingGame
//
//  Created by Leevi on 23/08/14.
//  Copyright (c) 2014 TERVAdev. All rights reserved.
//

// AppData manages user's data with NSUserDefaults.

import Foundation

let userDefaults = UserDefaults.standard

class AppData {

  func synchronize() {

    userDefaults.synchronize()

  }

  func isFirstRun() -> Bool {

    if userDefaults.integer(forKey: "hasStarted") == 42 {
      setStartups(getStartups() + 1)
      return false
    }
    userDefaults.set(42, forKey: "hasStarted")

    // Set initial values for user defaults.
    setStartups(1)
    setHighscore(0)
    setMute(false)

    return true

  }

  func setStartups(_ startups: Int) {

    userDefaults.set(startups, forKey: "startups")
    synchronize()

  }

  func getStartups() -> Int {

    return userDefaults.integer(forKey: "startups")

  }

  func setHighscore(_ score: Int) {

    userDefaults.set(score, forKey: "highscore")
    synchronize()

  }

  func getHighscore() -> Int {

    return userDefaults.integer(forKey: "highscore")

  }

  func setMute(_ bool: Bool) {
    userDefaults.set(bool, forKey: "mute")
  }

  func getMute() -> Bool {
    return userDefaults.bool(forKey: "mute")
  }
  
}
