import 'datum.dart';

class ProductModel {
  bool? result;
  String? errorMessage;
  String? errorMessageEn;
  List<Datum>? data;

  ProductModel({
    this.result,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        result: json['result'] as bool?,
        errorMessage: json['error_message'] as String?,
        errorMessageEn: json['error_message_en'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'error_message': errorMessage,
        'error_message_en': errorMessageEn,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
