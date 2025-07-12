class User {
  final String id;
  final String name;
  final String profileImagePath;
  final DateTime memberSince;
  final double rating; // 0 - 5 arasında
  final int followerCount;
  final int followingCount;
  final String bio;
  final String location; // Belki en son yapabilirim.

  const User({
    required this.id,
    required this.name,
    required this.profileImagePath,
    required this.memberSince,
    required this.rating,
    required this.followerCount,
    required this.followingCount,
    required this.bio,
    this.location = "",
  });

  // Üyelik süresini hesapla
  String get membershipDuration {
    final now = DateTime.now();
    final difference = now.difference(memberSince);
    final years = difference.inDays ~/ 365;
    final months = (difference.inDays % 365) ~/ 30;
    
    if (years > 0) {
      return "${years} yıl";
    } else if (months > 0) {
      return "${months} ay";
    } else {
      return "${difference.inDays} gün";
    }
  }
}

