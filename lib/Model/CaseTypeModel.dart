// CaseTypeModel
class CaseTypeModel {
  List<CaseType>? caseType;

  CaseTypeModel({this.caseType});

  CaseTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['CaseType'] != null) {
      caseType = <CaseType>[];
      json['CaseType'].forEach((v) {
        caseType!.add(CaseType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (caseType != null) {
      data['CaseType'] = caseType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaseType {
  String? typeId;
  String? type;

  CaseType({this.typeId, this.type});

  CaseType.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type_id'] = typeId;
    data['type'] = type;
    return data;
  }
}
