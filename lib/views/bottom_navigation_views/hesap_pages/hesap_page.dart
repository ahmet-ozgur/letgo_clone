import 'package:flutter/material.dart';
import 'package:letgo_clone/views/bottom_navigation_views/hesap_pages/banaozel_page.dart';
import 'package:letgo_clone/views/bottom_navigation_views/hesap_pages/profilim_page.dart';

class HesapPage extends StatefulWidget {
  const HesapPage({super.key});

  @override
  State<HesapPage> createState() => _HesapPageState();
}

class _HesapPageState extends State<HesapPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        //AppBar - S
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),

          //Title - S
          title: Text(
            "Hesabım",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          //Title - F

          //Actions - S
          actions: [
            CircleAvatar(
              backgroundColor: Color.fromRGBO(44, 44, 44, 1),
              child: Icon(Icons.favorite, size: 22, color: Colors.white),
            ),
            SizedBox(width: 12),
            CircleAvatar(
              backgroundColor: Color.fromRGBO(44, 44, 44, 1),
              child: Icon(
                Icons.notifications,
                size: 22,
                color: Colors.white,
              ),
            ),
          ],
          actionsPadding: EdgeInsets.only(right: 12),
          //Actions - F

          //TabBar - S
          //Appbar Tabbar arası çizgi için Preferredsize'ı kullandım.
          bottom: PreferredSize(
            //Appbar yüksekliğini alır.
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [
                Container(color: Colors.black26, height: 1),
                TabBar(
                  unselectedLabelColor: Color.fromRGBO(119, 119, 119, 1),
                  labelColor: Color.fromRGBO(225, 74, 103, 1),
                  indicatorColor: Color.fromRGBO(225, 74, 103, 1),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  dividerColor: Color.fromRGBO(40, 40, 40, 1),
                  dividerHeight: 2,
                  tabs: [
                    Tab(child: Text("Bana Özel")),
                    Tab(child: Text("Profilim")),
                  ],
                ),
              ],
            ),
          ),

          //Tabbar - F
        ),
        //AppBar - F

        //Body TabBar
        body: TabBarView(children: [BanaozelPage(), ProfilimPage()]),
      ),
    );
  }
}
