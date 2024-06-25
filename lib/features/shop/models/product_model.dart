class Product {
  final String? id;
  final String imageUrls;
  final String saleText;
  final String productTitle;
  final String productBrand;
  final String productPrice;
  final String? productDescription;
  final String? productType;
  final String productRating;
  final String? productActualPrice;
  final bool? productStatus;
  final String? productLogo;
  final String? productReviews;

  Product({
    this.id,
    this.productReviews,
    this.productLogo,
    this.productStatus,
    this.productActualPrice,
    required this.productRating,
    this.productDescription,
    this.productType,
    required this.imageUrls,
    required this.saleText,
    required this.productTitle,
    required this.productBrand,
    required this.productPrice,
  });

  factory Product.fromMap(Map<String, dynamic> map, String id) {
    return Product(
      id: id,
      imageUrls: map['imageUrls'] ?? '',
      saleText: map['saleText'] ?? '',
      productTitle: map['productTitle'] ?? '',
      productBrand: map['productBrand'] ?? '',
      productPrice: map['productPrice'] ?? '',
      productDescription: map['productDescription'] ?? '',
      productType: map['productType'] ?? '',
      productRating: map['productRating'] ?? '',
      productActualPrice: map['productActualPrice'] ?? '',
      productStatus: map['productStatus'] ?? false,
      productLogo: map['productLogo'] ?? '',
      productReviews: map['productReviews'] ?? '',
    );
  }
}
