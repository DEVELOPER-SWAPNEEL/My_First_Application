import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;

  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(course.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
              Center(
                child: Icon(Icons.play_circle_fill, size: 60, color: Colors.white70),
              ),
            ],
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.deepPurple,
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Lessons'),
              Tab(text: 'Reviews'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AboutTab(course: course),
                LessonsTab(),
                ReviewsTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: () {},
                child: const Text('GET ENROLLED'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('ADD TO CART'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  final Course course;

  const AboutTab({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Instructor: ${course.instructor}\n\nDuration: ${course.duration}\n\nThis course covers fundamentals, responsive design, mobile-first approach, and more.',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class LessonsTab extends StatelessWidget {
  const LessonsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lessons = [
      'Introduction To Website Design? - 3:45',
      'Fundamentals Of Website Design - 22:30',
      'What Is Responsive Design? - 34:10',
      'Columns and Content - 20:22',
    ];

    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text('${index + 1}'),
          title: Text(lessons[index]),
          trailing: Icon(index == 0 ? Icons.play_circle : Icons.lock),
        );
      },
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviews = [
      {'name': 'Olivia Tom', 'country': 'US', 'stars': 5.0, 'time': '6 months ago'},
      {'name': 'Tiffany Willison', 'country': 'Canada', 'stars': 5.0, 'time': '5 months ago'},
    ];

    return ListView.builder(
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index] as Map<String, dynamic>; // Cast to Map

        return ListTile(
          leading: CircleAvatar(
            child: Text(review['name'][0]), // Now safe to access
          ),
          title: Text('${review['name']} (${review['country']})'),
          subtitle: Text('⭐ ${review['stars']} • ${review['time']}'),
        );
      },
    );
  }}


