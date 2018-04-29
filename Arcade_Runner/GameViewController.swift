//
//  GameViewController.swift
//  Arcade_Runner
//
//  Created by Leevi on 16/05/16.
//  Copyright (c) 2016 TERVAdev. All rights reserved.
//

import UIKit
import SpriteKit
import GoogleMobileAds

class GameViewController: UIViewController {

  var screenX: CGFloat?
  var screenY: CGFloat?

  override func viewDidLoad() {
    super.viewDidLoad()

    if AppData().isFirstRun() {
      print("Hello, World!")
    }

    let skView = view as! SKView!
    let scene = GameScene(size: (skView?.bounds.size)!)
    screenX = skView?.bounds.size.width
    screenY = skView?.bounds.size.height
    // Configure the view.
    skView?.showsFPS = false
    skView?.showsNodeCount = false

    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView?.ignoresSiblingOrder = true

    /* Set the scale mode to scale to fit the window */
    scene.scaleMode = .aspectFill

    skView?.presentScene(scene)

    print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
    configureAds()
    NotificationCenter.default.addObserver(self, selector: #selector(showOrHideAd), name: NSNotification.Name(rawValue: "gameStateChanged"), object: nil)

  }

  override var shouldAutorotate : Bool {
    return true
  }

  override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    return UIInterfaceOrientationMask.portrait
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }

  override var prefersStatusBarHidden : Bool {
    return true
  }

  // MARK: Ads

  var ad = GADBannerView(adSize: kGADAdSizeBanner)

  func configureAds() {

    ad.adSize = kGADAdSizeSmartBannerPortrait
    ad.adUnitID = "ca-app-pub-4278039687570537/7469043802"
    ad.rootViewController = self

    view.addSubview(ad)

    let request = GADRequest()
    request.testDevices = ["71e71c5b05140361ce08615b32a3108b", "4e673c010b05052186d83facca536e06", kGADSimulatorID]
    ad.load(request)

  }

  func showOrHideAd() {

    if ad.isHidden {
      configureAds()
      ad.isHidden = false
    }
    else {
      ad.isHidden = true
    }

  }

  /// Tells the delegate an ad request loaded an ad.
  func adViewDidReceiveAd(_ bannerView: GADBannerView!) {
    print("adViewDidReceiveAd")
  }

  /// Tells the delegate an ad request failed.
  func adView(_ bannerView: GADBannerView!,
              didFailToReceiveAdWithError error: GADRequestError!) {
    print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
  }

  /// Tells the delegate that a full screen view will be presented in response
  /// to the user clicking on an ad.
  func adViewWillPresentScreen(_ bannerView: GADBannerView!) {
    print("adViewWillPresentScreen")
  }

  /// Tells the delegate that the full screen view will be dismissed.
  func adViewWillDismissScreen(_ bannerView: GADBannerView!) {
    print("adViewWillDismissScreen")
  }

  /// Tells the delegate that the full screen view has been dismissed.
  func adViewDidDismissScreen(_ bannerView: GADBannerView!) {
    print("adViewDidDismissScreen")
  }

  /// Tells the delegate that a user click will open another app (such as
  /// the App Store), backgrounding the current app.
  func adViewWillLeaveApplication(_ bannerView: GADBannerView!) {
    print("adViewWillLeaveApplication")
  }

}
