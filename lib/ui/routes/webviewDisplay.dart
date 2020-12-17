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
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (_selectedUrl == null) {
      _selectedUrl = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedUrl),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _inAppWebViewController.loadUrl(url: _selectedUrl);
              }),
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _inAppWebViewController.stopLoading().then((value) {
                  setState(() {
                    _isLoading = false;
                  });
                });
              }),
          TextButton(
              onPressed: () {
                _inAppWebViewController.clearCache();
              },
              child: Text(
                "CLEAR",
                style: TextStyle(fontSize: 12),
              ))
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
              // _inAppWebViewController.addJavaScriptHandler(
              //     handlerName: "BookInterface",
              //     callback: (data) async {
              // print("message: ${data.first}");
              // String message = data.first;
              // print("home executed");
              // print(message);
              // print("BookInterface executed, message : $message");
              // if (message == "Home") {
              //   await closeServer();
              //   Navigator.of(context).popUntil((route) => route.isFirst);
              // } else if (message == "Exit") {
              //   await closeServer();
              //   Navigator.of(context).pop();
              // } else if (message.substring(0, 4) == "url:") {
              //   String url = message.substring(4, message.length);
              //   String key =
              //       Provider.of<UserAuthorization>(context, listen: false)
              //           .webToken;
              //   url = "$url?key=$key";
              //   if (await canLaunch(url)) {
              //     await launch(url);
              //   }
              // } else if (message == "languageChange") {
              //   String langCode = data[1];
              //   updateLanguageForBook(
              //     widget.bookDirectoryName,
              //     langCode,
              //     Provider.of<UserAuthorization>(context, listen: false),
              //   );
              // }
              // });
            },
            // onConsoleMessage: (controller, consoleMessage) {
            //   print(consoleMessage.message);
            // },
            onLoadStop: (controller, url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            Center(
              child: Container(
                // width: double.maxFinite,
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
