import 'package:flutter/material.dart';

class ProfilimPage extends StatelessWidget {
  const ProfilimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      body: ListView(
        children: [
          //Üst Büyük Container - S
          Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 215,
            decoration: BoxDecoration(
              color: Color.fromRGBO(64, 64, 64, 1),
              borderRadius: BorderRadius.circular(12),
            ),

            //Ana Column - S
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //İlk Row - S
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      backgroundImage: AssetImage(
                        "assets/images/mypp.jpg",
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Ahmet Özgür",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Spacer(),
                    //Düzenle minik container - S
                    Container(
                      width: 85,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(35, 35, 35, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, color: Colors.white, size: 10),
                          SizedBox(width: 5),
                          Text(
                            "Düzenle",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Düzenle minik container - F
                  ],
                ),
                //ilk Row - F
                SizedBox(height: 15),
                //İkinci Row - S
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DegerlendirmeTakipTakipciContainer(
                      alan: "Değerlendirme",
                      deger: 0,
                    ),
                    DegerlendirmeTakipTakipciContainer(
                      alan: "Takip",
                      deger: 0,
                    ),
                    DegerlendirmeTakipTakipciContainer(
                      alan: "Takipçi",
                      deger: 0,
                    ),
                  ],
                ),
                //İkinci Row - F
                SizedBox(height: 15),
                //Text - S
                Text(
                  "İstanbul Esenyurt Haramidere tarafındayım, elden teslim alabilirsiniz.",
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
                //Text - F
                SizedBox(height: 10),
                //Son Row - S
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Sol Container - S
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 20,
                      ),
                      width: 188,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                            child: Icon(
                              Icons.timer_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Üyelik süresi",
                                style: TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                "5 yıl 11 ay 14 gün",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Sol Container - F

                    //Sağ Container - S
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      width: 188,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Doğrulama bilgileri",
                            style: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 1),
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 3),
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  "assets/images/faceicon.png",
                                ),
                              ),
                              SizedBox(width: 15),
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  "assets/images/googleicon.png",
                                ),
                              ),
                              SizedBox(width: 15),
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  "assets/images/phoneicon.png",
                                ),
                              ),
                              SizedBox(width: 15),
                              CircleAvatar(
                                radius: 11,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  "assets/images/mailicon.png",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Sağ Container - F
                  ],
                ),

                //Son Row - F
              ],
            ),

            //Ana Colum - F
          ),
          //Üst Büyük Container - F

          //Kartlar - S
          CiftSatirKart(),
          TekSatirKart(title: "Şifremi değiştir"),
          TekSatirKart(title: "Teslimat & Fatura Adreslerim"),
          TekSatirKart(title: "Hesap Ayarları & Gizlilik"),
          TekSatirKart(title: "Bildirimler"),
          TekSatirKart(title: "İletişim Tercihleri"),
          TekSatirKart(title: "Çıkış Yap"),
          //Kartlar - F
        ],
      ),
    );
  }
}

class DegerlendirmeTakipTakipciContainer extends StatelessWidget {
  final int deger;
  final String alan;
  const DegerlendirmeTakipTakipciContainer({
    required this.alan,
    required this.deger,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 35,
      decoration: BoxDecoration(
        color: Color.fromRGBO(44, 44, 44, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$deger",
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            alan,
            style: TextStyle(
              color: Color.fromRGBO(151, 151, 151, 1),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class CiftSatirKart extends StatelessWidget {
  const CiftSatirKart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tema Seçimi",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "Sistem tercihini kullan",
                style: TextStyle(
                  color: Color.fromRGBO(225, 74, 103, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

class TekSatirKart extends StatelessWidget {
  final String title;
  const TekSatirKart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 12)),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
