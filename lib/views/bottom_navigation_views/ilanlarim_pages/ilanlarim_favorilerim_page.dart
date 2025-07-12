import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';

class IlanlarimFavorilerimPage extends StatefulWidget {
  const IlanlarimFavorilerimPage({super.key});

  @override
  State<IlanlarimFavorilerimPage> createState() =>
      _IlanlarimFavorilerimPageState();
}

class _IlanlarimFavorilerimPageState
    extends State<IlanlarimFavorilerimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 44, 44, 1),
      //Listview Builder içerisinde Favori Ürünler Döndürülecek.
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: DataHelper.getActiveItems().length,
        itemBuilder: (context, index) {
          //Returnde Favori Ürün Kar Tasarımı gelecek.
          //TestItems listesinden bir LetGoItem alacak.
          return FavoriUrunKart(
            favoriUrun: DataHelper.getActiveItems()[index],
          );
        },
      ),
    );
  }
}

class FavoriUrunKart extends StatelessWidget {
  final LetGoItem favoriUrun;
  FavoriUrunKart({super.key, required this.favoriUrun});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      //Container tasarımı - S
      decoration: BoxDecoration(
        color: Color.fromRGBO(35, 35, 35, 1),
        border: Border.all(
          color: Color.fromRGBO(64, 64, 64, 1),
          width: 1.75,
        ),
      ),
      //Container tasarımı -

      //Child Tasarım - S
      child: Row(
        children: [
          //Resim Container - S
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.asset(favoriUrun.mainImage),
          ),
          //Resim Container - F
          SizedBox(width: 10),
          //Column(Text + Text) - S
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${favoriUrun.price} TL",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  "${favoriUrun.title}",
                  style: TextStyle(
                    color: Color.fromRGBO(182, 182, 182, 1),
                    fontSize: 12,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
              ],
            ),
          ),
          //Column(Text + Text) - F
          SizedBox(width: 2),
          //Icon Column - S
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                child: Icon(Icons.favorite, size: 22, color: Colors.red),
              ),
            ],
          ),
          //Icon Column - F
        ],
      ),
      //Child Tasarım - F
    );
  }
}
