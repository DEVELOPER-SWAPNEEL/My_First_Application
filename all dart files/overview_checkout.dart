import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OverviewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

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
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _stepCircle("1", "Overview", true),
                  _stepCircle("2", "Payment Method", false),
                  _stepCircle("3", "Confirmation", false),
                ],
              ),
              const SizedBox(height: 24),
              const Text("Overview", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/app_design.png", width: 60), // Replace with your asset
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Mobile App Design", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("By Robert James", style: TextStyle(fontSize: 12)),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.black, size: 14),
                              SizedBox(width: 4),
                              Text("4.9 (14,070 Reviews)", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.delete_outline, color: Colors.black54),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text("Purchase Summary", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _priceRow("Price Incl. Tax", "100.00\$"),
                    _priceRow("Coupon", "15.00\$"),
                    const Divider(),
                    _priceRow("Total", "75.00\$", highlight: true),
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
                  child: const Text("CONTINUE", style: TextStyle(color: Colors.white, fontSize: 16)),
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
        Text(title, style: TextStyle(fontSize: 12, color: active ? Colors.deepPurple : Colors.black54)),
      ],
    );
  }

  Widget _priceRow(String title, String amount, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 14)),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              color: highlight ? Colors.deepPurple : Colors.black,
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
