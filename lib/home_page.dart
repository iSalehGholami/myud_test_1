import 'package:flutter/material.dart';
import 'package:myud_altstore/app_card.dart';
import 'package:myud_altstore/constants/applist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _listApps("محبوب ترین", "popular"),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          _listApps("تاکسی اینترنتی", "taxi"),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          _listApps("پیام رسان ها", "messenger"),
        ],
      ),
    );
  }

  Widget _listApps(String title, String category) {
    final filteredApps = iranianApps.where((app) => app["category"] == category).toList();

    if (filteredApps.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 220, // افزایش ارتفاع کارت‌ها
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filteredApps.map((app) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 160, // افزایش عرض کارت‌ها
                      child: AppCard(
                        title: app["title"]!,
                        imageUrl: app["imageUrl"]!,
                        accentColor: Color(0xff16C47F),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
