import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/views/login_pages/login_page_phone_number.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade900,
        //Leading Icon - S
        leadingWidth: 40,
        leading: Padding(
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
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        //Leading Icon - F

        //Title - S
        title: Text(
          "Giriş Yap",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        //Title - F

        //Actions Text Button - S
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Yardım",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
        //Actions Text Button - F
        //Alt Çizgi - S
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black26, height: 1),
        ),
        //Alt Çizgi - F
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            //Logo - S
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 160,
                  child: Image.asset(
                    DataHelper.anaLogoPath,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            //Logo -F
            Spacer(),
            //Buton Telefonla devam et - S
            SizedBox(
              width: double.infinity,
              height: 36,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent.shade200,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPagePhoneNumber(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8),
                    Text(
                      "Telefonla devam et",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Buton Telefonla devam et - F
            SizedBox(height: 10),
            //Buton E-posta adresiyle devam et - S
            SizedBox(
              height: 36,
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent.shade200,
                  disabledBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.redAccent.shade200),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_rounded),
                    SizedBox(width: 8),
                    Text(
                      "E-posta adresiyle devam et",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Buton E-posta adresiyle devam et - F
            SizedBox(height: 12),
            //VEYA Divider - S
            Row(
              children: [
                Expanded(child: Divider(color: Colors.white10)),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    "VEYA",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white10)),
              ],
            ),
            //VEYA Divider - F
            SizedBox(height: 12),
            //Buton Google ile devam et - S
            SizedBox(
              width: double.infinity,
              height: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  disabledBackgroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                        DataHelper.googleLogoPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Google ile devam et",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Buton Google ile devam et - F
            SizedBox(height: 20),
            //Alt Bilgi Text - S
            Text.rich(
              TextSpan(
                text: "Devam ederseniz ",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(160, 160, 160, 1),
                ),
                children: [
                  TextSpan(
                    text:
                        "letgo Hüküm ve Koşullarını ve Gizlilik Politikasını ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ),
                  TextSpan(text: "kabul etmiş olursunuz."),
                ],
              ),
            ),
            //Alt Bilgi Text - F
          ],
        ),
      ),
    );
  }
}
