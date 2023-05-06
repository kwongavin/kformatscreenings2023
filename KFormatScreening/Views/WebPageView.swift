//
//  WebPageView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 5/6/23.
//

import SwiftUI
import WebKit

struct WebPageView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        
        let webView = WKWebView()
        let url = URL(string: "https://www.kbroadcastingscreenings.com/meetings/")
        
        let request = URLRequest(url: url!)
        webView.load(request)
        
        return webView
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        
    }
    
    
}

struct WebPageView_Previews: PreviewProvider {
    static var previews: some View {
        WebPageView()
    }
}
