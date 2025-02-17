import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "itms-services://?action=download-manifest&url=https://lib.myud.ir/build/plists/1739753428505512945.plist");
                },
                child: const Text("امضا تجارت - no mode"),
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrlString(
                    "itms-services://?action=download-manifest&url=https://lib.myud.ir/build/plists/1739753428505512945.plist",
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const Text("امضا تجارت - externalApplication"),
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrlString(
                      "itms-services://?action=download-manifest&url=https://lib.myud.ir/build/plists/1739753533679192017.plist");
                },
                child: const Text("کوینکس - no mode"),
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrlString(
                    "itms-services://?action=download-manifest&url=https://lib.myud.ir/build/plists/1739753533679192017.plist",
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const Text("کوینکس - externalApplication"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
