import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/main_category.dart';
import 'package:letgo_clone/views/cart_page.dart';
import 'package:letgo_clone/widgets/urun_kart_widget.dart';

class CategoryPage extends StatefulWidget {
  final MainCategory category;

  const CategoryPage({super.key, required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<LetGoItem> categoryItems = [];

  @override
  void initState() {
    super.initState();
    //Kategoriye göre ürünleri al
    categoryItems = DataHelper.getItemsByCategory(widget.category);
  }

  void onCartUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      //AppBar - S
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
        automaticallyImplyLeading: false,
        //Leading Icon - S
        leadingWidth: 40,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(66, 66, 66, 1),
              ),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
            ),
          ),
        ),
        //Leading Icon - F
        //Title - S
        title: Text(
          widget.category.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        centerTitle: true,
        //Title - F
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
        ],
        actionsPadding: EdgeInsets.only(right: 12),
        //Actions - F
        //Alt çizgi
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color.fromRGBO(27, 27, 27, 1),
            height: 2,
          ),
        ),
      ),
      //AppBar - F

      //Body - S
      body: categoryItems.isEmpty
          ? _buildEmptyCategory()
          : Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  //Kategori Info - S
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(44, 44, 44, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: widget.category.backgroundColor,
                          child: Icon(
                            widget.category.icon,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.category.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${categoryItems.length} ürün bulundu",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.tune, color: Colors.white70, size: 24),
                      ],
                    ),
                  ),
                  //Kategori Info - F
                  SizedBox(height: 15),
                  //GridView - S
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                      itemCount: categoryItems.length,
                      itemBuilder: (context, index) {
                        return UrunKartTasarim(
                          testItem: categoryItems[index],
                          onCartUpdated: onCartUpdated,
                        );
                      },
                    ),
                  ),
                  //GridView - F
                ],
              ),
            ),
      //Body - F
    );
  }

  //Boş Kategori Widget - S
  Widget _buildEmptyCategory() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromRGBO(44, 44, 44, 1),
              child: Icon(
                widget.category.icon,
                size: 40,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Bu kategoride henüz ürün yok",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "${widget.category.name} kategorisinde\nhenüz aktif ürün bulunmuyor",
              style: TextStyle(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Diğer Kategorileri Gör",
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
    );
  }
  //Boş Kategori Widget - F
}
