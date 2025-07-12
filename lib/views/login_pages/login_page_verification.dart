import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:letgo_clone/views/main_bottom_navigation.dart';

class LoginPageVerification extends StatefulWidget {
  const LoginPageVerification({super.key});

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
          "Tekrar hoş geldin",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        //Title - F
        //Alt Çizgi -S
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black26, height: 1.h),
        ),
        //Alt Çizgi - F
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            //Text Bilgi - S
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text(
                  "Şuraya 4 haneli bir kod gönderdik.",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(160, 160, 160, 1),
                  ),
                ),
                Text(
                  "+90 507 847 82 24",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(160, 160, 160, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //Text Bilgi - F
            SizedBox(height: 20.h),
            //Numara değiştir - S
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.edit,
                  size: 22,
                  color: Color.fromRGBO(255, 61, 81, 1),
                ),
                SizedBox(width: 5),
                Text(
                  "Numara değiştir",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(255, 61, 81, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            //Numara değiştir - F
            SizedBox(height: 30.h),
            //Telefon No Alanı - S
            PhoneForm(),
            //Telefon No Alanı - F
          ],
        ),
      ),
    );
  }
}

class PhoneForm extends StatefulWidget {
  const PhoneForm({super.key});

  @override
  State<PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  //Key - Validator
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //TF Değişkeni
  TextEditingController tfPhone = TextEditingController();
  //Hata var mı ? TextFormField renk değişimi
  bool _hasError = false;
  //Metin var mı kontrolü - Devam Et Buton Renk değişimi için.
  bool _hasText = false;
  //Etkileşim kontrolü
  bool _hasInteracted = false;
  @override
  void initState() {
    super.initState();
    tfPhone.addListener(() {
      setState(() {
        _hasText = tfPhone.text.isNotEmpty;
        //Bir kere silince "Lütfen telefon numaranızı giriniz." hatası için
        if (!_hasInteracted && tfPhone.text.isNotEmpty) {
          _hasInteracted = true;
        }
        if (_hasInteracted) {
          _hasError = !_isValidPhone(tfPhone.text);
        }
      });
    });
  }

  bool _isValidPhone(String phone) {
    if (phone.isEmpty) return false;
    if (phone.length < 10) return false;
    if (int.tryParse(phone[0]) != null && int.parse(phone[0]) < 5) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //TextFormField - S
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity.w,
                height: 57.h,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical(y: 1),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: tfPhone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  decoration: InputDecoration(
                    //Prefix Kısmı - S
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 0,
                        top: 0,
                        bottom: 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Cep Telefon",
                            style: TextStyle(
                              color: _hasError
                                  ? Colors.red
                                  : Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 25.w,
                                height: 20.h,
                                child: Image.asset(
                                  "assets/images/turkey_flag.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "+90",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                    //Prefix Kısmı - F
                    //Border Decorationlar
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  //Uzunluk
                  maxLength: 10,
                  //Validator kontrolleri
                  validator: (tfPhone) {
                    String? errorMsg;
                    if (!_hasInteracted) {
                      // Yazmaya başlamadan tepki gösterme
                      return null;
                    }
                    if (tfPhone == null || tfPhone.isEmpty) {
                      errorMsg = "Lütfen telefon numaranızı giriniz.";
                    } else if (int.tryParse(tfPhone[0]) != null &&
                        int.parse(tfPhone[0]) < 5) {
                      errorMsg =
                          "Lütfen geçerli bir telefon numarası giriniz.";
                    } else if (tfPhone.length < 10) {
                      errorMsg = "Telefon numarası 10 haneli olmalıdır.";
                    }
                    return errorMsg;
                  },
                ),
              ),
            ),

            //TextFormField - F
            Spacer(),
            //Devam Et Buton - S
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                // Sadece üst kısmında ince çizgi
                border: Border(
                  top: BorderSide(color: Colors.black26, width: 1.0),
                ),
                // Üst kısmında gölge
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
                      backgroundColor: _hasText
                          ? Color.fromRGBO(255, 63, 86, 1)
                          : Colors.grey.shade800,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        debugPrint("Tel no ");
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text(
                        //       "Telefon numarası geçerli, hoşgeldiniz.",
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //     backgroundColor: Color.fromRGBO(66, 66, 66, 1),
                        //   ),
                        // );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MainBottomNavigation(),
                          ),
                        );
                      } //else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       "Lütfen geçerli bir telefon numarası giriniz.",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     backgroundColor: Color.fromRGBO(66, 66, 66, 1),
                      //   ),
                      // );
                      //}
                    },
                    child: Text(
                      "Yeni kod iste",
                      style: TextStyle(
                        color: _hasText
                            ? Colors.white
                            : Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Devam Et Buton - F
          ],
        ),
      ),
    );
  }
}
