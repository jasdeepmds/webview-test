import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_func_test/ui/routes/environmentSelector.dart';
import 'package:webview_func_test/ui/routes/splashScreen.dart';
import 'package:webview_func_test/ui/routes/webviewDisplay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff03cc7a),
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: SplashScreen.route,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SplashScreen.route:
            return MaterialPageRoute<dynamic>(
              builder: (context) => SplashScreen(),
              settings: settings,
            );
          case EnvironmentSelector.route:
            return MaterialPageRoute<dynamic>(
              builder: (context) => EnvironmentSelector(),
              settings: settings,
            );
          case WebviewDisplay.route:
            return MaterialPageRoute<dynamic>(
              builder: (context) => WebviewDisplay(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                    body: Center(
                        child: Text('No route defined for ${settings.name}'))));
        }
      },
    );
  }
}
