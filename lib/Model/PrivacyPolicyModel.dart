class PrivacyPolicyModel {
  List<PrivacyPolicy>? privacyPolicy;

  PrivacyPolicyModel({this.privacyPolicy});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    if (json['PrivacyPolicy'] != null) {
      privacyPolicy = <PrivacyPolicy>[];
      json['PrivacyPolicy'].forEach((v) {
        privacyPolicy!.add(PrivacyPolicy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (privacyPolicy != null) {
      data['PrivacyPolicy'] = privacyPolicy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrivacyPolicy {
  String? privacyPloicy;

  PrivacyPolicy({this.privacyPloicy});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    privacyPloicy = json['PrivacyPloicy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PrivacyPloicy'] = privacyPloicy;
    return data;
  }
}
