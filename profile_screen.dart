import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage('assets/images/profile.jpg'), // Replace with actual image
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Farwa Ali',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'contact@email.com',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Lorem Ipsum Dolor Sit Amet Consectetur. Eleifend Facilisis Metus Enim Ut Mauris. Nibh Neque. ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Expanded(
            child: ProfileOptions(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
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
}

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {'icon': Icons.person, 'label': 'Edit Profile'},
      {'icon': Icons.credit_card, 'label': 'Payment Option'},
      {'icon': Icons.notifications, 'label': 'Notification Settings'},
      {'icon': Icons.dark_mode, 'label': 'Dark Mode'},
      {'icon': Icons.group_add, 'label': 'Invite Friends'},
      {'icon': Icons.lock, 'label': 'Security'},
      {'icon': Icons.help_outline, 'label': 'Help Center'},
      {'icon': Icons.description, 'label': 'Terms and Conditions'},
      {'icon': Icons.logout, 'label': 'Sign Out'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(options[index]['icon'], color: Colors.deepPurple),
          title: Text(options[index]['label']),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // TODO: Navigate or perform action
          },
        );
      },
    );
  }
}
