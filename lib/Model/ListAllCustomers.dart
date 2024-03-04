class AllCustomersModel {
  List<AllCustomers>? Allcustomers;

  AllCustomersModel({this.Allcustomers});

  AllCustomersModel.fromJson(Map<String, dynamic> json) {
    if (json['Customers'] != null) {
      Allcustomers = <AllCustomers>[];
      json['Customers'].forEach((v) {
        Allcustomers!.add(new AllCustomers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.Allcustomers != null) {
      data['Customers'] = this.Allcustomers!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cus_id'] = this.cusId;
    data['cus_name'] = this.cusName;
    data['cus_mobile'] = this.cusMobile;
    return data;
  }
}
