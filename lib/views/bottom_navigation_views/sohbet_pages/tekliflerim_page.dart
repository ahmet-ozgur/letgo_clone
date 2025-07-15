import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';

class TekliflerimPage extends StatefulWidget {
  const TekliflerimPage({super.key});

  @override
  State<TekliflerimPage> createState() => _TekliflerimPageState();
}

class _TekliflerimPageState extends State<TekliflerimPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Kalan Teklif Hakkı Container - S
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(color: Color.fromRGBO(44, 44, 44, 1)),
          child: Row(
            children: [
              Icon(Icons.info, size: 20, color: Colors.white),
              SizedBox(width: 5),
              Text(
                "Kalan günlük teklif hakkın: ",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                "37/40",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        //Kalan Teklif Hakkı Container - F
        //Filtreleme Butonları - S
        OffersFilterButtonsWidget(),
        //Filtreleme Butonları - F
        //Teklif Ürün Kart Tasarımı - S
        Expanded(
          child: ListView(
            children: [
              TeklifUrunKart(urun: DataHelper.allItems[3]),
              TeklifUrunKart(urun: DataHelper.allItems[5]),
              TeklifUrunKart(urun: DataHelper.allItems[7]),
              TeklifUrunKart(urun: DataHelper.allItems[9]),
            ],
          ),
        ),

        //Teklif Ürün Kart Tasarımı - F
      ],
    );
  }
}

class TeklifUrunKart extends StatelessWidget {
  final LetGoItem urun;
  const TeklifUrunKart({super.key, required this.urun});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Column(
              children: [
                //Title + Icon Row - S
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${urun.title}",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color.fromRGBO(255, 63, 86, 1),
                      size: 30,
                    ),
                  ],
                ),
                //Title + Icon Row - F
                Divider(color: Colors.white10),
                //Row(Image+Column) - S
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 140,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(8),
                        child: Image.asset(
                          DataHelper.allItems[5].mainImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "Ürün Fiyatı:",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Teklif Edilen Fiyat:",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Durum:",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    //Fiyatlar Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "${urun.price} TL",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${(urun.price) * 0.9} TL",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.access_alarm_rounded,
                              color: Colors.white70,
                              size: 22,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Cevap Bekliyor",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //Row(Image+Column) - F
                SizedBox(height: 15),
                //Satıcı Cevap Verme Süresi - S
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.hourglass_bottom,
                        color: Color.fromRGBO(33, 195, 244, 1),
                        size: 22,
                      ),
                      Text(
                        "Satıcının cevap vermesi için kalan süre: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "23 saat 59 dakika",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //Satıcı Cevap Verme Süresi - F
                SizedBox(height: 10),
                //Butonlar Row - S
                SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(
                              color: Color.fromRGBO(255, 63, 86, 1),
                              width: 2,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Teklifi Düzenle",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 63, 86, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(
                              255,
                              63,
                              86,
                              1,
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Hemen Al",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Butonlar Row - F
              ],
            ),
          ),
          Divider(color: Colors.white10, height: 30),
        ],
      ),
    );
  }
}

class OffersFilterButtonsWidget extends StatefulWidget {
  const OffersFilterButtonsWidget({super.key});

  @override
  State<OffersFilterButtonsWidget> createState() =>
      _OffersFilterButtonsWidgetState();
}

class _OffersFilterButtonsWidgetState
    extends State<OffersFilterButtonsWidget> {
  // Seçili Filtreleme Butonu için değişken
  int selectedButtonIndex = 0;

  // Filtre Butonundan Callback
  void onFilterButtonPressed(int buttonsIndex) {
    setState(() {
      selectedButtonIndex = buttonsIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Deneme
    debugPrint("Tekliflerim filtreleme butonları build oldu.");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 60,
      decoration: BoxDecoration(color: Colors.black),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          OffersFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Filtrele",
            buttonsIndex: 0,
            onPressed: onFilterButtonPressed,
          ),
          OffersFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Alıcıyım",
            buttonsIndex: 1,
            onPressed: onFilterButtonPressed,
          ),
          OffersFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Satıcıyım",
            buttonsIndex: 2,
            onPressed: onFilterButtonPressed,
          ),
        ],
      ),
    );
  }
}

class OffersFilterButton extends StatelessWidget {
  final String buttonTitle;
  final int buttonsIndex;
  final Function(int) onPressed;
  final int selectedButtonIndex;

  const OffersFilterButton({
    super.key,
    required this.selectedButtonIndex,
    required this.buttonTitle,
    required this.buttonsIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedButtonIndex == buttonsIndex;
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 15),
          backgroundColor: isSelected
              ? Color.fromRGBO(255, 63, 86, 1)
              : Color.fromRGBO(44, 44, 44, 1),
        ),
        onPressed: () {
          onPressed(buttonsIndex);
        },
        child: buttonsIndex == 0
            ? Row(
                children: [
                  Icon(
                    Icons.filter_alt_rounded,
                    size: 22,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    buttonTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              )
            : Text(
                buttonTitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
      ),
    );
  }
}
