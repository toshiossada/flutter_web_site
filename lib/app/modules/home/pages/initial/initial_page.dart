import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seo_renderer/seo_renderer.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var selectedIndex = 0; // Keep track of the selected index for highlighting

  // Define a breakpoint for switching between layouts
  static const double _breakpoint = 700.0; // Adjust as needed

  @override
  void initState() {
    super.initState();
    // Navigate to the initial route when the page loads
    // Check if the current route matches any page, otherwise default to 'about'
    final currentRoute = Modular.to.path;
    bool routeMatched = false;
    for (var page in PagesEnum.values) {
      if (currentRoute.startsWith(page.route)) {
        selectedIndex = page.pageIndex;
        routeMatched = true;
        break;
      }
    }
    if (!routeMatched) {
      selectedIndex = PagesEnum.about.pageIndex; // Default index
      // Use pushReplacementNamed to avoid adding to history if already at root
      Modular.to.pushReplacementNamed(PagesEnum.about.route);
    }
  }

  // Helper function to build navigation items (used in AppBar actions and Drawer)
  List<Widget> _buildNavigationItems(BuildContext context, bool isDrawer) {
    return List.generate(PagesEnum.values.length, (index) {
      final page = PagesEnum.values[index];
      final isSelected = page.pageIndex == selectedIndex;

      // Use ListTile for Drawer, Padding/InkWell for AppBar
      if (isDrawer) {
        return ListTile(
          title: Text(
            page.description,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: isSelected,
          onTap: () {
            Modular.to.navigate(page.route);
            Navigator.pop(context); // Close the drawer
            setState(() {
              selectedIndex = page.pageIndex;
            });
          },
        );
      } else {
        // AppBar Actions
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding
          child: InkWell(
            onTap: () {
              Modular.to.navigate(page.route);
              setState(() {
                selectedIndex = page.pageIndex;
              });
            },
            child: Center(
              // Center text vertically in AppBar
              child: Text(
                page.description,
                style: TextStyle(
                  fontSize: 18, // Slightly smaller for AppBar
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  decoration: isSelected
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationThickness: 2.0, // Make underline more visible
                ),
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < _breakpoint;

    return Scaffold(
      // Use endDrawer for drawer appearing from the right (common with actions replacement)
      // Or use drawer for standard left-side drawer
      drawer: isSmallScreen
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Row(
                      // Similar title as AppBar
                      children: [
                        ImageRenderer(
                          alt: 'Toshi Ossada Logo',
                          child: Image.asset(
                            'assets/images/favicon.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Toshi Ossada',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  ..._buildNavigationItems(context, true), // Build drawer items
                ],
              ),
            )
          : null, // No drawer on large screens
      appBar: AppBar(
        // Automatically shows hamburger icon if drawer is present and leading is null
        // leading: isSmallScreen ? null : SizedBox(), // Explicitly control if needed
        title: GestureDetector(
          onTap: () {
            Modular.to.navigate(PagesEnum.about.route); // Navigate to default
            setState(() {
              selectedIndex = PagesEnum.about.pageIndex;
            });
          },
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Prevent Row from taking full width
            children: [
              ImageRenderer(
                alt: 'Toshi Ossada Logo',
                child: Image.asset(
                  'assets/images/favicon.png',
                  height: 40, // Consistent height
                ),
              ),
              const SizedBox(width: 15), // Consistent spacing
              const Text('Toshi Ossada'),
            ],
          ),
        ),
        actions: isSmallScreen
            ? null // No actions on small screens (use drawer)
            : [
                ..._buildNavigationItems(
                    context, false), // Build AppBar actions
                const SizedBox(width: 16), // Add some trailing space
              ],
      ),
      body: const RouterOutlet(), // Your page content based on route
    );
  }
}

// --- PagesEnum remains the same ---
enum PagesEnum {
  about(
    pageIndex: 0,
    route: '/about',
    description: 'Sobre',
  ),
  carrer(
    pageIndex: 1,
    route: '/carrer',
    description: 'Carreira',
  ),
  contact(
    pageIndex: 2,
    route: '/contact',
    description: 'Contato',
  );

  const PagesEnum({
    required this.pageIndex,
    required this.route,
    required this.description,
  });

  final int pageIndex;
  final String route;
  final String description;
}
