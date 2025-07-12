import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';

class IlanlarimIlanlarimPage extends StatefulWidget {
  const IlanlarimIlanlarimPage({super.key});

  @override
  State<IlanlarimIlanlarimPage> createState() =>
      _IlanlarimIlanlarimPageState();
}

class _IlanlarimIlanlarimPageState extends State<IlanlarimIlanlarimPage> {
  List<LetGoItem> tumUrunler = DataHelper.getAllItems();
  List<LetGoItem> aktifUrunler = DataHelper.getActiveItems();
  List<LetGoItem> redUrunler = DataHelper.getRejectedItems();
  List<LetGoItem> satilanUrunler = DataHelper.getSoldItems();
  @override
  Widget build(BuildContext context) {
    //Deneme
    debugPrint("Tüm sayfa build oldu.");
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 44, 44, 1),
      body: Column(
        children: [
          //Arama çubuğu - S
          Container(
            color: Color.fromRGBO(44, 44, 44, 1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                height: 32,
                child: TextField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "İlanlar arasında ara...",
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
          //Filtreleme Butonları - S
          FilterButtonsWidget(),
          //Filtreleme Butonları - F
          //İlanlar + Öne Çıkar Reklamı - S
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                //Öne Çıkar Container - S
                OneCikarReklami(),
                //Öne Çıkar Container - F
                //Test Ürün Kart
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  height: 275,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 35, 35, 1),
                  ),
                  child: Column(
                    children: [
                      //Imageli Row - S
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Image - S
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(
                                10,
                              ),
                              child: Image.asset(
                                aktifUrunler[1].mainImage,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          //Image -F
                          //1 Column 3 Row - S
                          Column(
                            children: [
                              //price + durum kutucuğu - S
                              Row(
                                children: [
                                  Text(
                                    aktifUrunler[1].price.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              //price + durum kutucuğu - F
                              //title + forward iconu - S
                              
                              //title + forward iconu - F

                            ],
                          ),
                          //1 Column 3 Row - F
                        ],
                      ),
                      //Imageli Row - F
                    ],
                  ),
                ),
                //TT
              ],
            ),
          ),
          //İlanlar + Öne Çıkar Reklamı - S
        ],
      ),
    );
  }
}

class OneCikarReklami extends StatelessWidget {
  const OneCikarReklami({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            child: Image.asset(
              DataHelper.onecikarLogoPath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 10),
          //Text + Vitamin Nedir Buton - S
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: "Öne çıkar vitaminiyle ",
                  style: TextStyle(
                    color: Color.fromRGBO(228, 228, 228, 1),
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: "daha fazla ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "alıcıya ulaş!"),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                  minimumSize: Size(50, 25),
                ),
                onPressed: () {},
                child: Text(
                  "Vitamin Nedir?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
            //Text + Vitamin Nedir Buton - F
          ),
        ],
      ),
    );
  }
}

class FilterButtonsWidget extends StatefulWidget {
  const FilterButtonsWidget({super.key});
  @override
  State<FilterButtonsWidget> createState() => _FilterButtonsWidgetState();
}

class _FilterButtonsWidgetState extends State<FilterButtonsWidget> {
  //Seçili Filtreleme Butonu için değişken
  int selectedButtonIndex = 0;
  //Filtre Butonundan Callback
  void onFilterButtonPressed(int buttonsIndex) {
    setState(() {
      selectedButtonIndex = buttonsIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Deneme
    debugPrint("Filtreleme butonları build oldu.");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 60,
      decoration: BoxDecoration(color: Colors.black),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Tüm İlanlar",
            buttonsIndex: 0,
            onPressed: onFilterButtonPressed,
          ),
          FilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Etkin",
            buttonsIndex: 1,
            onPressed: onFilterButtonPressed,
          ),
          FilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Reddedildi",
            buttonsIndex: 2,
            onPressed: onFilterButtonPressed,
          ),
          FilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Satıldı",
            buttonsIndex: 3,
            onPressed: onFilterButtonPressed,
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String buttonTitle;
  final int buttonsIndex;
  final Function(int) onPressed;
  FilterButton({
    super.key,
    required this.selectedButtonIndex,
    required this.buttonTitle,
    required this.buttonsIndex,
    required this.onPressed,
  });

  int selectedButtonIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedButtonIndex == buttonsIndex
              ? Color.fromRGBO(255, 63, 86, 1)
              : Color.fromRGBO(44, 44, 44, 1),
        ),
        onPressed: () {
          onPressed(buttonsIndex);
        },
        child: Text(
          "$buttonTitle (4)",
          style: TextStyle(
            fontSize: selectedButtonIndex == buttonsIndex ? 13 : 11,
            color: Colors.white,
            fontWeight: selectedButtonIndex == buttonsIndex
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
