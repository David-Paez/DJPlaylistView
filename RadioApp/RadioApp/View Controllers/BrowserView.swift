//  BrowserView.swift

import UIKit
import WebKit // required framework

class BrowserViewController: UIViewController, WKUIDelegate { // required protocol
    
    var webView: WKWebView! // web redering engine
    var playlist: DJPlaylistDatabase.Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webConfiguration = WKWebViewConfiguration()
        
        // create webview
        let webView = WKWebView(frame: CGRect(x: 0, y:50, width: view.frame.width, height : view.frame.height - 50), configuration: webConfiguration)
        
        webView.uiDelegate = self
        
        // assigns the url to playlist's url unless not found
        let myURL = URL(string: playlist?.url ?? "https://www.spotify.com")
        let myRequest = URLRequest(url: myURL!)
        
        webView.load(myRequest)
        
        view.addSubview(webView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // if a new web page is loaded, the label will be gone
        if let labelWithTag = self.view.viewWithTag(25) {
            labelWithTag.removeFromSuperview()
        }
    }
    
}



