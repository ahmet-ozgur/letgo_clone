import 'package:flutter/material.dart';
import 'package:letgo_clone/views/bottom_navigation_views/hesap_pages/hesap_page.dart';
import 'package:letgo_clone/views/bottom_navigation_views/ilanlarim_pages/ilanlarim_page.dart';
import 'package:letgo_clone/views/bottom_navigation_views/main_page.dart';
import 'package:letgo_clone/views/bottom_navigation_views/sat_pages/sat_page.dart';
import 'package:letgo_clone/views/bottom_navigation_views/sohbet_pages/sohbet_page.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({super.key});

  @override
  State<MainBottomNavigation> createState() =>
      _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  int secilenIndex = 0;
  List<Widget> sayfaListesi = [
    MainPage(),
    SohbetPage(),
    Container(),
    IlanlarimPage(),
    HesapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Cihazın bottom padding'ini al (safe area için)
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    // BottomNavigationBar'ın yaklaşık yüksekliği
    final bottomNavHeight = kBottomNavigationBarHeight;

    return Scaffold(
      // extendBody ile body'yi bottom bar'ın altına uzat
      extendBody: true,
      body: sayfaListesi[secilenIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: secilenIndex,
            selectedItemColor: Colors.red,
            unselectedItemColor: Color.fromRGBO(165, 165, 165, 1),
            onTap: (value) {
              if (value == 2) {
                return;
              }
              setState(() {
                secilenIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Ana Sayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Sohbet",
              ),
              BottomNavigationBarItem(
                // Sat simgesi placeholder - şeffaf alan
                icon: SizedBox(width: 24, height: 24),
                label: "Sat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt, size: 24),
                label: "İlanlarım",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Hesap",
              ),
            ],
          ),
          // Floating Action Button - Pozisyonu cihaza göre ayarlanmış
          Positioned(
            // Bottom padding + biraz yukarı kaydırma için
            bottom: bottomPadding + 25, // Safe area + istediğin yükseklik
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SatPage()));
              },
              child: Container(
                // Shadow için container ekledim
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(48, 41, 42, 1),
                  radius: 30,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Color.fromRGBO(244, 67, 88, 1),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
