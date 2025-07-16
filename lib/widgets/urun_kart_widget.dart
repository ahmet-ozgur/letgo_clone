import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/views/item_detail_page.dart';

class UrunKartTasarim extends StatefulWidget {
  const UrunKartTasarim({
    super.key,
    required this.testItem,
    this.onCartUpdated,
    this.onItemTap,
  });
  final LetGoItem testItem;
  final VoidCallback? onCartUpdated;
  final Function(LetGoItem)? onItemTap;

  @override
  State<UrunKartTasarim> createState() => _UrunKartTasarimState();
}

class _UrunKartTasarimState extends State<UrunKartTasarim> {
  @override
  Widget build(BuildContext context) {
    bool isInCart = DataHelper.isItemInCart(widget.testItem.id);
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Üst Container - S
          GestureDetector(
            onTap: () {
              // Eski navigation kodu yerine callback çağırıyoruz
              if (widget.onItemTap != null) {
                widget.onItemTap!(widget.testItem);
              } else {
                // Fallback: Eğer callback verilmemişse eski yöntem
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemDetailPage(urun: widget.testItem);
                    },
                  ),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 225,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.testItem.mainImage),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  //Üst Row - Öne Çıkan + Favori - S
                  Row(
                    children: [
                      //Sol Öne Çıkan Badge - S
                      Visibility(
                        visible: widget.testItem.isFeatured,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: widget.testItem.isFeatured
                                ? Color.fromRGBO(254, 218, 46, 1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.flash_on,
                                color: widget.testItem.isFeatured
                                    ? Colors.black
                                    : Colors.transparent,
                                size: 10,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "Öne Çıkan",
                                style: TextStyle(
                                  color: widget.testItem.isFeatured
                                      ? Colors.black
                                      : Colors.transparent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Sol Öne Çıkan Badge - F
                      Spacer(),
                      //Sağ Favori İkonu - S
                      GestureDetector(
                        onTap: () {
                          bool wasAdded = DataHelper.toggleFavorite(
                            widget.testItem,
                          );
                          setState(() {}); // UI'ı güncelle
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.6),
                          radius: 15,
                          child: Icon(
                            DataHelper.isItemInFavorites(
                                  widget.testItem.id,
                                )
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                DataHelper.isItemInFavorites(
                                  widget.testItem.id,
                                )
                                ? Colors.red
                                : Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      //Sağ Favori İkonu - F
                    ],
                  ),
                  //Üst Row - Öne Çıkan + Favori - F
                  Spacer(),
                  //Alt Row - Badge'ler - S
                  Row(
                    children: [
                      //Cüzdanım Güvende - S
                      Expanded(
                        child: Visibility(
                          visible: widget.testItem.isWalletSafe,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: widget.testItem.isWalletSafe
                                  ? Colors.black.withOpacity(0.7)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.verified_user,
                                  color: widget.testItem.isWalletSafe
                                      ? Colors.green
                                      : Colors.transparent,
                                  size: 10,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "Cüzdanım Güvende",
                                  style: TextStyle(
                                    color: widget.testItem.isWalletSafe
                                        ? Colors.white
                                        : Colors.transparent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Cüzdanım Güvende - F
                      SizedBox(width: 5),
                      //Ücretsiz Kargo - S
                      Expanded(
                        child: Visibility(
                          visible: widget.testItem.hasFreeShipping,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: widget.testItem.hasFreeShipping
                                  ? Colors.black.withOpacity(0.7)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.local_shipping,
                                  color: widget.testItem.hasFreeShipping
                                      ? Color.fromRGBO(21, 104, 232, 1)
                                      : Colors.transparent,
                                  size: 10,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "Ücretsiz Kargo",
                                  style: TextStyle(
                                    color: widget.testItem.hasFreeShipping
                                        ? Colors.white
                                        : Colors.transparent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Ücretsiz Kargo - F
                    ],
                  ),
                  //Alt Row - Badge'ler - F
                ],
              ),
            ),
          ),
          //Üst Container - F

          //Alt Container - S
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 6,
                bottom: 10,
                left: 6,
                right: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Fiyat - S
                  Text(
                    "${widget.testItem.price.toString()} TL",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  //Fiyat - F
                  //Title - S
                  Text(
                    widget.testItem.title,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  //Title - F
                  Spacer(),
                  //Sepete Ekle Butonu - S
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                      ),
                      onPressed: () {
                        bool wasNewItem = DataHelper.addToCart(
                          widget.testItem,
                        );
                        if (widget.onCartUpdated != null) {
                          widget.onCartUpdated!();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_basket,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Sepete Ekle",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Sepete Ekle Butonu - F
                ],
              ),
            ),
          ),
          //Alt Container - F
        ],
      ),
    );
  }
}