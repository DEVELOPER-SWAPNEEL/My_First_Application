import 'package:flutter/material.dart';

void main() {
  runApp(const ConfirmationApp());
}

class ConfirmationApp extends StatelessWidget {
  const ConfirmationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ConfirmationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_back),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _stepCircle("1", "Overview", false),
                  _stepCircle("2", "Payment Method", false),
                  _stepCircle("3", "Confirmation", true),
                ],
              ),
              const SizedBox(height: 24),
              const Text("Confirmation", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/completed.png', // Replace with your actual image asset
                      height: 180,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Transaction Completed",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "CONTINUE TO LESSON",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepCircle(String number, String title, bool active) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: active ? Colors.deepPurple : Colors.grey.shade300,
          child: Text(number, style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: active ? Colors.deepPurple : Colors.black54,
          ),
        ),
      ],
    );
  }
}
