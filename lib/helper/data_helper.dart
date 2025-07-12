import 'package:letgo_clone/models/letgo_item.dart';
import 'package:letgo_clone/models/main_category.dart';
import 'package:letgo_clone/models/user.dart';

class DataHelper {
  static String anaLogoPath = "assets/images/logo_white.png";
  static String googleLogoPath = "assets/images/logo_google.png";
  static String mainPageUcretsizKargoBanner =
      "assets/images/ucretsiz_kargo.jpg";
  static List<String> bannerPath = [
    "assets/images/placeholder2.jpg",
    "assets/images/placeholder2.jpg",
    "assets/images/placeholder2.jpg",
    "assets/images/placeholder2.jpg",
    "assets/images/placeholder2.jpg",
    "assets/images/placeholder2.jpg",
  ];
  static String onecikarLogoPath = "assets/images/onecikar.png";
  // Deneme KUllanıcı Listesi
  static List<User> users = [
    User(
      id: "user1",
      name: "Ahmet Kaya",
      profileImagePath: "assets/images/user1.jpg",
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
      profileImagePath: "assets/images/user2.jpg",
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
      profileImagePath: "assets/images/user3.jpg",
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
      profileImagePath: "assets/images/user4.jpg",
      memberSince: DateTime(2022, 3, 5),
      rating: 4.6,
      followerCount: 156,
      followingCount: 67,
      bio: "Elektronik ve oyun konsolları uzmanı.",
      location: "Bursa, Nilüfer",
    ),
  ];

  // Kategori listesi artık enum'dan geliyor
  static List<MainCategory> get categoryList {
    //Tüm Kategoriler diye butonun olmadığı gerçek kategori listesi
    return MainCategory.values
        .where((category) => category != MainCategory.allCategories)
        .toList();
  }

  //Tüm Kategoriler diye butonun olduğu liste, ana sayfa kategori listview'ında kullanıyorum
  static List<MainCategory> get allCategoryList {
    return MainCategory.values.toList();
  }

  // Deneme Ürün Listesi
  static List<LetGoItem> allItems = [
    // Etkin İlanlar
    LetGoItem(
      id: "1",
      title: "iPhone 14 Pro Max 256GB",
      description:
          "Tertemiz, hiç düşürülmedi. Kutusu ve aksesuarları mevcut. Ekran koruyucu ve kılıf hediye.",
      price: 45000,
      imagePaths: [
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
      ],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2)),
      viewCount: 127,
      condition: ItemCondition.likeNew,
      category: MainCategory.phone, //MainCategory kullanıyoruz
      brand: "Apple",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "2",
      title: "Gaming Laptop MSI RTX 3070",
      description:
          "RTX 3070, 16GB RAM, 1TB SSD. Oyunlarda hiç kasma yok. Gaming mouse hediye.",
      price: 28000,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 5)),
      viewCount: 89,
      condition: ItemCondition.good,
      category: MainCategory.electronics,
      brand: "MSI",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "3",
      title: "Trek Dağ Bisikleti 26 Jant",
      description:
          "Dağ bisikleti, çok az kullanıldı. Lastikleri yeni değiştirildi. Kask hediye.",
      price: 3500,
      imagePaths: [
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1)),
      viewCount: 45,
      condition: ItemCondition.good,
      category: MainCategory.sportsAndOutdoor,
      brand: "Trek",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "4",
      title: "Nike Air Max 270 Erkek Ayakkabı",
      description: "42 numara, çok az giyildi. Kutusu mevcut.",
      price: 650,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 12)),
      viewCount: 34,
      condition: ItemCondition.likeNew,
      category: MainCategory.clothingAndAccessory,
      brand: "Nike",
      isFeatured: true,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "5",
      title: "2015 Model Volkswagen Golf",
      description: "Temiz araç, bakımlı, 150.000 km'de. Hasar kaydı yok.",
      price: 250000,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 3)),
      viewCount: 78,
      condition: ItemCondition.good,
      category: MainCategory.car,
      brand: "Volkswagen",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "14",
      title: "Bebek Arabası Chicco 3in1 Sistem",
      description:
          "Yeni doğandan 3 yaşa kadar kullanılabilir. Puset, ana kucak ve oto koltuğu bir arada. Çok az kullanıldı.",
      price: 2800,
      imagePaths: [
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 14)),
      viewCount: 67,
      condition: ItemCondition.likeNew,
      category: MainCategory.babyAndToys,
      brand: "Chicco",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "15",
      title: "Golden Retriever Yavru Köpek Kulübesi",
      description:
          "Büyük boy köpek kulübesi, su geçirmez, termal izolasyonlu. Çok sağlam yapı.",
      price: 850,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user2",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 1, hours: 8)),
      viewCount: 42,
      condition: ItemCondition.good,
      category: MainCategory.petShop,
      brand: "Ferplast",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "16",
      title: "Ofis Masası ve Döner Koltuk Seti",
      description:
          "Ergonomik ofis masası ve koltuk takımı. Home office için ideal. Çok temiz durumda.",
      price: 1600,
      imagePaths: [
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
      ],
      sellerId: "user4",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 22)),
      viewCount: 38,
      condition: ItemCondition.good,
      category: MainCategory.officeAndStationery,
      brand: "IKEA",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "17",
      title: "Bosch Akülü Vidalama Makinesi Seti",
      description:
          "18V akülü vidalama makinesi, 2 adet akü, şarj aleti ve bit seti dahil. Garantisi mevcut.",
      price: 1200,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 6)),
      viewCount: 29,
      condition: ItemCondition.likeNew,
      category: MainCategory.constructionAndGarden,
      brand: "Bosch",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "18",
      title: "Antika Osmanlı Dönemine Ait Bakır Tepsiler",
      description:
          "El işçiliği bakır tepsiler, 3 adet farklı boyda. Koleksiyoncular için ideal. Sertifikalı.",
      price: 3200,
      imagePaths: [
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
      ],
      sellerId: "user3",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(days: 2, hours: 4)),
      viewCount: 91,
      condition: ItemCondition.fair,
      category: MainCategory.antique,
      brand: "El İşi",
      isFeatured: true,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    // Red İlanlar - Aslında bu listeye ihtiyacım yok, burda 2 tane olması yeterli, sonradan düzenlemeyi unutma !!!, idleride login pagete kendime vereceğim userId'ye  eşleyip ilanlarımda göstericem.
    LetGoItem(
      id: "6",
      title: "Çift Kişilik Yatak Takımı",
      description: "İkea'dan alındı, sadece 6 ay kullanıldı. Çok rahat.",
      price: 1200,
      imagePaths: [
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
        "assets/images/placeholder2.jpg",
      ],
      sellerId: "user3",
      status: ItemStatus.rejected,
      publishDate: DateTime.now().subtract(Duration(days: 7)),
      viewCount: 23,
      condition: ItemCondition.good,
      category: MainCategory.homeAndLiving,
      brand: "IKEA",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "7",
      title: "Eski iPhone 6 (Ekranı Çatlak)",
      description:
          "Ekranı çatlak ama çalışıyor. Yedek telefon olarak kullanılabilir.",
      price: 500,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user4",
      status: ItemStatus.rejected,
      publishDate: DateTime.now().subtract(Duration(days: 10)),
      viewCount: 12,
      condition: ItemCondition.worn,
      category: MainCategory.phone,
      brand: "Apple",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    // Satıldı olanlar
    LetGoItem(
      id: "8",
      title: "PlayStation 5 + 2 Kol + 5 Oyun",
      description:
          "2 kol, 5 oyun hediye. Garantisi vardı. Çok temiz kullanılmış.",
      price: 18000,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user1",
      status: ItemStatus.sold,
      publishDate: DateTime.now().subtract(Duration(days: 15)),
      viewCount: 234,
      condition: ItemCondition.likeNew,
      category: MainCategory.electronics,
      brand: "Sony",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "9",
      title: "3+2+1 Deri Koltuk Takımı",
      description: "3+2+1 koltuk takımı, gerçek deri, çok temiz durumda.",
      price: 8500,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user2",
      status: ItemStatus.sold,
      publishDate: DateTime.now().subtract(Duration(days: 20)),
      viewCount: 156,
      condition: ItemCondition.good,
      category: MainCategory.homeAndLiving,
      brand: "Bellona",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "10",
      title: "MacBook Air M1 13 inch",
      description:
          "1 yıl kullanıldı, çok temiz durumda. Şarj aleti ve kılıf hediye.",
      price: 22000,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user4",
      status: ItemStatus.sold,
      publishDate: DateTime.now().subtract(Duration(days: 12)),
      viewCount: 189,
      condition: ItemCondition.good,
      category: MainCategory.electronics,
      brand: "Apple",
      isFeatured: false,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),

    // Onay bekleyenler
    LetGoItem(
      id: "11",
      title: "DJI Mini 2 Drone Seti",
      description:
          "Az kullanılmış, tüm aksesuarları mevcut. Extra batarya hediye.",
      price: 4500,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user3",
      status: ItemStatus.pending,
      publishDate: DateTime.now().subtract(Duration(hours: 2)),
      viewCount: 5,
      condition: ItemCondition.likeNew,
      category: MainCategory.hobbyBookMusic,
      brand: "DJI",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: false,
    ),

    LetGoItem(
      id: "12",
      title: "L'Oreal Paris Makyaj Seti",
      description: "Yeni açılmış, hiç kullanılmadı. Orijinal kutusunda.",
      price: 250,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user2",
      status: ItemStatus.pending,
      publishDate: DateTime.now().subtract(Duration(hours: 8)),
      viewCount: 18,
      condition: ItemCondition.new_,
      category: MainCategory.beautyAndCare,
      brand: "L'Oreal",
      isFeatured: false,
      isWalletSafe: false,
      hasFreeShipping: true,
    ),

    LetGoItem(
      id: "13",
      title: "Yamaha MT-07 2019 Model",
      description: "Temiz motosiklet, garajda bekletildi. Düşme yok.",
      price: 85000,
      imagePaths: ["assets/images/placeholder2.jpg"],
      sellerId: "user1",
      status: ItemStatus.active,
      publishDate: DateTime.now().subtract(Duration(hours: 18)),
      viewCount: 56,
      condition: ItemCondition.good,
      category: MainCategory.motorcycle,
      brand: "Yamaha",
      isFeatured: true,
      isWalletSafe: true,
      hasFreeShipping: false,
    ),
  ];

  // Temel filtreleme fonksiyonları (aynı kaldı)
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

  // ✅ Kategori bazlı filtreleme (güncellenmiş)
  static List<LetGoItem> getItemsByCategory(MainCategory category) {
    if (category == MainCategory.allCategories) {
      return getActiveItems(); // Tüm kategoriler = Tüm aktif ilanlar
    }
    return allItems
        .where(
          (item) =>
              item.category == category &&
              item.status == ItemStatus.active,
        )
        .toList();
  }

  // ✅ Kategori bazlı ilan sayısı
  static int getItemCountByCategory(MainCategory category) {
    if (category == MainCategory.allCategories) {
      return getActiveItems().length;
    }
    return getItemsByCategory(category).length;
  }

  // Diğer filtreleme fonksiyonları
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

  // Utility fonksiyonları (aynı kaldı)
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

  // Geriye uyumluluk için
  static List<LetGoItem> testItems = getActiveItems();
}
