import 'dart:math';

import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/user.dart';
import 'package:letgo_clone/views/item_detail_page.dart';

class MesajlarimPage extends StatefulWidget {
  const MesajlarimPage({super.key});

  @override
  State<MesajlarimPage> createState() => _MesajlarimPageState();
}

class _MesajlarimPageState extends State<MesajlarimPage> {
  List<User> chatUsers = DataHelper.users;
  List<LetGoItem> activeItems = DataHelper.getActiveItems();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Arama çubuğu - S
        Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: SizedBox(
              height: 32,
              child: TextField(
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Sohbetler arasında ara...",
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
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                ),
              ),
            ),
          ),
        ),
        //Arama çubuğu - F
        //Filtreleme Butonları - S
        ChatFilterButtonsWidget(),
        //Filtreleme Butonları - F
        SizedBox(height: 10),
        //Sohbet Kart Tasarımı - S
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SohbetKartTasarim(user: DataHelper.users[0]),
              SohbetKartTasarim(user: DataHelper.users[1]),
              SohbetKartTasarim(user: DataHelper.users[2]),
              SohbetKartTasarim(user: DataHelper.users[3]),
            ],
          ),
        ),
        //Sohbet Kart Tasarımı - S
      ],
    );
  }
}

class SohbetKartTasarim extends StatelessWidget {
  const SohbetKartTasarim({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    // Bu user'ın ilk aktif item'ını bul
    final userActiveItems = DataHelper.getActiveItems()
        .where((item) => item.sellerId == user.id)
        .toList();

    // Eğer user'ın aktif item'ı yoksa varsayılan bir item göster
    final activeItem = userActiveItems.isNotEmpty
        ? userActiveItems.first
        : null;

    // Eğer item yoksa widget'ı gösterme
    if (activeItem == null) {
      return SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ItemDetailPage(urun: activeItem);
            },
          ),
        );
      },
      child: Container(
        height: 125,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Row(
              children: [
                //Stack Kısmı Image+Profile Pic - S
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          activeItem.mainImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    //Profile Pic
                    Positioned(
                      bottom: -12,
                      right: -12,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(user.profileImagePath),
                      ),
                    ),
                  ],
                ),
                //Stack Kısmı Image+Profile Pic - F
                SizedBox(width: 20),
                //Orta Kısım 1 Column İçi 3 Row - S
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //User Name + Time - S
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          RandomTimeWidget(),
                        ],
                      ),
                      //User Name + Time - F
                      //Rating -S
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StarRatingWidget(rating: user.rating),
                          SizedBox(width: 5),
                          Text(
                            "${user.rating} ",
                            style: TextStyle(
                              color: Color.fromRGBO(187, 187, 187, 1),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "- Satıcı Puanı",
                            style: TextStyle(
                              color: Color.fromRGBO(187, 187, 187, 1),
                              fontSize: 10.5,
                            ),
                          ),
                        ],
                      ),
                      //Rating -F
                      //Title -S
                      Text(
                        "${activeItem.title}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.5,
                        ),
                      ),
                      //Title -F
                      SizedBox(height: 5),
                      //Mesaj - S
                      RandomMessage(),
                      //Mesaj - F
                    ],
                  ),
                ),
                //Orta Kısım 1 Column İçi 3 Row - F
                //Sondaki İkon - S
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(64, 64, 64, 1),
                      child: Icon(
                        Icons.more_vert,
                        size: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                //Sondaki İkon - F
              ],
            ),
            SizedBox(height: 15),
            Divider(color: Colors.white12),
          ],
        ),
      ),
    );
  }
}

class RandomTimeWidget extends StatelessWidget {
  final double fontSize;
  final Color color;

  const RandomTimeWidget({
    super.key,
    this.fontSize = 10.5,
    this.color = Colors.white70,
  });

  static final List<String> _timeFormats = [
    "dakika önce",
    "saat önce",
    "gün önce",
    "hafta önce",
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final showTimeFormat = random
        .nextBool(); // True: saat formatı, False: geçen süre

    String timeText;

    if (showTimeFormat) {
      // Saat formatı (07:41, 14:23 gibi)
      final hour = random.nextInt(24);
      final minute = random.nextInt(60);
      timeText =
          "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
    } else {
      // Geçen süre formatı (5 gün önce, 3 saat önce gibi)
      final formatIndex = random.nextInt(_timeFormats.length);
      final timeFormat = _timeFormats[formatIndex];

      int timeValue;
      switch (formatIndex) {
        case 0: // dakika önce
          timeValue = random.nextInt(59) + 1; // 1-59 dakika
          break;
        case 1: // saat önce
          timeValue = random.nextInt(23) + 1; // 1-23 saat
          break;
        case 2: // gün önce
          timeValue = random.nextInt(30) + 1; // 1-30 gün
          break;
        case 3: // hafta önce
          timeValue = random.nextInt(4) + 1; // 1-4 hafta
          break;
        default:
          timeValue = 1;
      }

      timeText = "$timeValue $timeFormat";
    }

    return Text(
      timeText,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}

class RandomMessage extends StatelessWidget {
  const RandomMessage({super.key});

  static final List<String> _messages = [
    "Selam, hala satışta mı ?",
    "Son fiyat ne olur ?",
    "Pazarlık olur mu ?",
    "Kargo dahil mi ?",
    "Ne zaman gönderebilirsin ?",
    "Temiz mi ?",
    "Değişim olur mu ?",
    "Hangi parça ?",
    "Elden teslim olur mu ?",
    "Orjinal mi ?",
    "Garantisi var mı ?",
    "İndirim yapar mısın ?",
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final isFirstType = random
        .nextBool(); // True: check + mesaj, False: mesaj + badge
    final messageIndex = random.nextInt(_messages.length);
    final badgeCount = random.nextInt(9) + 1; // 1-9 arası

    if (isFirstType) {
      // Tip 1: Check ikonu + mesaj
      return Row(
        children: [
          Icon(
            Icons.check,
            size: 16,
            color: Color.fromRGBO(126, 126, 126, 1),
          ),
          SizedBox(width: 5),
          Text(
            _messages[messageIndex],
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else {
      // Tip 2: Mesaj + CircleAvatar badge
      return Row(
        children: [
          Text(
            _messages[messageIndex],
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          CircleAvatar(
            radius: 10,
            backgroundColor: Color.fromRGBO(255, 63, 86, 1),
            child: Text(
              "$badgeCount",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }
  }
}

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color filledColor;
  final Color unfilledColor;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.starSize = 16,
    this.filledColor = const Color.fromRGBO(251, 134, 54, 1),
    this.unfilledColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return _buildStar(index);
      }),
    );
  }

  Widget _buildStar(int index) {
    double starRating = rating - index;

    if (starRating >= 1.0) {
      //Tam dolu yıldız
      return Icon(Icons.star, color: filledColor, size: starSize);
    } else if (starRating > 0.0) {
      //Kısmi dolu yıldız
      return Stack(
        children: [
          //Arka plan (boş yıldız)
          Icon(Icons.star, color: unfilledColor, size: starSize),
          //Ön plan (dolu kısım)
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: starRating,
              child: Icon(Icons.star, color: filledColor, size: starSize),
            ),
          ),
        ],
      );
    } else {
      //Boş yıldız
      return Icon(Icons.star, color: unfilledColor, size: starSize);
    }
  }
}

class ChatFilterButtonsWidget extends StatefulWidget {
  const ChatFilterButtonsWidget({super.key});

  @override
  State<ChatFilterButtonsWidget> createState() =>
      _ChatFilterButtonsWidgetState();
}

class _ChatFilterButtonsWidgetState
    extends State<ChatFilterButtonsWidget> {
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
    debugPrint("Sohbet filtreleme butonları build oldu.");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 50,
      decoration: BoxDecoration(color: Colors.black),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ChatFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Tümü",
            buttonsIndex: 0,
            onPressed: onFilterButtonPressed,
          ),
          ChatFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Okunmamış",
            buttonsIndex: 1,
            onPressed: onFilterButtonPressed,
          ),
          ChatFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Önemli",
            buttonsIndex: 2,
            onPressed: onFilterButtonPressed,
          ),
          ChatFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Alıcıyım",
            buttonsIndex: 3,
            onPressed: onFilterButtonPressed,
          ),
          ChatFilterButton(
            selectedButtonIndex: selectedButtonIndex,
            buttonTitle: "Satıcıyım",
            buttonsIndex: 4,
            onPressed: onFilterButtonPressed,
          ),
        ],
      ),
    );
  }
}

class ChatFilterButton extends StatelessWidget {
  final String buttonTitle;
  final int buttonsIndex;
  final Function(int) onPressed;
  final int selectedButtonIndex;

  const ChatFilterButton({
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
          padding: EdgeInsets.symmetric(horizontal: 12),
          backgroundColor: isSelected
              ? Color.fromRGBO(255, 63, 86, 1)
              : Color.fromRGBO(44, 44, 44, 1),
          side: isSelected
              ? null
              : BorderSide(color: Colors.white, width: 1),
        ),
        onPressed: () {
          onPressed(buttonsIndex);
        },
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 11,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
