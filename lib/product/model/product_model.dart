// class ProductModel {
//   String? sId;
//   String? name;
//   String? description;
//   int? price;
//   String? category;
//   int? iV;
//
//
//   ProductModel({this.sId,
//     this.name,
//     this.description,
//     this.price,
//     this.category,
//     this.iV,
//     });
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     category = json['category'];
//     iV = json['__v'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = sId;
//     data['name'] = name;
//     data['description'] = description;
//     data['price'] = price;
//     data['category'] = category;
//     data['__v'] = iV;
//
//     return data;
//   }
// }
class ProductModel {
  String? id; // Maps to _id
  String? name;
  double? price;
  String? image;
  String? description;
  double? discountAmount;
  String? categoryId;
  int? stock;
  int? created; // Timestamp for creation
  int? modified; // Timestamp for last modification
  int? version;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
    this.discountAmount,
    this.categoryId,
    this.stock,
    this.created,
    this.modified,
    this.version,
  });

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      description: json['description'] as String?,
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String?,
      stock: json['stock'] as int?,
      created: json['created'] as int?,
      modified: json['modified'] as int?,
      version: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'discountAmount': discountAmount,
      'categoryId': categoryId,
      'stock': stock,
      'created': created,
      'modified': modified,
      '__v': version,
    };
  }
}
