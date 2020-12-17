import 'package:flutter/material.dart';
import 'package:webview_func_test/ui/routes/webviewDisplay.dart';

class EnvironmentSelector extends StatefulWidget {
  static const String route = "/environment-selector";

  @override
  _EnvironmentSelectorState createState() => _EnvironmentSelectorState();
}

class _EnvironmentSelectorState extends State<EnvironmentSelector> {
  List<Map<String, String>> _urls = [
    {
      "name": "DEV",
      "url": "https://pro.dev-v2.mrbuilder.io/",
    },
    {
      "name": "QA",
      "url": "https://pro.qa-v2.mrbuilder.io/",
    },
    {
      "name": "PROD",
      "url": "https://pro.getdone.com/",
    },
  ];
  Map<String, String> _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = _urls.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getdone"),
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
                    value: _selectedOption["name"],
                    items: _urls.map((Map<String, String> value) {
                      return DropdownMenuItem<String>(
                        value: value["name"],
                        child: Text(value["name"]),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      Map<String, String> data =
                          _urls.firstWhere((e) => e["name"] == newVal);
                      print("data");
                      setState(() {
                        _selectedOption = data;
                      });
                    },
                  ),
                ),
                FlatButton(
                    onPressed: _selectedOption == null
                        ? null
                        : () {
                            Navigator.of(context).pushNamed(
                                WebviewDisplay.route,
                                arguments: _selectedOption["url"]);
                          },
                    child: Container(
                      child: Text("Launch app"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
