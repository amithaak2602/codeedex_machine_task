class Product {
  final int id;
  final int partsCat;
  final String partImage;
  final int vBrand;
  final int vCategory;
  final String price;
  final String partsName;
  final String description;
  final double? offerPrice;
  final bool isOffer;
  final String productRating;

  Product({
    required this.id,
    required this.partsCat,
    required this.partImage,
    required this.vBrand,
    required this.vCategory,
    required this.price,
    required this.partsName,
    required this.description,
    this.offerPrice,
    required this.isOffer,
    required this.productRating,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      partsCat: json['parts_Cat'] ?? 0,
      partImage: json['part_image'] ?? "",
      vBrand: json['v_brand'] ?? 0,
      vCategory: json['v_category'],
      price: json['price']??"",
      partsName: json['parts_name'] ?? "",
      description: json['description'],
      offerPrice: json['offer_price'] != null ? (json['offer_price'] as num)
          .toDouble() : null,
      isOffer: json['is_offer'],
      productRating: json['product_rating'] ??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'parts_Cat': partsCat,
      'part_image': partImage,
      'v_brand': vBrand,
      'v_category': vCategory,
      'price': price,
      'parts_name': partsName,
      'description': description,
    };
  }
}