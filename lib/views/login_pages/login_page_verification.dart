import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letgo_clone/views/main_bottom_navigation.dart';
import 'dart:async';

class LoginPageVerification extends StatefulWidget {
  final String phoneNumber;

  const LoginPageVerification({super.key, required this.phoneNumber});

  @override
  State<LoginPageVerification> createState() =>
      _LoginPageVerificationState();
}

class _LoginPageVerificationState extends State<LoginPageVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        automaticallyImplyLeading: false,
        //Leading Icon - S
        leadingWidth: 40.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0.w),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade800,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20.sp),
            ),
          ),
        ),
        //Leading Icon - F

        //Title - S
        title: Text(
          "Tekrar hoş geldin",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        //Title - F

        //Alt Çizgi - S
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black26, height: 1.h),
        ),
        //Alt Çizgi - F
      ),
      body: VerificationForm(phoneNumber: widget.phoneNumber),
    );
  }
}

class VerificationForm extends StatefulWidget {
  final String phoneNumber;

  const VerificationForm({super.key, required this.phoneNumber});

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  //Controller Tanımlamaları - S
  TextEditingController tf1 = TextEditingController();
  TextEditingController tf2 = TextEditingController();
  TextEditingController tf3 = TextEditingController();
  TextEditingController tf4 = TextEditingController();
  //Controller Tanımlamaları - F

  //Focus Node Tanımlamaları - S
  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();
  //Focus Node Tanımlamaları - F

  //Timer Değişkenleri - S
  Timer? timer;
  int kalanSaniye = 15;
  bool yeniKodIsteButton = false;
  //Timer Değişkenleri - F

  //Kod Kontrol Değişkenleri - S
  String mevcutKod = "";
  bool kodTamMi = false;
  bool kodDogruMu = false;
  //Kod Kontrol Değişkenleri - F

  @override
  void initState() {
    super.initState();
    timerBaslat();

    //Listener'lar - S
    tf1.addListener(() {
      kodKontrolEt();
      if (tf1.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(focus2);
      }
    });
    tf2.addListener(() {
      kodKontrolEt();
      if (tf2.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(focus3);
      }
    });
    tf3.addListener(() {
      kodKontrolEt();
      if (tf3.text.isNotEmpty) {
        FocusScope.of(context).requestFocus(focus4);
      }
    });
    tf4.addListener(() {
      kodKontrolEt();
      if (tf4.text.isNotEmpty) {
        FocusScope.of(context).unfocus();
        kodDogrulama();
      }
    });
    //Listener'lar - F
  }

  //Timer Başlatma Fonksiyonu - S
  void timerBaslat() {
    setState(() {
      yeniKodIsteButton = false;
      kalanSaniye = 15;
    });

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (kalanSaniye > 0) {
          kalanSaniye--;
        } else {
          yeniKodIsteButton = true;
          timer.cancel();
        }
      });
    });
  }
  //Timer Başlatma Fonksiyonu - F

  //Kod Kontrol Fonksiyonu - S
  void kodKontrolEt() {
    setState(() {
      mevcutKod = tf1.text + tf2.text + tf3.text + tf4.text;
      if (mevcutKod.length == 4) {
        kodTamMi = true;
      } else {
        kodTamMi = false;
      }

      if (mevcutKod == "1234") {
        kodDogruMu = true;
      } else {
        kodDogruMu = false;
      }
    });
  }
  //Kod Kontrol Fonksiyonu - F

  //Kod Doğrulama Fonksiyonu - S
  void kodDogrulama() {
    if (kodTamMi) {
      if (kodDogruMu) {
        //Doğru kod Ana sayfaya git
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainBottomNavigation()),
        );
      } else {
        //Yanlış kod Hata göster
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Yanlış kod! Lütfen tekrar deneyin.",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        //Alanları temizle
        tf1.clear();
        tf2.clear();
        tf3.clear();
        tf4.clear();
        FocusScope.of(context).requestFocus(focus1);
      }
    }
  }
  //Kod Doğrulama Fonksiyonu - F

  //Yeni Kod İste Fonksiyonu - S
  void yeniKodIste() {
    timerBaslat();
    tf1.clear();
    tf2.clear();
    tf3.clear();
    tf4.clear();
    FocusScope.of(context).requestFocus(focus1);
  }
  //Yeni Kod İste Fonksiyonu - F

  //Zaman Formatı Fonksiyonu - S
  String zamanFormat(int saniye) {
    int dakika = saniye ~/ 60;
    int kalanSn = saniye % 60;
    return "$dakika:${kalanSn.toString().padLeft(2, '0')}";
  }
  //Zaman Formatı Fonksiyonu - F

  @override
  void dispose() {
    //Timer dispose - S
    timer?.cancel();
    //Timer dispose - F

    //Controller dispose - S
    tf1.dispose();
    tf2.dispose();
    tf3.dispose();
    tf4.dispose();
    //Controller dispose - F

    //Focus dispose - S
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    //Focus dispose - F

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),

        //Üst Bilgi Metni - S
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: "Şuraya 4 haneli bir kod gönderdik. ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color.fromRGBO(160, 160, 160, 1),
                    ),
                    children: [
                      TextSpan(
                        text: widget.phoneNumber,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color.fromRGBO(160, 160, 160, 1),
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

        //Üst Bilgi Metni - F
        SizedBox(height: 20.h),

        //Numara Değiştir Linki - S
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 22.sp,
                      color: Color.fromRGBO(255, 61, 81, 1),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "Numara değiştir",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color.fromRGBO(255, 61, 81, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Numara Değiştir Linki - F
        SizedBox(height: 30.h),

        //Kod Giriş Alanları - S
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //1. Alan - S
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tf1.text.isNotEmpty
                        ? Colors.white
                        : Colors.white54,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: tf1,
                  focusNode: focus1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty && focus1.hasFocus) {
                      // Geri tuşa basılmışsa
                    }
                  },
                ),
              ),
              //1. Alan - F

              //2. Alan - S
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tf2.text.isNotEmpty
                        ? Colors.white
                        : Colors.white54,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: tf2,
                  focusNode: focus2,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      FocusScope.of(context).requestFocus(focus1);
                    }
                  },
                ),
              ),
              //2. Alan - F

              //3. Alan - S
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tf3.text.isNotEmpty
                        ? Colors.white
                        : Colors.white54,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: tf3,
                  focusNode: focus3,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      FocusScope.of(context).requestFocus(focus2);
                    }
                  },
                ),
              ),
              //3. Alan - F

              //4. Alan - S
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tf4.text.isNotEmpty
                        ? Colors.white
                        : Colors.white54,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: tf4,
                  focusNode: focus4,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      FocusScope.of(context).requestFocus(focus3);
                    }
                  },
                ),
              ),
              //4. Alan - F
            ],
          ),
        ),

        //Kod Giriş Alanları - F
        SizedBox(height: 30.h),

        //Timer Yazısı - S
        if (!yeniKodIsteButton)
          Text(
            "${zamanFormat(kalanSaniye)} içinde tekrar dene",
            style: TextStyle(
              fontSize: 14.sp,
              color: Color.fromRGBO(160, 160, 160, 1),
            ),
          ),

        //Timer Yazısı - F
        Spacer(),

        //Yeni Kod İste Butonu - S
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            border: Border(
              top: BorderSide(color: Colors.black26, width: 1.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, -2),
                blurRadius: 4.0,
                spreadRadius: 0,
              ),
            ],
          ),
          width: double.infinity.w,
          height: 66.h,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 20.w,
            ),
            child: SizedBox(
              width: double.infinity.w,
              height: 36.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: yeniKodIsteButton
                      ? Color.fromRGBO(255, 63, 86, 1)
                      : Colors.grey.shade800,
                ),
                onPressed: yeniKodIsteButton ? yeniKodIste : null,
                child: Text(
                  "Yeni kod iste",
                  style: TextStyle(
                    color: yeniKodIsteButton
                        ? Colors.white
                        : Colors.grey.shade500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        //Yeni Kod İste Butonu - F
      ],
    );
  }
}
