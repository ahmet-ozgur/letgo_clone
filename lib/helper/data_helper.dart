import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/main_category.dart';
import 'package:letgo_clone/models/user.dart';

class DataHelper {
  static String anaLogoPath = "assets/images/logo_white.png";
  static String googleLogoPath = "assets/images/logo_google.png";
  static String mainPageUcretsizKargoBanner =
      "assets/images/ucretsiz_kargo.jpg";
  static List<String> bannerPath = [
    "assets/images/banner0.png",
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
    "assets/images/banner4.png",
    "assets/images/banner5.png",
  ];
  static String onecikarLogoPath = "assets/images/onecikar.png";
  static String reklam1 = "assets/images/ads1.png";
  static String kalpIkon = "assets/images/kalp_ikon.png";
  static String haritaResim = "assets/images/harita.png";
  static String bosSepetIkon = "assets/images/emptycart.png";
  static String bosFavoriIkon = "assets/images/favoriyok.png";

  //Deneme Kullanıcı Listesi - S
  static List<User> users = [
    User(
      id: "user1",
      name: "Demir Kaya",
      profileImagePath: "assets/images/user1.png",
      memberSince: DateTime(2020, 5, 15),
      rating: 4.8,
      followerCount: 245,
      followingCount: 89,
      bio:
          "Teknoloji tutkunu, güvenilir satıcı. Her zaman kaliteli ürünler.",
      location: "İstanbul, Kadıköy",
    ),
    User(
      id: "user2",
      name: "Zeynep Demir",
      profileImagePath: "assets/images/user2.png",
      memberSince: DateTime(2019, 8, 22),
      rating: 4.9,
      followerCount: 567,
      followingCount: 123,
      bio: "İkinci el eşya uzmanı. Temiz ve bakımlı ürünler garantili.",
      location: "Ankara, Çankaya",
    ),
    User(
      id: "user3",
      name: "Mehmet Özkan",
      profileImagePath: "assets/images/user3.png",
      memberSince: DateTime(2021, 1, 10),
      rating: 4.2,
      followerCount: 89,
      followingCount: 45,
      bio: "Ev eşyaları ve mobilya satışı yapıyorum.",
      location: "İzmir, Konak",
    ),
    User(
      id: "user4",
      name: "Ayşe Yılmaz",
      profileImagePath: "assets/images/user4.png",
      memberSince: DateTime(2022, 3, 5),
      rating: 4.6,
      followerCount: 156,
      followingCount: 67,
      bio: "Elektronik ve oyun konsolları uzmanı.",
      location: "Bursa, Nilüfer",
    ),
  ];
  //Deneme Kullanıcı Listesi - F

  //Kategori Listesi Fonksiyonları - S
  static List<MainCategory> get categoryList {
    //Tüm Kategoriler diye butonun olmadığı gerçek kategori listesi
    return MainCategory.values
        .where((category) => category != MainCategory.allCategories)
        .toList();
  }

  static List<MainCategory> get allCategoryList {
    //Tüm Kategoriler diye butonun olduğu liste
    return MainCategory.values.toList();
  }
  //Kategori Listesi Fonksiyonları - F

  //Ürün Listesi - S
  static List<LetGoItem> allItems = [
    //Araba Kategorisi - S
    LetGoItem(
      id: "1",
      title: "2018 Renault Clio 1.5 dCi Touch",
      description:
          "Çok temiz araç, bakımlı kullanılmış. 120.000 km'de, hasar kaydı yok. Araç muayenesi yeni geçirildi. Kliması çalışıyor, lastikleri yeni değiştirildi. Garajda bekletilmiş araç.",
      price: 380000,
      imagePaths: [
        "assets/images/items/1-0.png",
        "assets/images/items/1-1.png",
        "assets/images/items/1-2.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2)),
      viewCount: 456,
      likeCount: 78,
      condition: ItemCondition.good,
      category: MainCategory.car,
      brand: "Renault",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "2",
      title: "2015 Volkswagen Passat 1.6 TDI Comfortline",
      description:
          "Düzenli bakımı yapılmış, 180.000 km'de. Motor ve şanzıman sorunsuz. Klima çalışıyor, döşemeleri temiz. Aileden satılık araç. Takas değerlendirilir.",
      price: 420000,
      imagePaths: [
        "assets/images/items/2-0.png",
        "assets/images/items/2-1.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 5)),
      viewCount: 623,
      likeCount: 134,
      condition: ItemCondition.good,
      category: MainCategory.car,
      brand: "Volkswagen",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),
    //Araba Kategorisi - F

    //Telefon Kategorisi - S
    LetGoItem(
      id: "3",
      title: "iPhone 13 Pro Max 128GB Space Gray",
      description:
          "11 ay kullanıldı, çok temiz durumda. Ekran koruyucu ve kılıf takılı durumda kullanıldı hiç düşürülmedi. Kutusu, şarj aleti ve kablosu mevcut. Pil sağlığı %89. Garantisi devam ediyor.",
      price: 32000,
      imagePaths: [
        "assets/images/items/3-0.png",
        "assets/images/items/3-1.png",
        "assets/images/items/3-2.png",
        "assets/images/items/3-3.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 8)),
      viewCount: 234,
      likeCount: 56,
      condition: ItemCondition.likeNew,
      category: MainCategory.phone,
      brand: "Apple",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "4",
      title: "Samsung Galaxy S21 Ultra 256GB Phantom Black",
      description:
          "1.5 yıl kullanıldı, çok iyi durumda. S Pen dahil. Ekranında çizik yok, arka camı da sorunsuz. Şarj aleti ve kutusu mevcut. Kamera performansı harika, oyunlarda kasma yok.",
      price: 18500,
      imagePaths: [
        "assets/images/items/4-0.png",
        "assets/images/items/4-1.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 189,
      likeCount: 43,
      condition: ItemCondition.good,
      category: MainCategory.phone,
      brand: "Samsung",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),
    //Telefon Kategorisi - F

    //Elektronik Kategorisi - S
    LetGoItem(
      id: "5",
      title: "MacBook Air M2 13-inch 8GB 256GB",
      description:
          "6 ay kullanıldı, çok temiz durumda. Ekranında çizik yok, klavye ve trackpad sorunsuz. Şarj aleti ve kutusu mevcut. Ofis işleri ve programlama için ideal. Pil performansı çok iyi.",
      price: 28000,
      imagePaths: [
        "assets/images/items/5-0.png",
        "assets/images/items/5-1.png",
        "assets/images/items/5-2.png",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 12)),
      viewCount: 345,
      likeCount: 89,
      condition: ItemCondition.likeNew,
      category: MainCategory.electronics,
      brand: "Apple",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "6",
      title: "Sony PlayStation 5 + 2 Kol + 3 Oyun",
      description:
          "8 ay kullanıldı, hiç sorun çıkarmadı. İkinci kol ve 3 adet oyun hediye. God of War, Spider-Man ve FIFA 23 oyunları dahil. Kutusu ve tüm aksesuarları mevcut. Temiz durumda.",
      price: 16500,
      imagePaths: [
        "assets/images/items/6-0.png",
        "assets/images/items/6-1.png",
        "assets/images/items/6-2.png",
        "assets/images/items/6-3.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 3)),
      viewCount: 567,
      likeCount: 145,
      condition: ItemCondition.good,
      category: MainCategory.electronics,
      brand: "Sony",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),
    //Elektronik Kategorisi - F

    //Ev & Yaşam Kategorisi - S
    LetGoItem(
      id: "7",
      title: "IKEA MALM Yatak Odası Takımı 160x200",
      description:
          "Çift kişilik yatak, 2 adet komodin ve 6 kapılı dolap dahil. 1 yıl kullanıldı, çok temiz durumda. Beyaz renk, modern tasarım. Sökülebilir durumda, nakliye alıcıya ait.",
      price: 4500,
      imagePaths: [
        "assets/images/items/7-0.png",
        "assets/images/items/7-1.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 18)),
      viewCount: 123,
      likeCount: 34,
      condition: ItemCondition.good,
      category: MainCategory.homeAndLiving,
      brand: "IKEA",
      isFeatured: true,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "8",
      title: "Bellona Modern 3+2+1 Koltuk Takımı",
      description:
          "Gerçek deri koltuk takımı, 2 yıl kullanıldı. Çok rahat ve şık. Renkli leke yok, yıpranma yok. Oturma kısmı çok konforlu. Nakliye için yardım edilebilir.",
      price: 12000,
      imagePaths: [
        "assets/images/items/8-0.png",
        "assets/images/items/8-1.png",
        "assets/images/items/8-2.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 4)),
      viewCount: 789,
      likeCount: 167,
      condition: ItemCondition.good,
      category: MainCategory.homeAndLiving,
      brand: "Bellona",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),
    //Ev & Yaşam Kategorisi - F

    //Motosiklet Kategorisi - S
    LetGoItem(
      id: "9",
      title: "Honda CBR 150R 2020 Model",
      description:
          "Çok az kullanılmış motosiklet, sadece 8000 km'de. Garajda bekletildi, düşme yok. Lastikleri yeni, fren balata ve diskleri yeni değiştirildi. Muayenesi geçerli.",
      price: 45000,
      imagePaths: [
        "assets/images/items/9-0.png",
        "assets/images/items/9-1.png",
        "assets/images/items/9-2.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 234,
      likeCount: 67,
      condition: ItemCondition.likeNew,
      category: MainCategory.motorcycle,
      brand: "Honda",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "10",
      title: "Yamaha YZF-R25 2019 Model",
      description:
          "Temiz motosiklet, düzenli bakımlı. 15000 km'de. ABS fren sistemi mevcut. Exzost sesi çok güzel, çok sportif görünüm. Plakası temiz, tramer kaydı yok.",
      price: 58000,
      imagePaths: ["assets/images/items/10-0.png"],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 20)),
      viewCount: 156,
      likeCount: 45,
      condition: ItemCondition.good,
      category: MainCategory.motorcycle,
      brand: "Yamaha",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),
    //Motosiklet Kategorisi - F

    //Giyim & Aksesuar Kategorisi - S
    LetGoItem(
      id: "11",
      title: "Nike Air Jordan 1 Retro High OG 42 Numara",
      description:
          "Çok az giyildi, neredeyse sıfır gibi. Kutusu ve etiketleri mevcut. Orjinal Nike mağazasından alındı. 42 numara erkek ayakkabısı, çok rahat ve şık.",
      price: 3200,
      imagePaths: [
        "assets/images/items/11-0.png",
        "assets/images/items/11-1.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 6)),
      viewCount: 345,
      likeCount: 89,
      condition: ItemCondition.likeNew,
      category: MainCategory.clothingAndAccessory,
      brand: "Nike",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "12",
      title: "Zara Erkek Deri Ceket Large Beden",
      description:
          "Gerçek deri ceket, 1 sezon giyildi. Çok şık ve kaliteli. Large beden, normal kalıp. Hiç yıpranma yok, çok temiz durumda. Astarsız, çok rahat.",
      price: 850,
      imagePaths: [
        "assets/images/items/12-0.png",
        "assets/images/items/12-1.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2)),
      viewCount: 123,
      likeCount: 29,
      condition: ItemCondition.good,
      category: MainCategory.clothingAndAccessory,
      brand: "Zara",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),
    //Giyim & Aksesuar Kategorisi - F

    //Kişisel Bakım & Kozmetik Kategorisi - S
    LetGoItem(
      id: "13",
      title: "Dyson Supersonic Saç Kurutma Makinesi",
      description:
          "6 ay kullanıldı, çok temiz durumda. Tüm başlıkları mevcut. Hızlı kurutma, saça zarar vermiyor. Kutusu ve aksesuarları mevcut. Garantisi devam ediyor.",
      price: 2800,
      imagePaths: [
        "assets/images/items/13-0.png",
        "assets/images/items/13-1.png",
        "assets/images/items/13-2.png",
        "assets/images/items/13-3.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 14)),
      viewCount: 567,
      likeCount: 123,
      condition: ItemCondition.likeNew,
      category: MainCategory.beautyAndCare,
      brand: "Dyson",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "14",
      title: "MAC Cosmetics Makyaj Seti 15 Parça",
      description:
          "15 parçalık komple makyaj seti. Ruj, far, allık, fondöten dahil. Hepsi orijinal MAC ürünleri. Çok az kullanıldı, hijyenik şekilde saklandı. Çantası da hediye.",
      price: 1200,
      imagePaths: [
        "assets/images/items/14-0.png",
        "assets/images/items/14-1.png",
        "assets/images/items/14-2.png",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 234,
      likeCount: 67,
      condition: ItemCondition.likeNew,
      category: MainCategory.beautyAndCare,
      brand: "MAC",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),
    //Kişisel Bakım & Kozmetik Kategorisi - F

    //Anne & Bebek & Oyuncak Kategorisi - S
    LetGoItem(
      id: "15",
      title: "Chicco Bebek Arabası Travel System",
      description:
          "0-3 yaş arası kullanılır. Puset, ana kucak ve oto koltuğu bir arada. Çok az kullanıldı, tertemiz durumda. Yağmur brandası ve moskito ağı hediye.",
      price: 3500,
      imagePaths: [
        "assets/images/items/15-0.png",
        "assets/images/items/15-1.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 10)),
      viewCount: 123,
      likeCount: 34,
      condition: ItemCondition.likeNew,
      category: MainCategory.babyAndToys,
      brand: "Chicco",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "16",
      title: "LEGO Creator Expert Eifel Tower 10307",
      description:
          "Yeni açılmış LEGO seti, tüm parçalar mevcut. 10001 parça, çok detaylı model. Yetişkinler için ideal hobi. Kutusu ve kullanım kılavuzu da dahil.",
      price: 850,
      imagePaths: [
        "assets/images/items/16-0.png",
        "assets/images/items/16-1.png",
        "assets/images/items/16-2.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 3)),
      viewCount: 456,
      likeCount: 112,
      condition: ItemCondition.new_,
      category: MainCategory.babyAndToys,
      brand: "LEGO",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),
    //Anne & Bebek & Oyuncak Kategorisi - F

    //Hobi & Kitap & Müzik Kategorisi - S
    LetGoItem(
      id: "17",
      title: "Yamaha F310 Akustik Gitar + Kılıf",
      description:
          "6 ay kullanıldı, çok temiz durumda. Ses kalitesi mükemmel, teller yeni. Gitar kılıfı, pena ve akort aleti hediye. Başlangıç seviyesi için ideal.",
      price: 1200,
      imagePaths: [
        "assets/images/items/17-0.png",
        "assets/images/items/17-1.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 16)),
      viewCount: 234,
      likeCount: 56,
      condition: ItemCondition.likeNew,
      category: MainCategory.hobbyBookMusic,
      brand: "Yamaha",
      isFeatured: true,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "18",
      title: "Harry Potter Kitap Seti 7 Cilt Türkçe",
      description:
          "Komple Harry Potter serisi, 7 kitap. YKY yayınları, Türkçe çeviri. Çok az okundu, sayfa kopukluğu yok. Kitap severlere ideal, koleksiyon değeri yüksek.",
      price: 350,
      imagePaths: [
        "assets/images/items/18-0.png",
        "assets/images/items/18-1.png",
        "assets/images/items/18-2.png",
        "assets/images/items/18-3.png",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2)),
      viewCount: 167,
      likeCount: 45,
      condition: ItemCondition.good,
      category: MainCategory.hobbyBookMusic,
      brand: "YKY",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),
    //Hobi & Kitap & Müzik Kategorisi - F

    //Ofis & Kırtasiye Kategorisi - S
    LetGoItem(
      id: "19",
      title: "Herman Miller Aeron Ergonomik Ofis Koltuğu",
      description:
          "2 yıl kullanıldı, çok rahat ve ergonomik. Bel ve boyun desteği mükemmel. Uzun süreli çalışma için ideal. Temiz durumda, tüm ayar mekanizmaları çalışıyor.",
      price: 8500,
      imagePaths: [
        "assets/images/items/19-0.png",
        "assets/images/items/19-1.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 22)),
      viewCount: 345,
      likeCount: 78,
      condition: ItemCondition.good,
      category: MainCategory.officeAndStationery,
      brand: "Herman Miller",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "20",
      title: "Canon PIXMA G3420 Tanklı Yazıcı",
      description:
          "6 ay kullanıldı, çok az sayfa çıktısı alındı. Mürekkep tankları dolu. Renkli ve siyah beyaz baskı yapabiliyor. USB kablosu ve kutusu mevcut.",
      price: 1800,
      imagePaths: [
        "assets/images/items/20-0.png",
        "assets/images/items/20-1.png",
        "assets/images/items/20-2.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 189,
      likeCount: 43,
      condition: ItemCondition.likeNew,
      category: MainCategory.officeAndStationery,
      brand: "Canon",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),
    //Ofis & Kırtasiye Kategorisi - F

    //Spor & Outdoor Kategorisi - S
    LetGoItem(
      id: "21",
      title: "Trek Domane AL 2 Yol Bisikleti 54cm",
      description:
          "1 sezon kullanıldı, çok temiz durumda. Vitesler sorunsuz, lastikler yeni. Bisiklet bilgisayarı ve su matarası hediye. Uzun mesafe için çok konforlu.",
      price: 8500,
      imagePaths: ["assets/images/items/21-0.png"],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 12)),
      viewCount: 234,
      likeCount: 67,
      condition: ItemCondition.likeNew,
      category: MainCategory.sportsAndOutdoor,
      brand: "Trek",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "22",
      title: "Coleman 4 Kişilik Kamp Çadırı + Ekipmanlar",
      description:
          "2 kere kullanıldı, neredeyse sıfır gibi. Su geçirmez, kolay kurulum. Yer minderi, çekiç ve çiviler dahil. 4 kişi rahatça yatabilir, çok ferah.",
      price: 1200,
      imagePaths: [
        "assets/images/items/22-0.png",
        "assets/images/items/22-1.png",
        "assets/images/items/22-2.png",
        "assets/images/items/22-3.png",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2)),
      viewCount: 178,
      likeCount: 34,
      condition: ItemCondition.likeNew,
      category: MainCategory.sportsAndOutdoor,
      brand: "Coleman",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),
    //Spor & Outdoor Kategorisi - F

    //Diğer Araçlar Kategorisi - S
    LetGoItem(
      id: "23",
      title: "Segway Ninebot MAX G30 Elektrikli Scooter",
      description:
          "8 ay kullanıldı, çok temiz durumda. 65 km menzil, 25 km/h hız. Bataryası çok iyi durumda. Şehir içi ulaşım için ideal. Şarj aleti ve kutusu mevcut.",
      price: 7500,
      imagePaths: [
        "assets/images/items/23-0.png",
        "assets/images/items/23-1.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 8)),
      viewCount: 345,
      likeCount: 89,
      condition: ItemCondition.good,
      category: MainCategory.otherVehicles,
      brand: "Segway",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "24",
      title: "Xiaomi Mi Electric Scooter Pro 2",
      description:
          "1 yıl kullanıldı, bataryası hala çok iyi. 45 km menzil, 25 km/h maksimum hız. Mobil uygulama ile kontrol edilebiliyor. Çok pratik ve güvenli.",
      price: 4200,
      imagePaths: [
        "assets/images/items/24-0.png",
        "assets/images/items/24-1.png",
        "assets/images/items/24-2.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 267,
      likeCount: 56,
      condition: ItemCondition.good,
      category: MainCategory.otherVehicles,
      brand: "Xiaomi",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),
    //Diğer Araçlar Kategorisi - F

    //Yapı Market & Bahçe Kategorisi - S
    LetGoItem(
      id: "25",
      title: "Bosch GSB 120-LI Akülü Vidalama Matkap Seti",
      description:
          "6 ay kullanıldı, çok az kullanım. 2 adet akü, şarj aleti ve 40 parça bit seti dahil. Ev tamiri ve montaj işleri için ideal. Garantisi devam ediyor.",
      price: 1800,
      imagePaths: [
        "assets/images/items/25-0.png",
        "assets/images/items/25-1.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 14)),
      viewCount: 189,
      likeCount: 45,
      condition: ItemCondition.likeNew,
      category: MainCategory.constructionAndGarden,
      brand: "Bosch",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "26",
      title: "Kärcher K2 Basınçlı Yıkama Makinesi",
      description:
          "1 sezon kullanıldı, çok temiz durumda. Araç, balkon ve bahçe temizliği için mükemmel. Tüm aksesuarları mevcut. Su hortumu ve başlıklar dahil.",
      price: 1200,
      imagePaths: [
        "assets/images/items/26-0.png",
        "assets/images/items/26-1.png",
        "assets/images/items/26-2.png",
        "assets/images/items/26-3.png",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 3)),
      viewCount: 234,
      likeCount: 67,
      condition: ItemCondition.good,
      category: MainCategory.constructionAndGarden,
      brand: "Kärcher",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),
    //Yapı Market & Bahçe Kategorisi - F

    //Pet Shop Kategorisi - S
    LetGoItem(
      id: "27",
      title: "Royal Canin Köpek-Kedi Biberonu XL Beden",
      description:
          "Çok az kullanıldı, neredeyse sıfır gibi. XL beden köpekler için uygun. Su geçirmez, termal izolasyonlu. Çok sağlam yapı, uzun yıllar kullanılır.",
      price: 850,
      imagePaths: [
        "assets/images/items/27-0.png",
        "assets/images/items/27-1.png",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 18)),
      viewCount: 145,
      likeCount: 34,
      condition: ItemCondition.likeNew,
      category: MainCategory.petShop,
      brand: "Royal Canin",
      isFeatured: true,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "28",
      title: "Ferplast Kedi Taşıma Çantası + Oyuncaklar",
      description:
          "Çok temiz durumda, havalandırma mükemmel. Kedi oyuncakları da hediye. Veteriner ziyaretleri ve seyahat için ideal. Kolay taşınır, kedi için rahat.",
      price: 350,
      imagePaths: [
        "assets/images/items/28-0.png",
        "assets/images/items/28-1.png",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 123,
      likeCount: 29,
      condition: ItemCondition.good,
      category: MainCategory.petShop,
      brand: "Ferplast",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),
    //Pet Shop Kategorisi - F

    //Antika Kategorisi - S
    LetGoItem(
      id: "29",
      title: "1950'ler Alman Yapımı Mekanik Masa Saati",
      description:
          "Çalışır durumda antika masa saati. 1950'lerde Almanya'da üretilmiş. Mekanik kurmalı sistem. Koleksiyoncular için ideal, çok nadir bulunan model.",
      price: 2500,
      imagePaths: [
        "assets/images/items/29-0.png",
        "assets/images/items/29-1.png",
      ],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 20)),
      viewCount: 456,
      likeCount: 123,
      condition: ItemCondition.fair,
      category: MainCategory.antique,
      brand: "Alman",
      isFeatured: true,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "30",
      title: "Osmanlı Dönemi El İşi Bakır Tepsi Seti",
      description:
          "3 adet farklı boyda bakır tepsi. El işçiliği, çok değerli. Osmanlı dönemine ait, sertifikalı. Koleksiyoncular için çok nadir fırsat. Çok temiz durumda.",
      price: 4200,
      imagePaths: [
        "assets/images/items/30-0.png",
        "assets/images/items/30-1.png",
        "assets/images/items/30-2.png",
        "assets/images/items/30-3.png",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2)),
      viewCount: 678,
      likeCount: 189,
      condition: ItemCondition.fair,
      category: MainCategory.antique,
      brand: "El İşi",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),
    //Antika Kategorisi - F

    //Red Ürün - S
    LetGoItem(
      id: "31",
      title: "Eski iPhone 6 (Ekranı Çatlak)",
      description:
          "Ekranı çatlak ama çalışıyor. Yedek telefon olarak kullanılabilir. Bataryası hala iyi durumda. Şarj aleti mevcut. Arka kapak çizik.",
      price: 500,
      imagePaths: ["assets/images/items/31-0.png"],
      sellerId: "user1",
      status: ItemStatus.rejected,
      publishDate: DateTime.now().subtract(Duration(days: 10)),
      viewCount: 34,
      likeCount: 5,
      condition: ItemCondition.worn,
      category: MainCategory.phone,
      brand: "Apple",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),
    //Red Ürün - F

    //Satıldı Ürün - S
    LetGoItem(
      id: "32",
      title: "MacBook Air M1 13 inch 2020",
      description:
          "1 yıl kullanıldı, çok temiz durumda. Şarj aleti ve kılıf hediye. Pil sağlığı %95. Hiç sorun çıkarmadı. Kutusu da mevcut.",
      price: 22000,
      imagePaths: [
        "assets/images/items/32-0.png",
        "assets/images/items/32-1.png",
      ],
      sellerId: "user1",
      status: ItemStatus.sold,
      publishDate: DateTime.now().subtract(Duration(days: 12)),
      viewCount: 234,
      likeCount: 78,
      condition: ItemCondition.good,
      category: MainCategory.electronics,
      brand: "Apple",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),
    //Satıldı Ürün - F
  ];
  //Ürün Listesi - F

  //Temel Filtreleme Fonksiyonları - S
  static List<LetGoItem> getAllItems() {
    return allItems;
  }

  static List<LetGoItem> getActiveItems() {
    return allItems
        .where((item) => item.status == ItemStatus.active)
        .toList();
  }

  static List<LetGoItem> getRejectedItems() {
    return allItems
        .where((item) => item.status == ItemStatus.rejected)
        .toList();
  }

  static List<LetGoItem> getSoldItems() {
    return allItems
        .where((item) => item.status == ItemStatus.sold)
        .toList();
  }

  static List<LetGoItem> getPendingItems() {
    return allItems
        .where((item) => item.status == ItemStatus.pending)
        .toList();
  }
  //Temel Filtreleme Fonksiyonları - F

  //Kategori Bazlı Filtreleme - S
  static List<LetGoItem> getItemsByCategory(MainCategory category) {
    if (category == MainCategory.allCategories) {
      return getActiveItems();
    }
    return allItems
        .where(
          (item) =>
              item.category == category &&
              item.status == ItemStatus.active,
        )
        .toList();
  }

  static int getItemCountByCategory(MainCategory category) {
    if (category == MainCategory.allCategories) {
      return getActiveItems().length;
    }
    return getItemsByCategory(category).length;
  }
  //Kategori Bazlı Filtreleme - F

  //Diğer Filtreleme Fonksiyonları - S
  static List<LetGoItem> getFeaturedItems() {
    return allItems
        .where(
          (item) => item.isFeatured && item.status == ItemStatus.active,
        )
        .toList();
  }

  static List<LetGoItem> getItemsByBrand(String brand) {
    return allItems
        .where(
          (item) =>
              item.brand.toLowerCase().contains(brand.toLowerCase()) &&
              item.status == ItemStatus.active,
        )
        .toList();
  }

  static List<LetGoItem> getItemsByCondition(ItemCondition condition) {
    return allItems
        .where(
          (item) =>
              item.condition == condition &&
              item.status == ItemStatus.active,
        )
        .toList();
  }
  //Diğer Filtreleme Fonksiyonları - F

  //Utility Fonksiyonları - S
  static User? getUserById(String userId) {
    try {
      return users.firstWhere((user) => user.id == userId);
    } catch (e) {
      return null;
    }
  }

  static LetGoItem? getItemById(String itemId) {
    try {
      return allItems.firstWhere((item) => item.id == itemId);
    } catch (e) {
      return null;
    }
  }
  //Utility Fonksiyonları - F

  //Sepet Yönetimi - S
  static final Map<String, int> _cart = {};

  static bool addToCart(LetGoItem item) {
    if (_cart.containsKey(item.id)) {
      _cart[item.id] = _cart[item.id]! + 1;
      return false;
    } else {
      _cart[item.id] = 1;
      return true;
    }
  }

  static void removeFromCart(String itemId) {
    _cart.remove(itemId);
  }

  static void updateCartQuantity(String itemId, int quantity) {
    if (quantity <= 0) {
      removeFromCart(itemId);
    } else {
      _cart[itemId] = quantity;
    }
  }

  static void clearCart() {
    _cart.clear();
  }

  static int getCartItemCount() {
    return _cart.values.fold(0, (total, quantity) => total + quantity);
  }

  static double getCartTotalPrice() {
    double total = 0;
    _cart.forEach((itemId, quantity) {
      LetGoItem? item = getItemById(itemId);
      if (item != null) {
        total += (item.price * quantity);
      }
    });
    return total;
  }

  static bool isItemInCart(String itemId) {
    return _cart.containsKey(itemId);
  }

  static int getCartItemQuantity(String itemId) {
    return _cart[itemId] ?? 0;
  }

  static List<Map<String, dynamic>> getCartItems() {
    List<Map<String, dynamic>> cartItems = [];
    _cart.forEach((itemId, quantity) {
      LetGoItem? item = getItemById(itemId);
      if (item != null) {
        cartItems.add({'item': item, 'quantity': quantity});
      }
    });
    return cartItems;
  }

  static int getCartUniqueItemCount() {
    return _cart.length;
  }
  //Sepet Yönetimi - F

  //Favori Yönetimi - S
  static final Set<String> _favoriteItems = {};

  static bool toggleFavorite(LetGoItem item) {
    if (_favoriteItems.contains(item.id)) {
      _favoriteItems.remove(item.id);
      return false;
    } else {
      _favoriteItems.add(item.id);
      return true;
    }
  }

  static void removeFromFavorites(String itemId) {
    _favoriteItems.remove(itemId);
  }

  static void clearFavorites() {
    _favoriteItems.clear();
  }

  static bool isItemInFavorites(String itemId) {
    return _favoriteItems.contains(itemId);
  }

  static int getFavoriteItemCount() {
    return _favoriteItems.length;
  }

  static List<LetGoItem> getFavoriteItems() {
    List<LetGoItem> favoriteItems = [];
    for (String itemId in _favoriteItems) {
      LetGoItem? item = getItemById(itemId);
      if (item != null) {
        favoriteItems.add(item);
      }
    }
    return favoriteItems;
  }

  static Set<String> getFavoriteItemIds() {
    return Set.from(_favoriteItems);
  }

  //Favori Yönetimi - F
}
