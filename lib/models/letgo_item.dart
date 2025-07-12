import 'package:flutter/material.dart';
import 'package:letgo_clone/models/main_category.dart';

class LetGoItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> imagePaths;
  final String sellerId;
  final ItemStatus status;
  final DateTime publishDate;
  final int viewCount;
  final int likeCount;
  final bool isLiked;
  final bool isFeatured;
  final bool isWalletSafe;
  final bool hasFreeShipping;
  final ItemCondition condition;
  final MainCategory category;
  final String brand;

  const LetGoItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imagePaths,
    required this.sellerId,
    required this.status,
    required this.publishDate,
    required this.condition,
    required this.category,
    required this.brand,
    this.viewCount = 0,
    this.likeCount = 0,
    this.isLiked = false,
    this.isFeatured = false,
    this.isWalletSafe = false,
    this.hasFreeShipping = false,
  });

  //Bunu sonradan düzenle, resim zaten koymadan ilan açtırmıyor.
  String get mainImage {
    return imagePaths.isNotEmpty
        ? imagePaths.first
        : 'assets/images/placeholder2.jpg';
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(publishDate);

    if (difference.inDays > 0) {
      return "${difference.inDays} gün önce";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} saat önce";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} dakika önce";
    } else {
      return "Şimdi";
    }
  }

  String get statusText {
    switch (status) {
      case ItemStatus.active:
        return "Etkin";
      case ItemStatus.pending:
        return "Onay Bekliyor";
      case ItemStatus.rejected:
        return "Reddedildi";
      case ItemStatus.sold:
        return "Satıldı";
    }
  }

  Color get statusColor {
    switch (status) {
      case ItemStatus.active:
        return Colors.green;
      case ItemStatus.pending:
        return Colors.orange;
      case ItemStatus.rejected:
        return Colors.red;
      case ItemStatus.sold:
        return Colors.blue;
    }
  }

  String get conditionText {
    switch (condition) {
      case ItemCondition.new_:
        return "Yeni";
      case ItemCondition.likeNew:
        return "Yeni Gibi";
      case ItemCondition.good:
        return "İyi";
      case ItemCondition.fair:
        return "Makul";
      case ItemCondition.worn:
        return "Yıpranmış";
    }
  }

  String get categoryText {
    return category.name;
  }

  //Ürün Kart Tasarımında Güncelleyeceğim
  List<String> get featureBadges {
    List<String> badges = [];
    if (isFeatured) badges.add("Öne Çıkan");
    if (isWalletSafe) badges.add("Cüzdanım Güvende");
    if (hasFreeShipping) badges.add("Ücretsiz Kargo");
    return badges;
  }

  String get formattedId {
    return "#${id.padLeft(8, '0')}";
  }
}

enum ItemStatus { active, pending, rejected, sold }

enum ItemCondition { new_, likeNew, good, fair, worn }
