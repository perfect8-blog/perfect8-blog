import 'package:flutter/material.dart';

// Main application setup (for demonstration)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith( 
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF181818), 
          elevation: 0, // No shadow
        )
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         toolbarHeight: 60, // Give the AppBar enough height for the NavBar
         title: Align(     // Use Align to control positioning within AppBar
           alignment: Alignment.center, // Center the NavBar
           child: CustomNavBar(),
         ),
      ),
      body: Center(
        child: Text(
          'Page Content Here',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}


// --- The Custom Navigation Bar Widget ---
class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0; // 0 = HOME, 1 = LOUDSPEAKERS, etc.

  // List of navigation item titles
  final List<String> _navItems = const [ // Use const for performance
    "HOME",
    "LOUDSPEAKERS",
    "DESIGN PHILOSOPHY",
    "CONTACT"
  ];

  // Function to build each individual navigation item
  Widget _buildNavItem(int index, String title) {
    bool isSelected = _selectedIndex == index;

    return InkWell( // Makes the item tappable
      onTap: () {
        setState(() { // Update the state to change the selected item
          _selectedIndex = index;
        });
        // --- TODO: Add your actual navigation logic here ---
        // For example, using Navigator, GoRouter, updating a PageView, etc.
        print("Navigating to: $title");
        // Example navigation actions:
        // if (title == "HOME") Navigator.pushNamed(context, '/home');
        // else if (title == "LOUDSPEAKERS") Navigator.pushNamed(context, '/loudspeakers');
        // ... and so on
      },
      // Optional: Customize the tap feedback effect
      splashColor: Colors.blue.withOpacity(0.2),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: Padding(
        // Add padding around each item for better spacing and tap area
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Fit content vertically
          mainAxisAlignment: MainAxisAlignment.center, // Center text+underline vertically
          children: [
            // The Text label
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                // Use a slightly bolder weight, adjust as needed
                fontWeight: FontWeight.w600,
                fontSize: 14, 
                letterSpacing: 0.5, 
              ),
            ),
          
            const SizedBox(height: 5),
            Container(
              height: 2.5, 
              color: isSelected ? Colors.blueAccent : Colors.transparent, 
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: List.generate(
        _navItems.length,
        (index) => _buildNavItem(index, _navItems[index]),
      ),
    );
  }
}