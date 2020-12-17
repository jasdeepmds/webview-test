import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InAppWebViewController _inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _inAppWebViewController.loadUrl(
                    url: "http://pro.dev-v2.mrbuilder.io");
              })
        ],
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            mediaPlaybackRequiresUserGesture: false,
            javaScriptEnabled: true,
            supportZoom: false,
            // debuggingEnabled: true,
            clearCache: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController _controller) async {
          _inAppWebViewController = _controller;
          await _inAppWebViewController.loadUrl(
              url: "http://pro.dev-v2.mrbuilder.io");
          _inAppWebViewController.addJavaScriptHandler(
              handlerName: "BookInterface",
              callback: (data) async {
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
              });
        },
        // onConsoleMessage: (controller, consoleMessage) {
        //   print(consoleMessage.message);
        // },
      ),
    );
  }
}
