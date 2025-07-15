import 'package:flutter/material.dart';

class SatPage extends StatefulWidget {
  const SatPage({super.key});

  @override
  State<SatPage> createState() => _SatPageState();
}

class _SatPageState extends State<SatPage> {
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
          "Fotoğraf",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        //Title - F

        //Actions - S
        actions: [
          Container(
            alignment: Alignment.center,
            height: 40,
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Color.fromRGBO(255, 63, 86, 1),
              ),
            ),
            child: Text(
              "1/6",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],

        actionsPadding: EdgeInsets.only(right: 12),
        //Actions - F
      ),
      //AppBar - F
      body: Column(
        children: [
          SizedBox(height: 20),

          //Fotoğraf Ekleme ListView - S
          Container(
            height: 150,
            color: Colors.black,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12, top: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                color: index == 0
                                    ? Color.fromRGBO(255, 63, 86, 1)
                                    : Color.fromRGBO(44, 44, 44, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: index == 0
                                  ? Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 32,
                                    )
                                  : null,
                            ),
                            SizedBox(height: 6),
                            if (index == 0)
                              Text(
                                "KAPAK",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //İpucu Text - S
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "İpucu: En az 1 fotoğraf ekle",
                    style: TextStyle(
                      color: Color.fromRGBO(180, 180, 180, 1),
                      fontSize: 14,
                    ),
                  ),
                ),

                //İpucu Text - F
              ],
            ),
          ),
          //Fotoğraf Ekleme ListView - F
          SizedBox(height: 16),
          Spacer(),
          //Kamera İkonu ve Yazılar - S
          Column(
            children: [
              //Kamera Frame İkonu - S
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    //Köşe işaretleri
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white, width: 4),
                            left: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white, width: 4),
                            right: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                            left: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                            right: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Ortadaki arama ikonu
                    Center(
                      child: Icon(
                        Icons.search,
                        color: Color.fromRGBO(255, 63, 86, 1),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),

              //Kamera Frame İkonu - F
              SizedBox(height: 30),

              //Başlık - S
              Text(
                "Ürün fotoğraflarını yükle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //Başlık - F
              SizedBox(height: 16),
              //Açıklama - S
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Hızlı ilan vermek için en az 1 fotoğraf\n yükleyin letgo AI sizin için otomatik\n kategori önerileri sunar.",
                  style: TextStyle(
                    color: Color.fromRGBO(121, 121, 121, 1),
                    fontSize: 14,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              //Açıklama - F
            ],
          ),

          //Kamera İkonu ve Yazılar - F
          Spacer(),

          //Devam Et Butonu - S
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Şimdilik boş
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(64, 64, 64, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Devam et",
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          //Devam Et Butonu - F
        ],
      ),
    );
  }
}
