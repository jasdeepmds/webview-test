import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewDisplay extends StatefulWidget {
  static const String route = "webview-display";

  @override
  _WebviewDisplayState createState() => _WebviewDisplayState();
}

class _WebviewDisplayState extends State<WebviewDisplay> {
  InAppWebViewController _inAppWebViewController;
  String _selectedUrl;
  // bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (_selectedUrl == null) {
      _selectedUrl = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Getdone"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // setState(() {
                //   _isLoading = true;
                // });
                _inAppWebViewController.loadUrl(url: _selectedUrl);
              }),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
                javaScriptEnabled: true,
                supportZoom: false,
                // debuggingEnabled: true,
                // clearCache: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController _controller) async {
              _inAppWebViewController = _controller;
              await _inAppWebViewController.loadUrl(url: _selectedUrl);
              _inAppWebViewController.addJavaScriptHandler(
                  handlerName: "WebviewInterface",
                  callback: (data) async {
                    String message = data.first;
                    print("WebviewInterface message : $message");
                    if (message == "onIntercomUnreadMessage") {
                      print(message);
                    }
                  });
            },
            // onConsoleMessage: (controller, consoleMessage) {
            //   print(consoleMessage.message);
            // },
            // onLoadStop: (controller, url) {
            //   setState(() {
            //     _isLoading = false;
            //   });
            // },
          ),
          // if (_isLoading)
          //   Center(
          //     child: Container(
          //       // width: double.maxFinite,
          //       child: CircularProgressIndicator(),
          //     ),
          //   )
        ],
      ),
    );
  }
}
