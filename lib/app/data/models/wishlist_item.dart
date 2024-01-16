class WishlistItem {
  final int wishlistId;
  final int watchId;


  WishlistItem({
    required this.wishlistId,
    required this.watchId,

  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      wishlistId: json['wishlist_id'],
      watchId: json['watch_id'],

    );
  }
}
