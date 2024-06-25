class CartModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String ?brandName;
  Map<String, String>? selectedVariation;

  CartModel({
    required this.productId,
    this.title='',
    this.price=0.0,
    this.image,
    required this.quantity,
    this.variationId='',
    this.brandName,
    this.selectedVariation,
  });

  static CartModel empty()=>CartModel(productId: '', quantity: 0, );


  Map<String,dynamic> toJson(){
    return{
      'productId':productId,
      'title':title,
      'price':price,
      'image':image,
      'quatity':quantity,
      'variationId':variationId,
      'brandName':brandName,
      'selectedVariation':selectedVariation,
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'],
      brandName: json['brandName'],
      selectedVariation:json['selectedVariation']!=null? Map<String, String>.from(json['selectedVariation']):null,
    );
  }
}
