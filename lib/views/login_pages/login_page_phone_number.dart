import 'package:flutter/material.dart';
import 'package:letgo_clone/views/login_pages/login_page_verification.dart'; // Bu import'u ekleyin

class LoginPagePhoneNumber extends StatefulWidget {
  const LoginPagePhoneNumber({super.key});

  @override
  State<LoginPagePhoneNumber> createState() =>
      _LoginPagePhoneNumberState();
}

class _LoginPagePhoneNumberState extends State<LoginPagePhoneNumber> {
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
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade800,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ),
        //Leading Icon - F

        //Title - S
        title: Text(
          "Telefon numaranı gir",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        //Title - F

        //Alt Çizgi -S
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black26, height: 1),
        ),

        //Alt Çizgi - F
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            //Text Bilgi - S
            Text(
              "Senin için bu numaraya bir doğrulama kodu göndereceğiz.",
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(160, 160, 160, 1),
              ),
            ),

            //Text Bilgi - F
            SizedBox(height: 20),

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

  //Form için TextField değişken
  String _phoneNumber = '';

  //Hata var mı ? TextFormField renk değişimi
  bool _hasError = false;

  //Metin var mı kontrolü - Devam Et Buton Renk değişimi için.
  bool _hasText = false;

  //Etkileşim kontrolü
  bool _hasInteracted = false;

  bool _isValidPhone(String phone) {
    if (phone.isEmpty) return false;
    if (phone.length < 10) return false;
    if (int.tryParse(phone[0]) != null && int.parse(phone[0]) != 5) {
      return false;
    }
    return true;
  }

  void _updateState(String value) {
    setState(() {
      _hasText = value.isNotEmpty;
      //Bir kere silince "Lütfen telefon numaranızı giriniz." hatası için
      if (!_hasInteracted && value.isNotEmpty) {
        _hasInteracted = true;
      }
      if (_hasInteracted) {
        _hasError = !_isValidPhone(value);
      }
    });
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 57,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical(y: 1),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  // TextEditingController yerine onSaved + onChanged
                  onSaved: (value) {
                    _phoneNumber = value ?? '';
                  },
                  onChanged: (value) {
                    _updateState(value);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    //Prefix Kısmı - S
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
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
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 25,
                                height: 20,
                                child: Image.asset(
                                  "assets/images/turkey_flag.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "+90",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
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
            Spacer(),
            //TextFormField - F

            //Devam Et Buton - S
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                //Sadece üst kısmında ince çizgi
                border: Border(
                  top: BorderSide(color: Colors.black26, width: 1.0),
                ),
                //Üst kısmında gölge
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 4.0,
                    spreadRadius: 0,
                  ),
                ],
              ),
              width: double.infinity,
              height: 66,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 36,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _hasText
                          ? Color.fromRGBO(255, 63, 86, 1)
                          : Colors.grey.shade800,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Form save işlemi
                        formKey.currentState!.save();
                        debugPrint("Tel no geçerli: $_phoneNumber");

                        // Telefon numarasını doğrulama sayfasına geçir
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginPageVerification(
                              phoneNumber: "+90 $_phoneNumber",
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Devam Et",
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
