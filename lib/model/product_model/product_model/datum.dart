import 'product.dart';

class Datum {
  int? id;
  int? ord;
  String? type;
  int? parentId;
  String? name;
  String? img;
  String? details;
  List<Product>? products;

  Datum({
    this.id,
    this.ord,
    this.type,
    this.parentId,
    this.name,
    this.img,
    this.details,
    this.products,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        ord: json['ord'] as int?,
        type: json['type'] as String?,
        parentId: json['parent_id'] as int?,
        name: json['name'] as String?,
        img: json['img'] as String?,
        details: json['details'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ord': ord,
        'type': type,
        'parent_id': parentId,
        'name': name,
        'img': img,
        'details': details,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
