import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> todayNotifications = [
    {
      "title": "Transaction Completed",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.check_circle,
      "color": Colors.deepPurple,
    },
    {
      "title": "Lesson Update",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.lightbulb,
      "color": Colors.amber,
    },
    {
      "title": "Lesson Completed",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.thumb_up,
      "color": Colors.green,
    },
    {
      "title": "New Update Available",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.notifications_active,
      "color": Colors.deepOrange,
    },
  ];

  List<Map<String, dynamic>> yesterdayNotifications = [
    {
      "title": "Due Date Is Near",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.event_note,
      "color": Colors.redAccent,
    },
    {
      "title": "Due Date Is Near",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.event_note,
      "color": Colors.redAccent,
    },
    {
      "title": "Due Date Is Near",
      "description": "Lorem Ipsum Dolor Sit Amet Consectetur. Eliefend",
      "icon": Icons.event_note,
      "color": Colors.redAccent,
    },
  ];

  void _markAllAsRead() {
    // Dummy functionality: You can implement state change logic here.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All notifications marked as read")),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3D8FB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: data["color"],
            child: Icon(data["icon"], color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data["title"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(data["description"],
                    style: const TextStyle(fontSize: 12, color: Colors.black54)),
                const SizedBox(height: 4),
                const Text("20 mins ago",
                    style: TextStyle(fontSize: 11, color: Colors.black38)),
              ],
            ),
          ),
          const Icon(Icons.more_vert, size: 20, color: Colors.black45),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            TextButton(
              onPressed: _markAllAsRead,
              child: const Text("Mark All as Read",
                  style: TextStyle(color: Colors.black54, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ...list.map(_buildNotificationCard).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
        const Text("Notifications", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection("Today", todayNotifications),
            const SizedBox(height: 24),
            _buildSection("Yesterday", yesterdayNotifications),
          ],
        ),
      ),
    );
  }
}
