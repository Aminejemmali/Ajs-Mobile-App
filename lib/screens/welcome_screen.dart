import 'package:ajs_mobile_app/screens/home.dart';
import 'package:ajs_mobile_app/utils/app_localizations.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key}); // Added constructor with Key for best practice

  @override
  Widget build(BuildContext context) {
    // Safely get AppLocalizations, with a fallback if null
    final appLocalization = AppLocalizations.of(context);

    final List<Map<String, String>> welcomeData = [
      {
        'image': 'https://firebasestorage.googleapis.com/v0/b/aminejameliservices.appspot.com/o/mobile_app_ressources%2Fimages%2F_wimg1.png?alt=media&token=ec0acfc7-637d-49a4-bf21-209cad5b8390',
        'text': appLocalization?.translate("welcome_1") ?? "Welcome Step 1", // Fallback text
      },
      {
        'image': 'https://firebasestorage.googleapis.com/v0/b/aminejameliservices.appspot.com/o/mobile_app_ressources%2Fimages%2F_wimg2.png?alt=media&token=42d649f9-7f0f-4b51-a28c-89d24b3574dd',
        'text': appLocalization?.translate("welcome_2") ?? "Welcome Step 2",
      },
      {
        'image': 'https://firebasestorage.googleapis.com/v0/b/aminejameliservices.appspot.com/o/mobile_app_ressources%2Fimages%2F_wimg3.png?alt=media&token=31898453-00aa-4aaf-af25-ebe66dfdfab0',
        'text': appLocalization?.translate("welcome_3") ?? "Welcome Step 3",
      },
    ];

    return Scaffold(
      body: PageView.builder(
        itemCount: welcomeData.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                welcomeData[index]['image']!,
                height: 650,
                width: 650,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator(
color: Colors.red,

                  ); // Show loader while image loads
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error); // Show error icon if image fails
                },
              ),
              const SizedBox(height: 20),
              Text(
                welcomeData[index]['text']!, // Safe since we provide fallback
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) =>  HomeScreen()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}