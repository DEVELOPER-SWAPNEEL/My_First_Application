import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'notification_screen.dart';

// Dummy course about page (every course will have its own later)
class CourseAboutPage extends StatelessWidget {
  final String courseTitle;
  const CourseAboutPage({super.key, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(courseTitle)),
      body: Center(
        child: Text(
          'About page for $courseTitle\n(Learning | Lessons | Reviews)',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _categories = ['All', 'UI/UX', 'Website Design', 'App Design', 'Wireframe'];
  final List<bool> _bookmarked = [false, false, false, false];
  final Color primaryPurple = Colors.deepPurpleAccent;
  final Color lightPurple = const Color(0xFFE3D8FB);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = isDark ? Colors.white : Colors.black;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final shouldExit = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Exit App"),
              content: const Text("Are you sure you want to exit the app?"),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text("Cancel")),
                TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Exit")),
              ],
            ),
          );
          if (shouldExit ?? false) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome", style: TextStyle(fontSize: 16, color: textColor)),
                        Text(
                          "Farwa Ali", // or make dynamic
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryPurple),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())),
                          icon: Icon(Icons.shopping_cart_outlined, color: primaryPurple),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications, color: Colors.black),
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen())),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search, color: Colors.deepPurpleAccent),
                    filled: true,
                    fillColor: lightPurple,
                    hintStyle: const TextStyle(color: Colors.black45),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Chip(
                          label: Text(_categories[index]),
                          backgroundColor: index == 0 ? primaryPurple : lightPurple,
                          labelStyle: TextStyle(color: index == 0 ? Colors.white : Colors.black87),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                _buildSectionHeader("Continue Watching", textColor),
                const SizedBox(height: 10),
                _buildHorizontalCourses([
                  _course("Website Design", "Robert James", 4.9, 55, 0),
                  _course("App Design", "Jonny Watson", 5.0, 60, 1),
                ]),
                const SizedBox(height: 20),
                _buildSectionHeader("Popular Courses", textColor),
                const SizedBox(height: 10),
                _buildHorizontalCourses([
                  _course("Wireframe UX", "Elena Park", 4.7, null, 2),
                  _course("Mobile Layout", "Alice Kim", 4.9, null, 3),
                ]),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryPurple,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.forum), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
        TextButton(onPressed: () {}, child: const Text("See All")),
      ],
    );
  }

  Widget _buildHorizontalCourses(List<Widget> cards) {
    return SizedBox(height: 240, child: ListView(scrollDirection: Axis.horizontal, children: cards));
  }

  Widget _course(String title, String author, double rating, int? completed, int index) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CourseAboutPage(courseTitle: title))),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (!isDark) BoxShadow(color: Colors.grey.withAlpha(50), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network('https://via.placeholder.com/150', height: 100, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text("By $author", style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(rating.toString(), style: const TextStyle(fontSize: 12)),
                      if (completed != null) ...[
                        const SizedBox(width: 6),
                        Text("$completed% Completed", style: const TextStyle(fontSize: 10)),
                      ],
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        _bookmarked[index % _bookmarked.length]
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        color: _bookmarked[index % _bookmarked.length] ? primaryPurple : Colors.grey,
                      ),
                      onPressed: () => setState(() {
                        _bookmarked[index % _bookmarked.length] = !_bookmarked[index % _bookmarked.length];
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
