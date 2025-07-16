import 'package:flutter/material.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/widgets/urun_kart_widget.dart';

class GridPageViewWidget extends StatefulWidget {
  final List<LetGoItem> items;
  final double height;

  const GridPageViewWidget({
    super.key,
    required this.items,
    this.height = 400,
  });

  @override
  State<GridPageViewWidget> createState() => _GridPageViewWidgetState();
}

class _GridPageViewWidgetState extends State<GridPageViewWidget> {
  int _currentPage = 0;
  late PageController _pageController;

  //Toplam sayfa sayısı (2 item= 1 sayfa)
  int get totalPages => (widget.items.length / 2).ceil();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          //Ana PageView kısmı
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: totalPages,
              itemBuilder: (context, pageIndex) {
                //Her sayfada gösterilecek ürün indexleri, listeden random ürün fonksiyonu ekle.
                int firstItemIndex = pageIndex * 2;
                int secondItemIndex = firstItemIndex + 1;

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      //Sol ürün
                      Expanded(
                        child: UrunKartTasarim(
                          testItem: widget.items[firstItemIndex],
                        ),
                      ),

                      SizedBox(width: 10),

                      //Sağ ürün
                      Expanded(
                        child: secondItemIndex < widget.items.length
                            ? UrunKartTasarim(
                                testItem: widget.items[secondItemIndex],
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),

          //Alt boncuklar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 10 : 7,
                height: _currentPage == index ? 10 : 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? Color.fromRGBO(255, 63, 86, 1)
                      : Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}
