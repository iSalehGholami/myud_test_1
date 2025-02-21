import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  // 🔹 Function to launch URLs
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "پروفایل",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Developer Name
            Text(
              "Alir Alirsch",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 🔹 Remaining Days (Persian)
            Text(
              " روز باقی مانده۱۲۳",
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // 🔹 Download Certificate Files
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              icon: const Icon(Icons.file_download),
              label: const Text("دانلود فایل‌های گواهی"),
              onPressed: () {
                _launchURL("https://myud.ir/certificates"); // Change URL as needed
              },
            ),
            const SizedBox(height: 12),

            // 🔹 Install Pre-Signed ESign App
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              icon: const Icon(Icons.download_for_offline),
              label: const Text("نصب ESign پیش‌امضا شده"),
              onPressed: () {
                _launchURL("https://myud.ir/esign"); // Change URL as needed
              },
            ),
            const SizedBox(height: 12),

            // 🔹 Visit Website (myud.ir)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
              icon: const Icon(Icons.web),
              label: const Text("بازدید از وبسایت ما"),
              onPressed: () {
                _launchURL("https://myud.ir");
              },
            ),
          ],
        ),
      ),
    );
  }
}
