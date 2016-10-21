/*-----------------------------------

    - AdMob banner + Interstitial implementation
    - Demo app -

 created by FV iMAGINATION - 2016
 All Rights reserved

---------------------------------*/


import UIKit
import GoogleMobileAds
import AudioToolbox



class ViewController: UIViewController,
GADBannerViewDelegate
{

    
    // Ad banner
    var adMobBannerView = GADBannerView()
    
    
    // IMPORTANT: REPLACE THE RED STRING BELOW WITH THE UNIT ID YOU'VE GOT BY REGISTERING YOUR APP IN http://apps.admob.com
    let ADMOB_BANNER_UNIT_ID = "ca-app-pub-9733347540588953/7805958028"
    
    
    

override func viewDidLoad() {
        super.viewDidLoad()
    

    // Init AdMob banner
    initAdMobBanner()
}

    
    
    
    
// MARK: -  ADMOB BANNER
func initAdMobBanner() {
    
    if UIDevice.current.userInterfaceIdiom == .phone {
        // iPhone
        adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
        adMobBannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 320, height: 50)
    } else  {
        // iPad
        adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 468, height: 60))
        adMobBannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 468, height: 60)
    }
    
    adMobBannerView.adUnitID = ADMOB_BANNER_UNIT_ID
    adMobBannerView.rootViewController = self
    adMobBannerView.delegate = self
    view.addSubview(adMobBannerView)
        
    let request = GADRequest()
    adMobBannerView.load(request)
}
    

// Hide the banner
func hideBanner(_ banner: UIView) {
        UIView.beginAnimations("hideBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = true
}
    
// Show the banner
func showBanner(_ banner: UIView) {
        UIView.beginAnimations("showBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = false
}
    
// AdMob banner available
func adViewDidReceiveAd(_ view: GADBannerView!) {
        showBanner(adMobBannerView)
}
    
// NO AdMob banner available
func adView(_ view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        hideBanner(adMobBannerView)
}
    
    
    
    
    
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

}

