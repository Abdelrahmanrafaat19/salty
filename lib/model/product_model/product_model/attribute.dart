class Attribute {
  int? id;
  String? type;
  int? ord;
  String? name;
  String? nameEn;
  int? categoryId;
  String? isActive;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userIp;
  dynamic userPcInfo;
  dynamic userAdded;

  Attribute({
    this.id,
    this.type,
    this.ord,
    this.name,
    this.nameEn,
    this.categoryId,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.userIp,
    this.userPcInfo,
    this.userAdded,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json['id'] as int?,
        type: json['type'] as String?,
        ord: json['ord'] as int?,
        name: json['name'] as String?,
        nameEn: json['name_en'] as String?,
        categoryId: json['category_id'] as int?,
        isActive: json['is_active'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        userIp: json['user_ip'] as dynamic,
        userPcInfo: json['user_pc_info'] as dynamic,
        userAdded: json['user_added'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'ord': ord,
        'name': name,
        'name_en': nameEn,
        'category_id': categoryId,
        'is_active': isActive,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user_ip': userIp,
        'user_pc_info': userPcInfo,
        'user_added': userAdded,
      };
}
