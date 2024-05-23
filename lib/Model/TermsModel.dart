class TermsConditionsModel {
  List<TermsConditions>? termsConditions;

  TermsConditionsModel({this.termsConditions});

  TermsConditionsModel.fromJson(Map<String, dynamic> json) {
    if (json['TermsConditions'] != null) {
      termsConditions = <TermsConditions>[];
      json['TermsConditions'].forEach((v) {
        termsConditions!.add(TermsConditions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (termsConditions != null) {
      data['TermsConditions'] =
          termsConditions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TermsConditions {
  String? termsConditions;

  TermsConditions({this.termsConditions});

  TermsConditions.fromJson(Map<String, dynamic> json) {
    termsConditions = json['TermsConditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TermsConditions'] = termsConditions;
    return data;
  }
}
