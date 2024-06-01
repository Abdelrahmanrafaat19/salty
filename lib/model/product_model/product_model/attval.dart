import 'attribute.dart';
import 'pivot.dart';

class Attval {
  int? id;
  int? ord;
  int? attributeId;
  String? name;
  String? nameEn;
  String? value;
  dynamic deletedAt;
  String? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userIp;
  dynamic userPcInfo;
  dynamic userAdded;
  String? valueEn;
  Pivot? pivot;
  Attribute? attribute;

  Attval({
    this.id,
    this.ord,
    this.attributeId,
    this.name,
    this.nameEn,
    this.value,
    this.deletedAt,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.userIp,
    this.userPcInfo,
    this.userAdded,
    this.valueEn,
    this.pivot,
    this.attribute,
  });

  factory Attval.fromJson(Map<String, dynamic> json) => Attval(
        id: json['id'] as int?,
        ord: json['ord'] as int?,
        attributeId: json['attribute_id'] as int?,
        name: json['name'] as String?,
        nameEn: json['name_en'] as String?,
        value: json['value'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        isActive: json['is_active'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        userIp: json['user_ip'] as dynamic,
        userPcInfo: json['user_pc_info'] as dynamic,
        userAdded: json['user_added'] as dynamic,
        valueEn: json['value_en'] as String?,
        pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
        attribute: json['attribute'] == null
            ? null
            : Attribute.fromJson(json['attribute'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ord': ord,
        'attribute_id': attributeId,
        'name': name,
        'name_en': nameEn,
        'value': value,
        'deleted_at': deletedAt,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_ip': userIp,
        'user_pc_info': userPcInfo,
        'user_added': userAdded,
        'value_en': valueEn,
        'pivot': pivot?.toJson(),
        'attribute': attribute?.toJson(),
      };
}
