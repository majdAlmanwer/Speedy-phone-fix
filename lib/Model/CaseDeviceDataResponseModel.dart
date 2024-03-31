// ignore_for_file: file_names

class CaseDeviceDataResponseModel {
  String? message;
  String? description;

  CaseDeviceDataResponseModel({this.message, this.description});

  CaseDeviceDataResponseModel.fromJson(Map<String, dynamic> json) {
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
