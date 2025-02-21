import 'package:flutter/material.dart';
import 'package:myud_altstore/constants/applist.dart';
import 'app_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // 🔹 Filtered app list based on search query (searching title + description)
    final filteredApps = iranianApps
        .where((app) =>
            app["title"]!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            (app["description"] != null &&
                app["description"]!.toLowerCase().contains(searchQuery.toLowerCase())))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "جستجو",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          // 🔹 Search Box
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: "...نام برنامه را جستجو کنید",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
          ),

          // 🔹 App Grid (2 per row)
          filteredApps.isEmpty
              ? SliverToBoxAdapter(
                  child: const Center(
                    child: Text("نتیجه‌ای یافت نشد", style: TextStyle(color: Colors.black54)),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 🔹 2 columns
                      childAspectRatio: 0.75, // 🔹 Adjust card height ratio
                      crossAxisSpacing: 12, // 🔹 Space between columns
                      mainAxisSpacing: 12, // 🔹 Space between rows
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final app = filteredApps[index];
                        return AppCard(
                          title: app["title"]!,
                          imageUrl: app["imageUrl"]!,
                        );
                      },
                      childCount: filteredApps.length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
