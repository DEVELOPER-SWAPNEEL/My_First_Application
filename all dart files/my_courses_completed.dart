import 'package:flutter/material.dart';

class CompletedCoursesScreen extends StatelessWidget {
  const CompletedCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> completedCourses = [
      Course("Programming", "assets/images/programming.png", "21-03-2024"),
      Course("Python", "assets/images/python.png", "28-10-2023"),
      Course("C++", "assets/images/cpp.png", "10-08-2023"),
      Course("Icon Design", "assets/images/icon_design.png", "24-03-2022"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'My Courses',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'In Progress',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Completed',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: completedCourses.length,
              itemBuilder: (context, index) {
                final course = completedCourses[index];
                return completedCourseCard(course);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget completedCourseCard(Course course) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              course.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                const Text(
                  'By John Smith',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text('Completion Date  ${course.date}',
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.download_rounded,
              color: Colors.deepPurple, size: 26),
        ],
      ),
    );
  }
}

class Course {
  final String title;
  final String image;
  final String date;

  Course(this.title, this.image, this.date);
}
