// CaseMakeModel
class CaseMakeModel {
  List<CaseMakeModel>? caseMakeModel;

  CaseMakeModel({this.caseMakeModel});

  CaseMakeModel.fromJson(Map<String, dynamic> json) {
    if (json['CaseMakeModel'] != null) {
      caseMakeModel = <CaseMakeModel>[];
      json['CaseMakeModel'].forEach((v) {
        caseMakeModel!.add(new CaseMakeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.caseMakeModel != null) {
      data['CaseMakeModel'] =
          this.caseMakeModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CaseMake {
  String? makemodelId;
  String? makemodel;

  CaseMake({this.makemodelId, this.makemodel});

  CaseMake.fromJson(Map<String, dynamic> json) {
    makemodelId = json['makemodel_id'];
    makemodel = json['makemodel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['makemodel_id'] = this.makemodelId;
    data['makemodel'] = this.makemodel;
    return data;
  }
}
