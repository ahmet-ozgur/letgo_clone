import 'package:flutter/material.dart';
import 'package:letgo_clone/views/bottom_navigation_views/sohbet_pages/mesajlarim_page.dart';
import 'package:letgo_clone/views/bottom_navigation_views/sohbet_pages/tekliflerim_page.dart';

class SohbetPage extends StatefulWidget {
  const SohbetPage({super.key});

  @override
  State<SohbetPage> createState() => _SohbetPageState();
}

class _SohbetPageState extends State<SohbetPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        //AppBar - S
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromRGBO(35, 35, 35, 1),

          //Title - S
          title: Text(
            "Sohbet",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          //Title - F

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
                    Tab(child: Text("Mesajlarım")),
                    Tab(child: Text("Tekliflerim")),
                  ],
                ),
              ],
            ),
          ),

          //Tabbar - F
        ),
        //AppBar - F

        //Body TabBar
        body: TabBarView(children: [MesajlarimPage(), TekliflerimPage()]),
      ),
    );
  }
}
