import 'package:flutter/material.dart';

// Birleştirilmiş kategori enum'ım
enum MainCategory {
  car,                    
  phone,                  
  electronics,            
  homeAndLiving,          
  motorcycle,             
  clothingAndAccessory,   
  beautyAndCare,          
  babyAndToys,           
  hobbyBookMusic,        
  officeAndStationery,   
  sportsAndOutdoor,      
  otherVehicles,         
  constructionAndGarden, 
  petShop,               
  antique,               
  allCategories          
}

//MainCategory için extension - UI'deki isimlendirmeler
extension MainCategoryExtension on MainCategory {
  String get name {
    switch (this) {
      case MainCategory.car:
        return "Araba";
      case MainCategory.phone:
        return "Telefon";
      case MainCategory.electronics:
        return "Elektronik";
      case MainCategory.homeAndLiving:
        return "Ev & Yaşam";
      case MainCategory.motorcycle:
        return "Motosiklet";
      case MainCategory.clothingAndAccessory:
        return "Giyim & Aksesuar";
      case MainCategory.beautyAndCare:
        return "Kişisel Bakım & Kozmetik";
      case MainCategory.babyAndToys:
        return "Anne & Bebek & Oyuncak";
      case MainCategory.hobbyBookMusic:
        return "Hobi & Kitap & Müzik";
      case MainCategory.officeAndStationery:
        return "Ofis & Kırtasiye";
      case MainCategory.sportsAndOutdoor:
        return "Spor & Outdoor";
      case MainCategory.otherVehicles:
        return "Diğer Araçlar";
      case MainCategory.constructionAndGarden:
        return "Yapı Market & Bahçe";
      case MainCategory.petShop:
        return "Pet Shop";
      case MainCategory.antique:
        return "Antika";
      case MainCategory.allCategories:
        return "Tüm kategoriler";
    }
  }

  IconData get icon {
    switch (this) {
      case MainCategory.car:
        return Icons.directions_car;
      case MainCategory.phone:
        return Icons.smartphone;
      case MainCategory.electronics:
        return Icons.computer;
      case MainCategory.homeAndLiving:
        return Icons.home;
      case MainCategory.motorcycle:
        return Icons.motorcycle;
      case MainCategory.clothingAndAccessory:
        return Icons.checkroom;
      case MainCategory.beautyAndCare:
        return Icons.face_retouching_natural;
      case MainCategory.babyAndToys:
        return Icons.child_care;
      case MainCategory.hobbyBookMusic:
        return Icons.headphones;
      case MainCategory.officeAndStationery:
        return Icons.business_center;
      case MainCategory.sportsAndOutdoor:
        return Icons.sports_basketball;
      case MainCategory.otherVehicles:
        return Icons.local_shipping;
      case MainCategory.constructionAndGarden:
        return Icons.construction;
      case MainCategory.petShop:
        return Icons.pets;
      case MainCategory.antique:
        return Icons.museum;
      case MainCategory.allCategories:
        return Icons.apps;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case MainCategory.car:
        return Color.fromRGBO(25, 118, 210, 1);
      case MainCategory.phone:
        return Color.fromRGBO(156, 39, 176, 1);
      case MainCategory.electronics:
        return Color.fromRGBO(38, 166, 154, 1);
      case MainCategory.homeAndLiving:
        return Color.fromRGBO(255, 167, 38, 1);
      case MainCategory.motorcycle:
        return Color.fromRGBO(255, 112, 67, 1);
      case MainCategory.clothingAndAccessory:
        return Color.fromRGBO(239, 83, 80, 1);
      case MainCategory.beautyAndCare:
        return Color.fromRGBO(126, 87, 194, 1);
      case MainCategory.babyAndToys:
        return Color.fromRGBO(41, 182, 246, 1);
      case MainCategory.hobbyBookMusic:
        return Color.fromRGBO(233, 30, 99, 1); 
      case MainCategory.officeAndStationery:
        return Color.fromRGBO(253, 216, 53, 1);
      case MainCategory.sportsAndOutdoor:
        return Color.fromRGBO(102, 187, 106, 1); 
      case MainCategory.otherVehicles:
        return Color.fromRGBO(25, 118, 210, 1); 
      case MainCategory.constructionAndGarden:
        return Color.fromRGBO(139, 195, 74, 1); 
      case MainCategory.petShop:
        return Color.fromRGBO(255, 112, 67, 1); 
      case MainCategory.antique:
        return Color.fromRGBO(212, 175, 55, 1); 
      case MainCategory.allCategories:
        return Color.fromRGBO(239, 83, 80, 1);
    }
  }
}