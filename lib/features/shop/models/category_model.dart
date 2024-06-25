import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  String? banner;
  String?productLogo;
  int?productCount;
  String? productBrand;

  String? sectionHeading1;
  String? sectionHeading2;
  String? sectionHeading3;

  String? productImage101;
  String? productTitle101;
  String? productPrice101;

  String? productImage102;
  String? productTitle102;
  String? productPrice102;

  String? productImage103;
  String? productTitle103;
  String? productPrice103;

  String? productImage104;
  String? productTitle104;
  String? productPrice104;

  String? productImage105;
  String? productTitle105;
  String? productPrice105;

  String? productImage106;
  String? productTitle106;
  String? productPrice106;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,

    this.productLogo,
    this.productCount,

    this.parentId = '',
    this.banner,
    this.productBrand,
    this.sectionHeading1,
    this.sectionHeading2,
    this.sectionHeading3,

    this.productImage101,
    this.productTitle101,
    this.productPrice101,
    
    this.productImage102,
    this.productTitle102,
    this.productPrice102,
    
    this.productImage103,
    this.productTitle103,
    this.productPrice103,

    this.productImage104,
    this.productTitle104,
    this.productPrice104,

    this.productImage105,
    this.productTitle105,
    this.productPrice105,

    this.productImage106,
    this.productTitle106,
    this.productPrice106,
  });

  ///Empty Helper Function
  static CategoryModel empty() => CategoryModel(
      id: '',
      name: '',
      image: '',
      isFeatured: false,
      productCount: null,
      productLogo: '',
      banner: '',
      sectionHeading1: '',
      sectionHeading2: '',
      sectionHeading3: '',
      productBrand: '',
      productImage101: '',
      productImage102: '',
      productImage103: '',
      productImage104: '',
      productImage105: '',
      productImage106: '',

      productPrice101: '',
      productPrice102: '',
      productPrice103: '',
      productPrice104: '',
      productPrice105: '',
      productPrice106: '',

      productTitle101: '',
      productTitle102: '',
      productTitle103: '',
      productTitle104: '',
      productTitle105: '',
      productTitle106: '',
      );

  ///Convert Model to Json Structure
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured,
      'productCount':productCount,
      'productLogo':productLogo,
      'banner':banner,

      'sectionHeading1':sectionHeading1,
      'sectionHeading2':sectionHeading2,
      'sectionHeading3':sectionHeading3,

      'productImage101':productImage101,
      'productImage102':productImage102,
      'productImage103':productImage103,
      'productImage104':productImage104,
      'productImage105':productImage105,
      'productImage106':productImage106,

      'productTitle101':productTitle101,
      'productTitle102':productTitle102,
      'productTitle103':productTitle103,
      'productTitle104':productTitle104,
      'productTitle105':productTitle105,
      'productTitle106':productTitle106,

      'productPrice101':productPrice101,
      'productPrice102':productPrice102,
      'productPrice103':productPrice103,
      'productPrice104':productPrice104,
      'productPrice105':productPrice105,
      'productPrice106':productPrice106,

      'productBrand':productBrand,

    };
  }

  /// Map Json Oriented Document Snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          isFeatured: data['isFeatured'] ?? false,
          parentId: data['ParentId'] ?? '',
          productCount: data['productCount'],
          productLogo: data['productLogo']??'',
          banner: data['banner']??'',

          sectionHeading1: data['sectionHeading1']??'',
          sectionHeading2: data['sectionHeading2']??'',
          sectionHeading3: data['sectionHeading3']??'',

          productBrand: data['productBrand']??'',
          

          productImage101: data['productImage101']??'',
          productImage102: data['productImage102']??'',
          productImage103: data['productImage103']??'',
          productImage104: data['productImage104']??'',
          productImage105: data['productImage105']??'',
          productImage106: data['productImage106']??'',

          productPrice101: data['productPrice101']??'',
          productPrice102: data['productPrice102']??'',
          productPrice103: data['productPrice103']??'',
          productPrice104: data['productPrice104']??'',
          productPrice105: data['productPrice105']??'',
          productPrice106: data['productPrice106']??'',


          productTitle101: data['productTitle101']??'',
          productTitle102: data['productTitle102']??'',
          productTitle103: data['productTitle103']??'',
          productTitle104: data['productTitle104']??'',
          productTitle105: data['productTitle105']??'',
          productTitle106: data['productTitle106']??'',
          );
        
    } else {
      return CategoryModel.empty();
    }
  }
}
