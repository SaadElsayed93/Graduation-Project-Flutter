import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/government_screen.dart';
import 'screens/issue_screen.dart';
import 'screens/service_order_screen.dart';
import 'screens/about.dart';
import 'screens/notifications.dart';
import 'screens/Profile.dart';
import 'screens/login_page.dart';

void main() {
  runApp(CityApp());
}

class CityApp extends StatelessWidget {
  const CityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    GovernmentScreen(),
    IssueScreen(),
    const ServiceOrderScreen(),
    AboutUs(),
    const Notifications(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: AppBar(
          backgroundColor: const Color(0xFF3D6643),
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'مدينتنا',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'مرحباً بك .....',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: pages[currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF3D6643),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'مدينتنا',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'مرحباً بكم!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('الرئيسية'),
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_police_rounded),
              title: const Text('حكومتنا'),
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text('المشاكل'),
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.online_prediction),
              title: const Text('لطلب الخدمات'),
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.accessibility_outlined),
              title: const Text('من نحن..؟'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('الملف الشخصي'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              
              
            ),
             ListTile(
              leading: const Icon(Icons.person),
              title: const Text('تسجيل الخروج'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              
              
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 25),
        selectedLabelStyle: const TextStyle(fontSize: 16),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF3D6643),
        selectedItemColor: const Color.fromARGB(172, 255, 255, 255),
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.home_filled : Icons.home_outlined,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1
                  ? Icons.local_police_rounded
                  : Icons.local_police_outlined,
            ),
            label: 'حكومتنا',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 2 ? Icons.report : Icons.report_outlined,
            ),
            label: 'المشاكل',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 3 ? Icons.help : Icons.help_outline_outlined,
            ),
            label: 'لطلب خدمات',
          ),
        ],
      ),
    );
  }
}
