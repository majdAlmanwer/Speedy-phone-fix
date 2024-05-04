// ignore_for_file: file_names

class CustomerCompanyModel {
  String? message;
  String? description;

  CustomerCompanyModel({this.message, this.description});

  CustomerCompanyModel.fromJson(Map<String, dynamic> json) {
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
