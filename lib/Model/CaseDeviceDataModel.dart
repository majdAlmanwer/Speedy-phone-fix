// CaseDeviceTypeModel
class CaseDeviceTypeModel {
  List<CaseDeviceType>? caseDeviceType;

  CaseDeviceTypeModel({this.caseDeviceType});

  CaseDeviceTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['CaseDeviceType'] != null) {
      caseDeviceType = <CaseDeviceType>[];
      json['CaseDeviceType'].forEach((v) {
        caseDeviceType!.add(CaseDeviceType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (caseDeviceType != null) {
      data['CaseDeviceType'] =
          caseDeviceType!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_type_id'] = deviceTypeId;
    data['device_type'] = deviceType;
    return data;
  }
}
