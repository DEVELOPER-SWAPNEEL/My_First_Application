import 'package:flutter/material.dart';

class CourseLessonsPage extends StatelessWidget {
  const CourseLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color purple = Colors.deepPurpleAccent;
    final Color lightPurple = const Color(0xFFE3D8FB);

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.share), onPressed: () {}),
            const SizedBox(width: 8),
          ],
          elevation: 0,
          backgroundColor: purple,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://via.placeholder.com/400x200',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.deepPurpleAccent.withOpacity(0.7),
                ),
                Positioned.fill(
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // handle preview
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Course Preview"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: purple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: lightPurple,
              child: const TabBar(
                labelColor: Colors.deepPurpleAccent,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.deepPurpleAccent,
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Lessons"),
                  Tab(text: "Reviews"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const Center(child: Text("About Section")),
                  _buildLessonsTab(context, purple, lightPurple),
                  const Center(child: Text("Reviews Section")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonsTab(BuildContext context, Color purple, Color lightPurple) {
    final List<Map<String, dynamic>> lessons = [
      {"title": "Introduction To Website Design", "duration": "3:45", "locked": false},
      {"title": "Fundamentals Of Website Design", "duration": "22:30", "locked": true},
      {"title": "What Is Responsive Design?", "duration": "34:10", "locked": true},
      {"title": "Columns and Content", "duration": "20:22", "locked": true},
      {"title": "Mobile First Approach", "duration": "30:22", "locked": true},
      {"title": "Different Libraries", "duration": "15:22", "locked": true},
      {"title": "Design For Mobile", "duration": "10:00", "locked": true},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.person_outline, color: Colors.deepPurpleAccent),
              SizedBox(width: 6),
              Text("By Robert James"),
              SizedBox(width: 16),
              Icon(Icons.book_outlined, color: Colors.deepPurpleAccent),
              SizedBox(width: 6),
              Text("60 Lessons"),
              SizedBox(width: 16),
              Icon(Icons.timer_outlined, color: Colors.deepPurpleAccent),
              SizedBox(width: 6),
              Text("20hrs 45mins"),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return Card(
                  color: lightPurple,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: lesson['locked'] ? Colors.grey[400] : purple,
                      child: Icon(
                        lesson['locked'] ? Icons.lock : Icons.play_arrow,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: Text(lesson['title']),
                    subtitle: Text(lesson['duration']),
                    onTap: lesson['locked']
                        ? null
                        : () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Playing: ${lesson['title']}"),
                      ));
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // handle enroll
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: purple,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("GET ENROLLED", style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // handle add to cart
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: purple),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("ADD TO CART", style: TextStyle(fontSize: 16, color: Colors.deepPurpleAccent)),
            ),
          ),
        ],
      ),
    );
  }
}
