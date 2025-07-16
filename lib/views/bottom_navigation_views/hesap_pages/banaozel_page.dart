import 'package:flutter/material.dart';

class BanaozelPage extends StatelessWidget {
  const BanaozelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //İşlemlerim Text - S
            Text(
              "İşlemlerim",
              style: TextStyle(
                color: Color.fromRGBO(135, 135, 135, 1),
                fontSize: 11,
              ),
            ),
            //İşlemlerim Text - F

            //Kartlar x 6 - S
            EklentisizKartTasarim(
              myIcon: Icons.shopping_bag,
              myTitle: "Aldıklarım & Sattıklarım",
            ),
            EklentisizKartTasarim(
              myIcon: Icons.money,
              myTitle: "Tekliflerim",
            ),
            EklentisizKartTasarim(
              myIcon: Icons.wallet,
              myTitle: "letgo Kazancım",
            ),
            EklentiliKartTasarim1(
              myIcon: Icons.verified_user,
              myTitle: "Satıcı Doğrulama",
            ),
            EklentiliKartTasarim2(
              myIcon: Icons.star,
              myTitle: "Satıcı Değerlendirmeleri",
            ),
            EklentisizKartTasarim(
              myIcon: Icons.star,
              myTitle: "Alıcı Değerlendirmeleri",
            ),
            //Kartlar x 6 - F

            //İlan & Görünürlük Text - S
            Text(
              "İlan & Görünürlük",
              style: TextStyle(
                color: Color.fromRGBO(135, 135, 135, 1),
                fontSize: 11,
              ),
            ),
            //İlan & Görünürlük Text - F

            //Kartlar x 2 - S
            EklentisizKartTasarim(
              myIcon: Icons.discount,
              myTitle: "Kuponlarım",
            ),
            EklentisizKartTasarim(
              myIcon: Icons.bolt,
              myTitle: "Vitaminler",
            ),
            //Kartlar x 2 - F

            //Favoriler & Takipler Text - S
            Text(
              "Favoriler & Takipler",
              style: TextStyle(
                color: Color.fromRGBO(135, 135, 135, 1),
                fontSize: 11,
              ),
            ),
            //Favoriler & Takipler Text - F

            //Kartlar x 2 - S
            EklentisizKartTasarim(
              myIcon: Icons.favorite,
              myTitle: "Favorilerim",
            ),
            EklentisizKartTasarim(
              myIcon: Icons.person_add_alt,
              myTitle: "Ağım",
            ),
            //Kartlar x 2 - F

            //Bize Ulaşın Text - S
            Text(
              "Bize Ulaşın",
              style: TextStyle(
                color: Color.fromRGBO(135, 135, 135, 1),
                fontSize: 11,
              ),
            ),
            //Bize Ulaşın Text -

            //Kart x 1 - S
            EklentisizKartTasarim(
              myIcon: Icons.support_agent,
              myTitle: "Yardım ve Destek",
            ),
            //Kart x 1 - F
          ],
        ),
      ),
    );
  }
}

class EklentisizKartTasarim extends StatelessWidget {
  final IconData myIcon;
  final String myTitle;
  const EklentisizKartTasarim({
    super.key,
    required this.myIcon,
    required this.myTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 17),
          //Leading Icon - S
          Icon(myIcon, color: Colors.white),
          //Leading Icon - F
          SizedBox(width: 15),
          //Title - S
          Text(
            myTitle,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          //Title - F
          Spacer(),
          //Trailing Icon - S
          Icon(Icons.keyboard_arrow_right, color: Colors.white),
          //Trailing Icon - F
          SizedBox(width: 17),
        ],
      ),
    );
  }
}

class EklentiliKartTasarim1 extends StatelessWidget {
  //Minik Kart Listtile Tasarımlı
  final IconData myIcon;
  final String myTitle;
  const EklentiliKartTasarim1({
    super.key,
    required this.myIcon,
    required this.myTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 17),
          //Leading Icon - S
          Icon(myIcon, color: Colors.white),
          //Leading Icon - F
          SizedBox(width: 15),
          //Title - S
          Text(
            myTitle,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          //Title - F
          Spacer(),
          //Ekstra - S
          Container(
            height: 24,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 217, 40, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.warning, size: 14, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  "3 adım kaldı",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          //Ekstra - F
          SizedBox(width: 8),
          //Trailing Icon - S
          Icon(Icons.keyboard_arrow_right, color: Colors.white),
          //Trailing Icon - F
          SizedBox(width: 17),
        ],
      ),
    );
  }
}

class EklentiliKartTasarim2 extends StatelessWidget {
  //Minik Kart Listtile Tasarımlı
  final IconData myIcon;
  final String myTitle;
  const EklentiliKartTasarim2({
    super.key,
    required this.myIcon,
    required this.myTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 17),
          //Leading Icon - S
          Icon(myIcon, color: Colors.white),
          //Leading Icon - F
          SizedBox(width: 15),
          //Title - S
          Text(
            myTitle,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          //Title - F
          Spacer(),
          //Ekstra - S
          Container(
            height: 24,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromRGBO(52, 127, 254, 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Yeni",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          //Ekstra - F
          SizedBox(width: 8),
          //Trailing Icon - S
          Icon(Icons.keyboard_arrow_right, color: Colors.white),
          //Trailing Icon - F
          SizedBox(width: 17),
        ],
      ),
    );
  }
}
