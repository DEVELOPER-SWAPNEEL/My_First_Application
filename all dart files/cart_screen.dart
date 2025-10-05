import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartCourses = [
    {
      "title": "Website Design",
      "author": "Robert James",
      "price": 499,
      "image": "https://via.placeholder.com/100x100.png?text=Web+Design",
    },
    {
      "title": "Adobe Photoshop",
      "author": "Robert James",
      "price": 699,
      "image": "https://via.placeholder.com/100x100.png?text=Photoshop",
    },
    {
      "title": "Adobe XD",
      "author": "Robert James",
      "price": 599,
      "image": "https://via.placeholder.com/100x100.png?text=Adobe+XD",
    },
  ];

  void _removeFromCart(int index) {
    setState(() {
      cartCourses.removeAt(index);
    });
  }

  int get totalPrice =>
      cartCourses.fold(0, (sum, course) => sum + (course["price"] as int));

  @override
  Widget build(BuildContext context) {
    final Color lightPurple = const Color(0xFFE3D8FB);
    final Color primaryPurple = Colors.deepPurpleAccent;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Cart", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Mark All as Read", style: TextStyle(color: Colors.black54)),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: ListView.builder(
                itemCount: cartCourses.length,
                itemBuilder: (context, index) {
                  final course = cartCourses[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: lightPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            course["image"],
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 70,
                              height: 70,
                              color: Colors.grey[300],
                              child: const Icon(Icons.broken_image),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(course["title"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 4),
                              Text("By ${course["author"]}",
                                  style: const TextStyle(fontSize: 13)),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.deepPurple, size: 16),
                                  Icon(Icons.star, color: Colors.deepPurple, size: 16),
                                  Icon(Icons.star, color: Colors.deepPurple, size: 16),
                                  Icon(Icons.star, color: Colors.deepPurple, size: 16),
                                  Icon(Icons.star_half, color: Colors.deepPurple, size: 16),
                                  SizedBox(width: 4),
                                  Text("4.9", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const Text(
                                "(14,670 Reviews)",
                                style: TextStyle(fontSize: 12, color: Colors.black54),
                              ),
                              const SizedBox(height: 4),
                              Text("₹${course["price"]}",
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.deepPurple),
                          onPressed: () => _removeFromCart(index),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Total: ₹$totalPrice",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: cartCourses.isNotEmpty ? () {
                    // Navigate to checkout or payment page
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryPurple,
                    foregroundColor: Colors.white, // ✅ makes the text white
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text("Checkout"),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
