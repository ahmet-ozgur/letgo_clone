import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/user.dart';
import 'package:letgo_clone/views/main_bottom_navigation.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartItems = DataHelper.getCartItems();
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
                  color: Color.fromRGBO(66, 66, 66, 1),
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
          "Sepetim",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        centerTitle: true,
        //Title - F
        //Alt çizgi
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color.fromRGBO(27, 27, 27, 1),
            height: 2,
          ),
        ),
      ),
      //AppBar - F
      body: cartItems.isEmpty
          ? EmptyCartPage()
          : ListView(
              children: [
                SepetimUstBarButonlar(),
                //Kuponlarım + Kupon kodu ekle - S
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined,
                              color: Colors.white,
                              size: 17,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Kuponlarım",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: Color.fromRGBO(255, 63, 86, 1),
                              size: 17,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Kupon kodu ekle",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 63, 86, 1),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Kuponlarım + Kupon kodu ekle - F
                Divider(color: Color.fromRGBO(44, 44, 44, 1)),
                //Sepetteki Tüm Ürünler - S
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    LetGoItem item = cartItems[index]['item'];
                    int quantity = cartItems[index]['quantity'];
                    return SepetteUrunWidget(
                      item: item,
                      quantity: quantity,
                      onQuantityChanged: () {
                        setState(() {
                          //CartItems listesini yeniden al
                          cartItems = DataHelper.getCartItems();
                        });
                      },
                    );
                  },
                ),
                //Sepetteki Tüm Ürünler - F
              ],
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(44, 44, 44, 1),
                border: Border(
                  top: BorderSide(
                    color: Color.fromRGBO(60, 60, 60, 1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  //Sol Yukarı Ok İkonu - S
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Color.fromRGBO(255, 64, 85, 1),
                    size: 28,
                  ),
                  //Sol Yukarı Ok İkonu - F
                  SizedBox(width: 15),
                  //Orta Tutar Bilgisi - S
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tutar",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "${DataHelper.getCartTotalPrice().toStringAsFixed(2)} TL",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //Orta Tutar Bilgisi - F
                  Spacer(),
                  //Sağ Ödeme Butonu - S
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                      ),
                      onPressed: () {
                        //Ödeme işlemi
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Toplam ${DataHelper.getCartItemCount()} ürün - ${DataHelper.getCartTotalPrice().toInt()} TL ödeme yapılacak!",
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Text(
                        "Ödemeyi Tamamla",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  //Sağ Ödeme Butonu - F
                ],
              ),
            ),
      //Alt Sabit Bar - F
    );
  }
}

class SepetteUrunWidget extends StatelessWidget {
  final LetGoItem item;
  final int quantity;
  final VoidCallback onQuantityChanged;
  const SepetteUrunWidget({
    super.key,
    required this.item,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Satıcı bilgisini al
    User? seller = DataHelper.getUserById(item.sellerId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.radio_button_checked,
                color: Color.fromRGBO(255, 63, 86, 1),
              ),
              SizedBox(width: 10),
              //Satıcı Circle Avatar Profile Pic - S
              CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(seller!.profileImagePath),
              ),
              //Satıcı Circle Avatar Profile Pic - F
              SizedBox(width: 10),
              //Satıcı İsmi - S
              Text(
                seller.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              //Satıcı İsmi - F
            ],
          ),
          Divider(color: Colors.white12),
          //Ürün fotosu olan kısım - S
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Sol Miktar Kontrolleri - S
              Column(
                children: [
                  //Artır Butonu - S
                  GestureDetector(
                    onTap: () {
                      DataHelper.updateCartQuantity(item.id, quantity + 1);
                      onQuantityChanged();
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(60, 60, 60, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  //Artır Butonu - F
                  SizedBox(height: 10),
                  //Miktar Gösterici - S
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(44, 44, 44, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Center(
                      child: Text(
                        "$quantity",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  //Miktar Gösterici - F
                  SizedBox(height: 10),
                  //Azalt Butonu - S
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        DataHelper.updateCartQuantity(
                          item.id,
                          quantity - 1,
                        );
                        onQuantityChanged();
                      }
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(60, 60, 60, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  //Azalt Butonu - F
                ],
              ),
              //Sol Miktar Kontrolleri - F
              SizedBox(width: 15),
              //Ürün Resmi - S
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.mainImage,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              //Ürün Resmi - F
              SizedBox(width: 15),
              //Sağ Ürün Bilgileri - S
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Fiyat Bilgisi Row - S
                    Row(
                      children: [
                        Text(
                          "Ürün Fiyatı:",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${item.price} TL",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    //Fiyat Bilgisi Row - F
                    SizedBox(height: 8),
                    //Divider - S
                    Divider(color: Colors.white24, thickness: 1),
                    //Divider - F
                    SizedBox(height: 8),
                    //Ürün Başlığı - S
                    Text(
                      item.title,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //Ürün Başlığı - F
                    SizedBox(height: 15),
                    //Sil Butonu - S
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            DataHelper.removeFromCart(item.id);
                            onQuantityChanged();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //Sil Butonu - F
                  ],
                ),
              ),
              //Sağ Ürün Bilgileri - F
            ],
          ),
          //Ürün fotosu olan kısım - F
        ],
      ),
    );
  }
}

class SepetimUstBarButonlar extends StatelessWidget {
  const SepetimUstBarButonlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 75,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white24),
          bottom: BorderSide(color: Colors.white24),
        ),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(44, 44, 44, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user, color: Colors.white, size: 26),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Güvenli",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "Ödeme",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(44, 44, 44, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.assignment_return_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kolay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "İade",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(44, 44, 44, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_repair_service_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sipariş",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "Kapında",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: Image.asset(DataHelper.bosSepetIkon),
            ),
            SizedBox(height: 20),
            Text(
              "Sepetin boş.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            Text(
              "letgo'da keşfedilmeyi bekleyen",
              style: TextStyle(color: Color.fromRGBO(199, 199, 199, 1)),
            ),

            Text(
              "çoook ürün var!",
              style: TextStyle(color: Color.fromRGBO(199, 199, 199, 1)),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 63, 86, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MainBottomNavigation(),
                        ),
                      );
                    },
                    child: Text(
                      "Keşfetmeye Başla",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
