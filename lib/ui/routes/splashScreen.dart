import 'package:flutter/material.dart';
import 'package:webview_func_test/ui/routes/environmentSelector.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Future.delayed(Duration(seconds: 1, milliseconds: 500)).then((value) {
          Navigator.of(context).pushReplacementNamed(EnvironmentSelector.route);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.maxFinite,
          child: Image.asset(
            "asset/images/logo.png",
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
