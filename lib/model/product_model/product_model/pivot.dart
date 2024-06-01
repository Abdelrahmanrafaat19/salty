class Pivot {
  int? productId;
  int? attValId;

  Pivot({this.productId, this.attValId});

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        productId: json['product_id'] as int?,
        attValId: json['att_val_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'att_val_id': attValId,
      };
}
