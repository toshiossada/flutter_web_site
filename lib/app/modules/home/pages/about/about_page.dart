import 'package:flutter/material.dart';
import 'package:homepage/app/modules/home/pages/about/widget/avatar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/contact_widget.dart';
import 'widget/info_widget.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // Define a breakpoint for switching layouts (can be same as InitialPage or different)
  static const double _breakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < _breakpoint;

    return Scaffold(
      // Keep AppBar for context within the section, even though InitialPage has nav
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor:
            Colors.transparent, // Optional: Match InitialPage style
        elevation: 0, // Optional: Match InitialPage style
      ),
      body: SingleChildScrollView(
        // Add padding around the main content area
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Center content horizontally in the Column layout
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Conditionally build layout based on screen size
            isSmallScreen
                ? _buildSmallLayout(
                    context) // Vertical layout for small screens
                : _buildLargeLayout(
                    context), // Horizontal layout for large screens

            const SizedBox(height: 32), // Add space before contact section

            // ContactWidget likely works okay on both, but review if needed
            ContactWidget(
              onPressed: _launchUrl,
            ),
            const SizedBox(height: 16), // Add some bottom padding
          ],
        ),
      ),
    );
  }

  // Helper widget for small screen layout (Vertical)
  Widget _buildSmallLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvatarWidget(), // Avatar on top
        const SizedBox(height: 24), // Space between avatar and info
        InfoWidget(), // Info below
      ],
    );
  }

  // Helper widget for large screen layout (Horizontal)
  Widget _buildLargeLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
      mainAxisAlignment:
          MainAxisAlignment.center, // Center row content if space allows
      children: [
        AvatarWidget(), // Avatar on the left
        const SizedBox(width: 32), // Space between avatar and info
        // Allow InfoWidget to take available horizontal space
        Expanded(child: InfoWidget()),
      ],
    );
  }

  // --- URL Launcher remains the same ---
  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // Consider showing a SnackBar or Dialog on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Não foi possível abrir $urlString')),
      );
      // throw Exception('Could not launch $url'); // Avoid throwing raw exceptions
    }
  }
}
