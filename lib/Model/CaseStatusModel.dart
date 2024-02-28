// ignore_for_file: file_names

class CaseStatusModel {
  List<CaseStatus>? caseStatus;

  CaseStatusModel({this.caseStatus});

  CaseStatusModel.fromJson(Map<String, dynamic> json) {
    if (json['CaseStatus'] != null) {
      caseStatus = <CaseStatus>[];
      json['CaseStatus'].forEach((v) {
        caseStatus!.add(CaseStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (caseStatus != null) {
      data['CaseStatus'] = caseStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaseStatus {
  String? statusId;
  String? status;

  CaseStatus({this.statusId, this.status});

  CaseStatus.fromJson(Map<String, dynamic> json) {
    statusId = json['status_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_id'] = statusId;
    data['status'] = status;
    return data;
  }
}
