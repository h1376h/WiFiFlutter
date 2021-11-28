import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wifi_basic/wifi_basic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: const Text("WiFiBasic.hasCapability();"),
                  onPressed: () async => showSnackbar(context,
                      "hasCapability: ${await WiFiBasic.hasCapability()}"),
                ),
                ElevatedButton(
                  child: const Text("WiFiBasic.isEnabled();"),
                  onPressed: () async => showSnackbar(
                      context, "isEnabled: ${await WiFiBasic.isEnabled()}"),
                ),
                ElevatedButton(
                  child: const Text("WiFiBasic.setEnabled(true);"),
                  onPressed: () async => showSnackbar(context,
                      "setEnabled(true): success? ${await WiFiBasic.setEnabled(true)}"),
                ),
                ElevatedButton(
                  child: const Text("WiFiBasic.setEnabled(false);"),
                  onPressed: () async => showSnackbar(context,
                      "setEnabled(false): success? ${await WiFiBasic.setEnabled(false)}"),
                ),
                ElevatedButton(
                  child: const Text("WiFiBasic.openSettings();"),
                  onPressed: () async => await WiFiBasic.openSettings(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}