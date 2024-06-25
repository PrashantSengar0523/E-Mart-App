class Brand {
  final String id;
  final String name;
  final int productCount;
  final String imageUrl;

  Brand({
    required this.id,
    required this.name,
    required this.productCount,
    required this.imageUrl,
  });

  factory Brand.fromMap(Map<String, dynamic> data, String documentId) {
    return Brand(
      id: documentId,
      name: data['name'] ?? '',
      productCount: data['productCount'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
