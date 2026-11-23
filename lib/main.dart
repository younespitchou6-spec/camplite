

import 'package:flutter/material.dart';

void main() {
  runApp(const CampliteApp());
}

class CampliteApp extends StatelessWidget {
  const CampliteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camplite',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF247A55),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> camps = [
    {
      'name': 'مخيم الغابة الخضراء',
      'location': 'جيجل، الجزائر',
      'price': '3500 دج',
      'icon': Icons.forest,
    },
    {
      'name': 'مخيم شاطئ البحر',
      'location': 'بجاية، الجزائر',
      'price': '4500 دج',
      'icon': Icons.beach_access,
    },
    {
      'name': 'مخيم الجبال',
      'location': 'تيزي وزو، الجزائر',
      'price': '3000 دج',
      'icon': Icons.landscape,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F8F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            children: [
              Icon(Icons.terrain, color: Color(0xFF247A55), size: 30),
              SizedBox(width: 8),
              Text(
                'Camplite',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF247A55),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اكتشف جمال الجزائر 🌲',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'اعثر على مكانك المثالي للمغامرة والتخييم',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 22),

              TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن مكان التخييم أو الولاية',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'استكشف حسب النوع',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 95,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryItem(
                      icon: Icons.forest,
                      title: 'الغابات',
                    ),
                    CategoryItem(
                      icon: Icons.beach_access,
                      title: 'الشواطئ',
                    ),
                    CategoryItem(
                      icon: Icons.landscape,
                      title: 'الجبال',
                    ),
                    CategoryItem(
                      icon: Icons.cabin,
                      title: 'الأكواخ',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'أماكن تخييم مميزة',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              ...camps.map((camp) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 15),
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 145,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0EFE5),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18),
                          ),
                        ),
                        child: Icon(
                          camp['icon'] as IconData,
                          size: 65,
                          color: const Color(0xFF247A55),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              camp['name'] as String,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                Text(
                                  camp['location'] as String,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${camp['price']} / الليلة',
                                  style: const TextStyle(
                                    color: Color(0xFF247A55),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                FilledButton(
                                  onPressed: () {},
                                  child: const Text('التفاصيل'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              label: 'استكشف',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              label: 'المفضلة',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF247A55),
            size: 30,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
