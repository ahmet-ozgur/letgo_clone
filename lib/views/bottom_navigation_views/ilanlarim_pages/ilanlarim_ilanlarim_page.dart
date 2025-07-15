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
                EtkinIlanKart(aktifUrunler: aktifUrunler, index: 1),
                SatildiIlanKart(satilanUrunler: satilanUrunler, index: 0),
                RedIlanKart(redUrunler: redUrunler, index: 0),
              ],
            ),
          ),
          //İlanlar + Öne Çıkar Reklamı - S
        ],
      ),
    );
  }
}

class RedIlanKart extends StatelessWidget {
  const RedIlanKart({
    super.key,
    required this.redUrunler,
    required this.index,
  });
  final List<LetGoItem> redUrunler;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 260,
      decoration: BoxDecoration(color: Color.fromRGBO(35, 35, 35, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Imageli Row - S
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image - S
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(
                      redUrunler[index].mainImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                //Image -F
                //1 Column 3 Row - S
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //price + durum kutucuğu - S
                      Row(
                        children: [
                          Text(
                            redUrunler[index].price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          //Duruma Göre Değişken Kutucuk - S
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: redUrunler[index].statusColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              redUrunler[index].statusText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                              ),
                            ),
                          ),
                          //Duruma Göre Değişken Kutucuk - F
                        ],
                      ),
                      //price + durum kutucuğu - F
                      //title + forward iconu - S
                      Row(
                        children: [
                          Text(
                            redUrunler[index].title,
                            style: TextStyle(
                              color: Color.fromRGBO(209, 209, 209, 1),
                              fontSize: 10.5,
                            ),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Color.fromRGBO(255, 63, 86, 1),
                            ),
                          ),
                        ],
                      ),
                      //title + forward iconu - F

                      //Görülme + Like Sayaçları - S
                      Row(
                        children: [
                          ViewCountDesign(myItem: redUrunler[index]),
                          SizedBox(width: 10),
                          LikeCountDesign(myItem: redUrunler[index]),
                        ],
                      ),
                      //Görülme + Like Sayaçları - F
                    ],
                  ),
                ),
                //1 Column 3 Row - F
              ],
            ),
          ),
          //Imageli Row - F
          SizedBox(height: 5),
          //Yayın Bitiş Tarihi + Ayar Iconu - S
          Row(
            children: [
              Text(
                "Yayın & Bitiş Tarihi: ",
                style: TextStyle(fontSize: 10, color: Colors.white70),
              ),
              Text(
                "${redUrunler[index].publishDate.day}/${redUrunler[index].publishDate.month}/${redUrunler[index].publishDate.year} - ${redUrunler[index].publishDate.add(Duration(days: 30)).day}/${redUrunler[index].publishDate.add(Duration(days: 30)).month}/${redUrunler[index].publishDate.add(Duration(days: 30)).year}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                child: Icon(
                  Icons.more_vert,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          //Yayın Bitiş Tarihi + Ayar Iconu - F
          SizedBox(height: 7),
          //Bu ilan yayınlanmadı. - S
          Container(
            height: 25,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.info,
                  color: Color.fromRGBO(166, 166, 166, 1),
                  size: 18,
                ),
                SizedBox(width: 5),
                Text(
                  "Bu ilan yayınlanmadı.",
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Yeniden düzenle ve yayınla",
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Color.fromRGBO(175, 175, 175, 1),
                  ),
                ),
              ],
            ),
          ),
          //Bu ilan yayınlanmadı. - F
          SizedBox(height: 7),
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: SizedBox()),
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
                      "Şimdi Düzenle",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 63, 86, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SatildiIlanKart extends StatelessWidget {
  const SatildiIlanKart({
    super.key,
    required this.satilanUrunler,
    required this.index,
  });
  final List<LetGoItem> satilanUrunler;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 260,
      decoration: BoxDecoration(color: Color.fromRGBO(35, 35, 35, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Imageli Row - S
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image - S
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(
                      satilanUrunler[index].mainImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                //Image -F
                //1 Column 3 Row - S
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //price + durum kutucuğu - S
                      Row(
                        children: [
                          Text(
                            satilanUrunler[index].price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          //Duruma Göre Değişken Kutucuk - S
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: satilanUrunler[index].statusColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              satilanUrunler[index].statusText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                              ),
                            ),
                          ),
                          //Duruma Göre Değişken Kutucuk - F
                        ],
                      ),
                      //price + durum kutucuğu - F
                      //title + forward iconu - S
                      Row(
                        children: [
                          Text(
                            satilanUrunler[index].title,
                            style: TextStyle(
                              color: Color.fromRGBO(209, 209, 209, 1),
                              fontSize: 10.5,
                            ),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Color.fromRGBO(255, 63, 86, 1),
                            ),
                          ),
                        ],
                      ),
                      //title + forward iconu - F

                      //Görülme + Like Sayaçları - S
                      Row(
                        children: [
                          ViewCountDesign(myItem: satilanUrunler[index]),
                          SizedBox(width: 10),
                          LikeCountDesign(myItem: satilanUrunler[index]),
                        ],
                      ),
                      //Görülme + Like Sayaçları - F
                    ],
                  ),
                ),
                //1 Column 3 Row - F
              ],
            ),
          ),
          //Imageli Row - F
          SizedBox(height: 5),
          //Yayın Bitiş Tarihi + Ayar Iconu - S
          Row(
            children: [
              Text(
                "Yayın & Bitiş Tarihi: ",
                style: TextStyle(fontSize: 10, color: Colors.white70),
              ),
              Text(
                "${satilanUrunler[index].publishDate.day}/${satilanUrunler[index].publishDate.month}/${satilanUrunler[index].publishDate.year} - ${satilanUrunler[index].publishDate.add(Duration(days: 30)).day}/${satilanUrunler[index].publishDate.add(Duration(days: 30)).month}/${satilanUrunler[index].publishDate.add(Duration(days: 30)).year}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                child: Icon(
                  Icons.more_vert,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          //Yayın Bitiş Tarihi + Ayar Iconu - F
          SizedBox(height: 5),
          SizedBox(
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: SizedBox()),
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
                      "İlanı kaldır",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 63, 86, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EtkinIlanKart extends StatelessWidget {
  const EtkinIlanKart({
    super.key,
    required this.aktifUrunler,
    required this.index,
  });
  final int index;
  final List<LetGoItem> aktifUrunler;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 260,
      decoration: BoxDecoration(color: Color.fromRGBO(35, 35, 35, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Imageli Row - S
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image - S
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(
                      aktifUrunler[index].mainImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                //Image -F
                //1 Column 3 Row - S
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //price + durum kutucuğu - S
                      Row(
                        children: [
                          Text(
                            aktifUrunler[index].price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          //Duruma Göre Değişken Kutucuk - S
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: aktifUrunler[index].statusColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              aktifUrunler[index].statusText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.5,
                              ),
                            ),
                          ),
                          //Duruma Göre Değişken Kutucuk - F
                        ],
                      ),
                      //price + durum kutucuğu - F
                      //title + forward iconu - S
                      Row(
                        children: [
                          Text(
                            aktifUrunler[index].title,
                            style: TextStyle(
                              color: Color.fromRGBO(209, 209, 209, 1),
                              fontSize: 10.5,
                            ),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Color.fromRGBO(255, 63, 86, 1),
                            ),
                          ),
                        ],
                      ),
                      //title + forward iconu - F

                      //Görülme + Like Sayaçları - S
                      Row(
                        children: [
                          ViewCountDesign(myItem: aktifUrunler[index]),
                          SizedBox(width: 10),
                          LikeCountDesign(myItem: aktifUrunler[index]),
                        ],
                      ),
                      //Görülme + Like Sayaçları - F
                    ],
                  ),
                ),
                //1 Column 3 Row - F
              ],
            ),
          ),
          //Imageli Row - F
          SizedBox(height: 5),
          //Yayın Bitiş Tarihi + Ayar Iconu - S
          Row(
            children: [
              Text(
                "Yayın & Bitiş Tarihi: ",
                style: TextStyle(fontSize: 10, color: Colors.white70),
              ),
              Text(
                "${aktifUrunler[index].publishDate.day}/${aktifUrunler[index].publishDate.month}/${aktifUrunler[index].publishDate.year} - ${aktifUrunler[index].publishDate.add(Duration(days: 30)).day}/${aktifUrunler[index].publishDate.add(Duration(days: 30)).month}/${aktifUrunler[index].publishDate.add(Duration(days: 30)).year}",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 16,
                backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                child: Icon(
                  Icons.more_vert,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          //Yayın Bitiş Tarihi + Ayar Iconu - F
          SizedBox(height: 5),
          //Satıldı İşaretle ve Daha Hızlı Sat Butonu - S
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
                      "Satıldı İşaretle",
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
                      backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.electric_bolt,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Daha Hızlı Sat",
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
          //Satıldı İşaretle ve Daha Hızlı Sat Butonu - F
          SizedBox(height: 5),
          //Cüzdanım Güvende ile Sat - S
          SizedBox(
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Cüzdanım Güvende ile Sat",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Cüzdanım Güvende ile Sat - F
        ],
      ),
    );
  }
}

class LikeCountDesign extends StatelessWidget {
  const LikeCountDesign({super.key, required this.myItem});
  final LetGoItem myItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(44, 44, 44, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            color: Color.fromRGBO(255, 63, 86, 1),
            size: 18,
          ),
          SizedBox(width: 5),
          Text(
            "${myItem.likeCount}",
            style: TextStyle(color: Color.fromRGBO(207, 207, 207, 1)),
          ),
        ],
      ),
    );
  }
}

class ViewCountDesign extends StatelessWidget {
  const ViewCountDesign({super.key, required this.myItem});
  final LetGoItem myItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(44, 44, 44, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.visibility,
            color: Color.fromRGBO(255, 63, 86, 1),
            size: 18,
          ),
          SizedBox(width: 5),
          Text(
            "${myItem.viewCount}",
            style: TextStyle(color: Color.fromRGBO(207, 207, 207, 1)),
          ),
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
