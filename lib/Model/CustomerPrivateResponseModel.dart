class CustomerPrivateModel {
  String? message;
  String? description;

  CustomerPrivateModel({this.message, this.description});

  CustomerPrivateModel.fromJson(Map<String, dynamic> json) {
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
