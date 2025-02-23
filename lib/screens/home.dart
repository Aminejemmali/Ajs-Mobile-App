import 'package:ajs_mobile_app/main.dart';
import 'package:ajs_mobile_app/utils/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key}); // Added constructor with Key for best practice

  @override
  Widget build(BuildContext context) {
    // Safely get AppLocalizations, with a fallback if null
    final appLocalization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalization?.translate("home") ?? "Home",
        ),
        actions: [
          // Wrap icons with SingleChildScrollView for horizontal scrolling
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Language Change Button
                IconButton(
                  icon: const Icon(Icons.language),
                  onPressed: () {
                    // Switch language and print to console for feedback
                    Locale newLocale = Localizations.localeOf(context).languageCode == 'en'
                        ? const Locale('ar')  // Switch to Arabic
                        : const Locale('en'); // Switch to English
                    MyApp.setLocale(context, newLocale);  // Function to change language
                    print("Language switched to: ${newLocale.languageCode}");
                  },
                ),
                // Theme Change Button
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  onPressed: () {
                    // Toggle theme logic here
                    final currentTheme = Theme.of(context);
                    final isDarkMode = currentTheme.brightness == Brightness.dark;
                    ThemeMode newThemeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
                    MyApp.setTheme(context, newThemeMode);  // Function to change theme
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          appLocalization?.translate("home") ?? "Home", // Fallback text
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
