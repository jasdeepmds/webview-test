import 'package:flutter/material.dart';
import 'package:webview_func_test/ui/routes/webviewDisplay.dart';

class EnvironmentSelector extends StatefulWidget {
  static const String route = "/environment-selector";

  @override
  _EnvironmentSelectorState createState() => _EnvironmentSelectorState();
}

class _EnvironmentSelectorState extends State<EnvironmentSelector> {
  List<String> _urls = [
    "https://pro.qa-v2.mrbuilder.io/",
    "https://pro.getdone.com/",
  ];
  String _selectedUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview test"),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Select Environment"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: _selectedUrl,
                    items: _urls.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        _selectedUrl = newVal;
                      });
                    },
                  ),
                ),
                FlatButton(
                    onPressed: _selectedUrl == null
                        ? null
                        : () {
                            Navigator.of(context).pushNamed(
                                WebviewDisplay.route,
                                arguments: _selectedUrl);
                          },
                    child: Container(
                      child: Text("Launch webview"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
