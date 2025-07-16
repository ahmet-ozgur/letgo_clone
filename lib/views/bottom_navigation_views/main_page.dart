import 'package:flutter/material.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/main_category.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/views/cart_page.dart';
import 'package:letgo_clone/views/category_page.dart';
import 'package:letgo_clone/views/item_detail_page.dart';
import 'package:letgo_clone/widgets/urun_kart_widget.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //Kategori Listesi
  List<MainCategory> categoryList = DataHelper.allCategoryList;
  //Pageview Banner Listesi
  List<String> bannerPath = DataHelper.bannerPath;
  //Pageview Sayfası
  int _currentPage = 0;
  //Ürünler deneme listesi
  List<LetGoItem> testItems = DataHelper.getActiveItems();
  List<LetGoItem> horizontalItems = DataHelper.getActiveItems()
      .take(6)
      .toList();
  List<LetGoItem> gridItems = DataHelper.getActiveItems()
      .skip(6)
      .take(4)
      .toList();
  List<LetGoItem> horizontalItems2 = DataHelper.getFeaturedItems().reversed
      .take(6)
      .toList()
      .reversed
      .toList();
  List<LetGoItem> gridItems2 = (DataHelper.getActiveItems()..shuffle())
      .take(4)
      .toList();
  late PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1000);
  }

  void onCartUpdated() {
    setState(() {});
  }

  // ItemDetailPage'e navigation için yeni fonksiyon
  Future<void> navigateToItemDetail(LetGoItem item) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ItemDetailPage(urun: item),
      ),
    );
    // Geri döndüğünde sepet ikonunu güncelle
    setState(() {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      //AppBar - S
      appBar: AppBar(
        //Leading Letgo Logo - S
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: Image.asset(DataHelper.anaLogoPath, fit: BoxFit.contain),
        ),
        leadingWidth: 74,
        //Leading Letgo Logo - F
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        //Title Container - S
        title: Container(
          width: 180,
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(44, 44, 44, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          //Container içi - S
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon 1
              Icon(
                Icons.location_on_rounded,
                color: Color.fromRGBO(255, 58, 99, 1),
                size: 20,
              ),
              SizedBox(width: 6),
              //Text
              Text(
                "İstanbul, Bakırköy",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(width: 6),
              //Icon 2
              Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromRGBO(255, 58, 99, 1),
                size: 20,
              ),
            ],
          ),
          //Container içi - F
        ),
        centerTitle: true,
        //Title Container - F
        //Actions - S
        actions: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 22,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    //Sepetten dönüşü beklemek için
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                    setState(() {});
                  },
                ),
              ),
              //Sepetteki ürün sayısı
              if (DataHelper.getCartItemCount() > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '${DataHelper.getCartItemCount()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
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
      ),
      //AppBar - F
      body: Column(
        children: [
          //Arama çubuğu - S
          Container(
            color: Color.fromRGBO(44, 44, 44, 1),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: SizedBox(
                height: 36,
                child: TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText:
                        "Araba, telefon, bisiklet ve daha fazlası...",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(220, 220, 220, 1),
                      fontSize: 12,
                    ),
                    fillColor: Color.fromRGBO(64, 64, 64, 1),
                    filled: true,
                    //Prefix Iconu var + hintText var + Radius + bg color
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(220, 220, 220, 1),
                      size: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //Arama çubuğu - F
          //Ana Kategori ListView - S
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CategoryPage(
                                    category: categoryList[index],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      categoryList[index].backgroundColor,
                                  child: Icon(
                                    categoryList[index].icon,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                SizedBox(height: 4),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    categoryList[index].name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //Ana Kategori ListView - F
                  //Pageview - S
                  //Şimdilik Placeholder kullanacağım
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(44, 44, 44, 1),
                    ),
                    height: 140,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          //itemCount: bannerPath.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index % bannerPath.length;
                            });
                          },
                          itemBuilder: (context, index) {
                            final realIndex = index % bannerPath.length;
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(bannerPath[realIndex]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 25,
                          right: 25,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withValues(alpha: 0.4),
                            ),
                            child: Text(
                              "${_currentPage + 1}/${bannerPath.length}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Pageview - F
                  //Item Kart Tasarım Listview - S
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(64, 64, 64, 1),
                    ),
                    height: 420,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Sepete Ekle, Güvenle Kapına Gelsin!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Tümünü Gör",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 355,
                          child: ListView.builder(
                            itemExtent: 200,
                            itemCount: horizontalItems.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: UrunKartTasarim(
                                  testItem: horizontalItems[index],
                                  onCartUpdated: onCartUpdated,
                                  onItemTap: navigateToItemDetail, // Eklendi
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Item Kart Tasarım Listview - F
                  //Ücretsiz Kargo Banner - S
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(
                          DataHelper.mainPageUcretsizKargoBanner,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  //Ücretsiz Kargo Banner - F
                  // GridView - S
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                      itemCount: gridItems.length,
                      itemBuilder: (context, index) {
                        return UrunKartTasarim(
                          testItem: gridItems[index],
                          onCartUpdated: onCartUpdated,
                          onItemTap: navigateToItemDetail, // Eklendi
                        );
                      },
                    ),
                  ),
                  //GridView - F

                  //2.Listview - S
                  Container(
                    padding: EdgeInsets.only(left: 14),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(64, 64, 64, 1),
                    ),
                    height: 420,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Öne Çıkan Ürünler",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 375,
                          child: ListView.builder(
                            itemExtent: 200,
                            itemCount: horizontalItems2.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: UrunKartTasarim(
                                  testItem: horizontalItems2[index],
                                  onCartUpdated: onCartUpdated,
                                  onItemTap: navigateToItemDetail, // Eklendi
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  //2.Listview - F
                  //Reklam - S
                  //Reklam - S
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 250,
                          width: 325,
                          child: Image.asset(
                            DataHelper.reklam1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Reklam - F
                  // GridView2 - S
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                      itemCount: gridItems2.length,
                      itemBuilder: (context, index) {
                        return UrunKartTasarim(
                          testItem: gridItems2[index],
                          onCartUpdated: onCartUpdated,
                          onItemTap: navigateToItemDetail, // Eklendi
                        );
                      },
                    ),
                  ),

                  //GridView2 - F
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}