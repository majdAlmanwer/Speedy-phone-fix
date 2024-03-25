// CustomersByMobileModel
class CustomersByMobile {
  List<Customers>? customers;

  CustomersByMobile({this.customers});

  CustomersByMobile.fromJson(Map<String, dynamic> json) {
    if (json['Customers'] != null) {
      customers = <Customers>[];
      json['Customers'].forEach((v) {
        customers!.add(Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customers != null) {
      data['Customers'] = customers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  String? cusId;
  String? cusName;

  Customers({this.cusId, this.cusName});

  Customers.fromJson(Map<String, dynamic> json) {
    cusId = json['cus_id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cus_id'] = cusId;
    data['cus_name'] = cusName;
    return data;
  }
}
