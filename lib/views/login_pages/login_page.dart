import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        leadingWidth: 40.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0.w),
          child: InkWell(
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
          "Giriş Yap",
          style: TextStyle(
            fontSize: 18.sp,
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
                fontSize: 13.sp,
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
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            //Logo - S
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.w,
                  height: 160.h,
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
              width: double.infinity.w,
              height: 36.h,
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
                    SizedBox(width: 8.w),
                    Text(
                      "Telefonla devam et",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Buton Telefonla devam et - F
            SizedBox(height: 10.h),
            //Buton E-posta adresiyle devam et - S
            SizedBox(
              height: 36.h,
              width: double.infinity.w,
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
                    SizedBox(width: 8.w),
                    Text(
                      "E-posta adresiyle devam et",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Buton E-posta adresiyle devam et - F
            SizedBox(height: 12.h),
            //VEYA Divider - S
            Row(
              children: [
                Expanded(child: Divider(color: Colors.white10)),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20.h),
                  child: Text(
                    "VEYA",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white10)),
              ],
            ),
            //VEYA Divider - F
            SizedBox(height: 12.h),
            //Buton Google ile devam et - S
            SizedBox(
              width: double.infinity.w,
              height: 36.h,
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
                      height: 16.h,
                      width: 16.w,
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
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Buton Google ile devam et - F
            SizedBox(height: 20.h),
            //Alt Bilgi Text - S
            Text.rich(
              TextSpan(
                text: "Devam ederseniz ",
                style: TextStyle(
                  fontSize: 12.sp,
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
