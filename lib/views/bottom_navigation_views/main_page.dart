import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/main_category.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/views/cart_page.dart';
import 'package:letgo_clone/views/category_page.dart';
import 'package:letgo_clone/views/item_detail_page.dart';
import 'package:letgo_clone/widgets/urun_kart_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //Kategori Listesi - S
  List<MainCategory> categoryList = DataHelper.allCategoryList;
  //Pageview Banner Listesi - S
  List<String> bannerPath = DataHelper.bannerPath;
  //Pageview Banner Listesi - F
  //Pageview Sayfası
  int _currentPage = 0;
  //Ürünler deneme listesi
  List<LetGoItem> testItems = DataHelper.getActiveItems();
  void onCartUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      //AppBar - S
      appBar: AppBar(
        //Leading Letgo Logo - S
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Image.asset(DataHelper.anaLogoPath, fit: BoxFit.contain),
        ),
        leadingWidth: 74.w,
        //Leading Letgo Logo - F
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        //Title Container - S
        title: Container(
          width: 180.w,
          height: 40.h,
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
                size: 20.sp,
              ),
              SizedBox(width: 6.w),
              //Text
              Text(
                "İstanbul, Bakırköy",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 6.w),
              //Icon 2
              Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromRGBO(255, 58, 99, 1),
                size: 20.sp,
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
                    size: 22.sp,
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
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
            child: Icon(
              Icons.notifications,
              size: 22.sp,
              color: Colors.white,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 12.w),
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
                horizontal: 15.w,
                vertical: 10.h,
              ),
              child: SizedBox(
                height: 36.h,
                child: TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText:
                        "Araba, telefon, bisiklet ve daha fazlası...",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(220, 220, 220, 1),
                      fontSize: 12.sp,
                    ),
                    fillColor: Color.fromRGBO(64, 64, 64, 1),
                    filled: true,
                    //Prefix Iconu var + hintText var + Radius + bg color
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(220, 220, 220, 1),
                      size: 24.sp,
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
                            horizontal: 8.w,
                            vertical: 8.h,
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
                                  radius: 20.r,
                                  backgroundColor:
                                      categoryList[index].backgroundColor,
                                  child: Icon(
                                    categoryList[index].icon,
                                    color: Colors.white,
                                    size: 24.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    "${categoryList[index].name}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
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
                  //Şimdilik Placeholder kullan.
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(44, 44, 44, 1),
                    ),
                    height: 140.h,
                    child: Stack(
                      children: [
                        PageView.builder(
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          itemCount: bannerPath.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 15.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(bannerPath[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 25.h,
                          right: 25.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                              horizontal: 10.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black.withValues(alpha: 0.4),
                            ),
                            child: Text(
                              "${_currentPage + 1}/${bannerPath.length}",
                              style: TextStyle(
                                fontSize: 14.sp,
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
                    padding: EdgeInsets.only(left: 14.w),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(64, 64, 64, 1),
                    ),
                    height: 420.h,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            children: [
                              Text(
                                "Sepete Ekle, Güvenle Kapına Gelsin!",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.white70,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 5.h,
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
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 375.h,
                          child: ListView.builder(
                            itemExtent: 200,
                            itemCount: testItems.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: UrunKartTasarim(
                                  testItem: testItems[index],
                                  onCartUpdated: onCartUpdated,
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
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    width: double.infinity.w,
                    height: 100.h,
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
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 15.h,
                          ),
                      itemCount: testItems.length,
                      itemBuilder: (context, index) {
                        return UrunKartTasarim(
                          testItem: testItems[index],
                          onCartUpdated: onCartUpdated,
                        );
                      },
                    ),
                  ),
                  //GridView - F
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
