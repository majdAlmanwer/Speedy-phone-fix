// ignore_for_file: file_names

class OrderResponseModel {
  String? message;
  String? description;

  OrderResponseModel({this.message, this.description});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['description'] = description;
    return data;
  }
}
