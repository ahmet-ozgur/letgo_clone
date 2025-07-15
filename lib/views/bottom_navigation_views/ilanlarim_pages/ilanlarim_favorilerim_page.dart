import 'package:flutter/material.dart';
import 'package:letgo_clone/helper/data_helper.dart';
import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/views/main_bottom_navigation.dart';

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
    //Favori ürünleri al - S
    List<LetGoItem> favoriteItems = DataHelper.getFavoriteItems();
    //Favori ürünleri al - F

    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
      body: favoriteItems.length == 0
          ? FavoriYok()
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                //Returnde Favori Ürün Kar Tasarımı gelecek.
                //FavoriteItems listesinden bir LetGoItem alacak.
                return FavoriUrunKart(
                  favoriUrun: favoriteItems[index],
                  onFavoriteChanged: () {
                    setState(() {});
                  },
                );
              },
            ),
    );
  }
}

class FavoriUrunKart extends StatelessWidget {
  final LetGoItem favoriUrun;
  final VoidCallback? onFavoriteChanged;

  const FavoriUrunKart({
    super.key,
    required this.favoriUrun,
    this.onFavoriteChanged,
  });

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
      //Container tasarımı - F

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
              //Favori İkonu GestureDetector ile - S
              GestureDetector(
                onTap: () {
                  DataHelper.removeFromFavorites(favoriUrun.id);
                  if (onFavoriteChanged != null) {
                    onFavoriteChanged!();
                  }
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Color.fromRGBO(44, 44, 44, 1),
                  child: Icon(Icons.favorite, size: 22, color: Colors.red),
                ),
              ),
              //Favori İkonu GestureDetector ile - F
            ],
          ),
          //Icon Column - F
        ],
      ),
      //Child Tasarım - F
    );
  }
}

class FavoriYok extends StatelessWidget {
  const FavoriYok({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset(DataHelper.bosFavoriIkon),
            ),
            SizedBox(height: 20),
            Text(
              "Henüz hiçbir şeyi beğenmedin",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            Text(
              "Beğendiğin ürünleri işaretle ve dünyayla paylaş!",
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
                      "Keşfet",
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
