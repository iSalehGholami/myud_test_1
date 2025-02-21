import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color accentColor;

  const AppCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.accentColor = const Color(0xFF16C47F),
  });

  @override
  Widget build(BuildContext context) {
    print("assets/images/${imageUrl}");
    return SizedBox(
      width: 160, // 🔹 Fixed width for consistency
      height: 220, // 🔹 Fixed height to ensure proper layout
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            // 🔹 Image section (Fixed at the top)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                "/images/${imageUrl}",
                width: 160,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 160,
                  height: 120,
                  color: Colors.grey[300], // Placeholder if image fails
                  child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                ),
              ),
            ),

            // 🔹 Title (Centered horizontally & aligned to the right)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),

            // 🔹 Install Button (Stuck at the bottom)
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Button action
                  },
                  child: const Text("نصب"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
