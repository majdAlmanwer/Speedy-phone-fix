// ignore_for_file: file_names

class CustomerCompanyResponseModel {
  String? message;
  String? description;

  CustomerCompanyResponseModel({this.message, this.description});

  CustomerCompanyResponseModel.fromJson(Map<String, dynamic> json) {
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
