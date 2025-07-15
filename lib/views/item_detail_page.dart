import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/widgets/grid_pageview_widget.dart';

class ItemDetailPage extends StatefulWidget {
  final LetGoItem urun;
  const ItemDetailPage({super.key, required this.urun});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int _currentPage = 0;
  //Açıklamayı daha az göster/ daha fazla göster
  bool _isExpanded = false;
  // Tam metin
  String get fullText => widget.urun.description;
  // Kısa metin (ilk 100 karakter)
  String get shortText =>
      fullText.length > 100 ? fullText.substring(0, 100) : fullText;
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
            child: InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade800,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        //Leading Icon - F

        //Title - S
        title: Text(
          widget.urun.title,
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
          CircleAvatar(
            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
            child: Icon(Icons.favorite, size: 22, color: Colors.white),
          ),
          SizedBox(width: 12),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
            child: Icon(
              Icons.notifications,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 12),

        //Actions - F
      ),
      //AppBar - F
      //Body -S
      body: ListView(
        children: [
          //Pageview - S
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(44, 44, 44, 1),
            ),
            height: 450,
            child: Stack(
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  itemCount: widget.urun.imagePaths.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.urun.imagePaths[index]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),

                // Sol üst - Öne Çıkan - S
                Positioned(
                  top: 20,
                  left: 15,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(254, 218, 46, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.flash_on,
                          color: Colors.black,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Öne Çıkan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Sol üst - Öne Çıkan - F

                // Sağ üst - Favorite İkonu - S
                Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                    child: Icon(
                      Icons.favorite_border,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Sağ üst - Favorite İkonu - F

                // Sol alt - Cüzdanım Güvende + Ücretsiz Kargo - S
                Positioned(
                  bottom: 65,
                  left: 15,
                  right: 15,
                  child: Row(
                    children: [
                      // Cüzdanım Güvende - S
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: Colors.green,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Cüzdanım Güvende",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Cüzdanım Güvende - F
                      SizedBox(width: 20),
                      // Ücretsiz Kargo - S
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_shipping,
                                color: Color.fromRGBO(21, 104, 232, 1),
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Ücretsiz Kargo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Ücretsiz Kargo - F
                    ],
                  ),
                ),
                // Sol alt - Cüzdanım Güvende + Ücretsiz Kargo - F

                // Alt Ortada - Sayfa göstergeleri - S
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withValues(alpha: 0.4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // Bu da önemli!
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.urun.imagePaths.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Colors.red
                                  : Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Alt Ortada - Sayfa göstergeleri - F

                // Sağ alt - Sayfa sayısı küçük container - S
                Positioned(
                  bottom: 30,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                    child: Text(
                      "${_currentPage + 1}/${widget.urun.imagePaths.length}",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
                // Sağ alt - Sayfa sayısı küçük container - F
              ],
            ),
          ),
          //Pageview - F
          //transform translate Satıcı Kartına kadar -S
          Transform.translate(
            offset: Offset(0, -25),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(35, 35, 35, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Fiyat + 12 aya varan taksit container - S
                  Row(
                    children: [
                      Text(
                        "${widget.urun.price} TL",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(221, 233, 255, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.credit_card,
                              color: Color.fromRGBO(0, 59, 149, 1),
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "12 aya varan taksit!",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 59, 149, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Fiyat + 12 aya varan taksit container - F
                  //Ürün Title - S
                  Text(
                    widget.urun.title,
                    style: TextStyle(
                      color: Color.fromRGBO(210, 210, 210, 1),
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  //Ürün Title - F
                  SizedBox(height: 12),
                  //Konum + Beğeni Kutucuğu - S
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DataHelper.getUserById(
                          widget.urun.sellerId,
                        )!.location,
                        style: TextStyle(
                          color: Color.fromRGBO(98, 98, 98, 1),
                          fontSize: 10,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(44, 44, 44, 1),
                          borderRadius: BorderRadius.circular(10),
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
                              widget.urun.likeCount.toString(),
                              style: TextStyle(
                                color: Color.fromRGBO(210, 210, 210, 1),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //Konum + Beğeni Kutucuğu - F
                  SizedBox(height: 15),
                  //Ürün Açıklaması - S
                  buildExpandableText(),
                  //Ürün Açıklaması - F
                  SizedBox(height: 10),
                  //Reklam - S
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                        width: 325,
                        child: Image.asset(
                          DataHelper.reklam1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  //Reklam - F
                  SizedBox(height: 20),
                  //Beğendiğin ürünleri sağa kaydır Container'ı - S
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    height: 125,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(62, 62, 62, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(DataHelper.kalpIkon),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Beğendiğin ürünleri sağa kaydır.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Biz de senin zevkine uygun en iyi önerileri hazırlayalım!",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
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
                                  child: Text(
                                    "Hemen Başla",
                                    style: TextStyle(
                                      color: Colors.white,
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
                  ),
                  //Beğendiğin ürünleri sağa kaydır Container'ı - F
                  //Ürün Bilgileri Widget - S
                  UrunBilgileriWidget(widget: widget),
                  //Ürün Bilgileri Widget - F
                  //Güvenli Ödeme + Kolay İade Butonları - S
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: Color.fromRGBO(255, 63, 86, 1),
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Güvenli Ödeme",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.assignment_return,
                                color: Color.fromRGBO(255, 63, 86, 1),
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Kolay İade",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Güvenli Ödeme + Kolay İade Butonları - F
                  SizedBox(height: 10),
                  //Soru Cevap - Tümünü Gör - S
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.question_mark,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Soru & Cevap (5)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.info,
                        size: 20,
                        color: Color.fromRGBO(146, 146, 146, 1),
                      ),
                      Spacer(),
                      Text(
                        "Tümünü Gör",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  //Soru Cevap - Tümünü Gör - F
                  SizedBox(height: 10),
                  //Soru Cevap Bölümü Container Widgetı - S
                  QASectionWidget(widget: widget),
                  //Soru Cevap Bölümü Container Widgetı - F
                ],
              ),
            ),
          ),
          //transform translate Satıcı kartına kadar -F
          //Satıcı Kartı - S
          SaticiKartWidget(widget: widget),
          //Satıcı Kartı - F
          //Harita Image - S
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(DataHelper.haritaResim, fit: BoxFit.fill),
            ),
          ),
          //Harita Image - F
          //İlginizi çekebilecek diğer ilanlar text - S
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Text(
              "İlginizi çekebilecek diğer ilanlar",
              style: TextStyle(
                color: Color.fromRGBO(231, 224, 223, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          //İlginizi çekebilecek diğer ilanlar text - F
          //GridPageView - S
          GridPageViewWidget(
            items: DataHelper.getActiveItems(), // Ürün listesi
            height: 380, // İstediğin yükseklik
          ),
          //GridPageView - F
          //İlan Şikayet Butonu - S
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
                      side: BorderSide(
                        color: Color.fromRGBO(255, 63, 86, 1),
                        width: 2,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          color: Color.fromRGBO(255, 63, 86, 1),
                          size: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "İlan ile ilgili şikayetlerim var",
                          style: TextStyle(
                            color: Color.fromRGBO(255, 63, 86, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //İlan Şikayet Butonu - F
        ],
      ),
      //Body -F
      //NavBar Butonlar - S
      bottomNavigationBar: ItemDetailBottomBarWidget(),
      //NavBar Butonlar - F
    );
  }

  // Text Genişletme Fonksiyonu - S
  Widget buildExpandableText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: _isExpanded ? fullText : shortText,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
              // Nokta nokta (sadece kısa metinde)
              if (!_isExpanded && fullText.length > 100)
                TextSpan(
                  text: "...",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              TextSpan(text: " "),
              // Daha az/fazla göster butonu
              TextSpan(
                text: _isExpanded ? "Daha az göster" : "Daha fazla göster",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Text Genişletme Fonskiyonu - F
}

class ItemDetailBottomBarWidget extends StatelessWidget {
  const ItemDetailBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Color.fromRGBO(35, 35, 35, 1)),
      child: Row(
        children: [
          //İkon 1
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.help, color: Colors.white, size: 24),
          ),

          SizedBox(width: 10),

          // Teklif yap buton
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                    color: Color.fromRGBO(255, 63, 86, 1),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flash_on,
                      color: Color.fromRGBO(255, 63, 86, 1),
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Teklif Yap",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 63, 86, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 10),

          // Hemen al buton
          Expanded(
            child: Container(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
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
                    SizedBox(width: 8),
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
          ),
        ],
      ),
    );
  }
}

class SaticiKartWidget extends StatelessWidget {
  const SaticiKartWidget({super.key, required this.widget});

  final ItemDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 150,
      decoration: BoxDecoration(color: Colors.black),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(44, 44, 44, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                //Profil Resmi
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        DataHelper.getUserById(
                          widget.urun.sellerId,
                        )!.profileImagePath,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                //İsim + Üyelik Tarihi
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DataHelper.getUserById(widget.urun.sellerId)!.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "${widget.urun.publishDate.day}/${widget.urun.publishDate.month}/${widget.urun.publishDate.year} tarihinden beri üye",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //İkon Buton
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 63, 86, 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.person_add_alt_1,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Satıcı Profili",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UrunBilgileriWidget extends StatelessWidget {
  const UrunBilgileriWidget({super.key, required this.widget});

  final ItemDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Divider(color: Color.fromRGBO(45, 45, 45, 1), height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "İlan Tarihi",
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                "${widget.urun.publishDate.day}/${widget.urun.publishDate.month}/${widget.urun.publishDate.year}",
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Divider(color: Color.fromRGBO(45, 45, 45, 1), height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "İlan No",
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                widget.urun.id,
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Divider(color: Color.fromRGBO(45, 45, 45, 1), height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "İlan Kategorisi",
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                widget.urun.categoryText,
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Divider(color: Color.fromRGBO(45, 45, 45, 1), height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Durum",
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                widget.urun.conditionText,
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Divider(color: Color.fromRGBO(45, 45, 45, 1), height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Marka",
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              Text(
                widget.urun.brand,
                style: TextStyle(
                  color: Color.fromRGBO(187, 187, 187, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QASectionWidget extends StatelessWidget {
  final ItemDetailPage widget;

  const QASectionWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(44, 44, 44, 1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          // Sorular listesi
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Recep ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "1300 e vereceksen alıyım",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "1 gün önce",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //Satıcı
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "${DataHelper.getUserById(widget.urun.sellerId)!.name} ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "7300 tl olur.",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "1 gün önce",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "letgo Kullanıcısı ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "1000 e olur mu",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "8 gün önce",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Alt Container - Satıcıya soru sor butonu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: BoxDecoration(
              color: Color.fromRGBO(35, 35, 35, 1),
              border: Border.all(
                color: Color.fromRGBO(61, 61, 61, 1),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Satıcıya soru sor",
                  style: TextStyle(color: Colors.white70, fontSize: 11),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromRGBO(152, 152, 152, 1),
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
