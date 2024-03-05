// CaseDeviceTypeModel
class CaseDeviceTypeModel {
  List<CaseDeviceTypeModel>? caseDeviceType;

  CaseDeviceTypeModel({this.caseDeviceType});

  CaseDeviceTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['CaseDeviceType'] != null) {
      caseDeviceType = <CaseDeviceTypeModel>[];
      json['CaseDeviceType'].forEach((v) {
        caseDeviceType!.add(new CaseDeviceTypeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.caseDeviceType != null) {
      data['CaseDeviceType'] =
          this.caseDeviceType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaseDeviceType {
  String? deviceTypeId;
  String? deviceType;

  CaseDeviceType({this.deviceTypeId, this.deviceType});

  CaseDeviceType.fromJson(Map<String, dynamic> json) {
    deviceTypeId = json['device_type_id'];
    deviceType = json['device_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_type_id'] = this.deviceTypeId;
    data['device_type'] = this.deviceType;
    return data;
  }
}
