import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      "name": "pakaian muslim",
      "price": "Rp. 150.000",
      "image": "assets/muslim.png",
      "description": "Ukuran sesuai dan bahanya bagus.",
    },
    {
      "name": "servic ac",
      "price": "Rp. 150.000",
      "image": "assets/ac.png",
      "description": "bersih dan teliti.",
    },
    {
      "name": "bengkel mobil",
      "price": "menyusaikan kerusakanya",
      "image": "assets/bengkel_mobil.png",
      "description": "teliti dan nyaman dalam penggunaan.",
    },
    {
      "name": "sepatu",
      "price": "Rp. 200.000",
      "image": "assets/sepatu.png",
      "description": "bahan bagus dan nyaman sesuai dengan ukuran.",
    },
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 133, 36),
        title: const Text('Rifki'),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/boy.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search?',
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            name: service['name'],
                            price: service['price'],
                            image: service['image'],
                            description: service['description'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            service['image'],
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            service['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(service['price']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
