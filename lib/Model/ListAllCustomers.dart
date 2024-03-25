class AllCustomersModel {
  List<AllCustomers>? Allcustomers;

  AllCustomersModel({this.Allcustomers});

  AllCustomersModel.fromJson(Map<String, dynamic> json) {
    if (json['Customers'] != null) {
      Allcustomers = <AllCustomers>[];
      json['Customers'].forEach((v) {
        Allcustomers!.add(AllCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (Allcustomers != null) {
      data['Customers'] = Allcustomers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCustomers {
  String? cusId;
  String? cusName;
  String? cusMobile;

  AllCustomers({this.cusId, this.cusName, this.cusMobile});

  AllCustomers.fromJson(Map<String, dynamic> json) {
    cusId = json['cus_id'];
    cusName = json['cus_name'];
    cusMobile = json['cus_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cus_id'] = cusId;
    data['cus_name'] = cusName;
    data['cus_mobile'] = cusMobile;
    return data;
  }
}
