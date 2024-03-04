// CustomersByMobileModel
class CustomersByMobile {
  List<Customers>? customers;

  CustomersByMobile({this.customers});

  CustomersByMobile.fromJson(Map<String, dynamic> json) {
    if (json['Customers'] != null) {
      customers = <Customers>[];
      json['Customers'].forEach((v) {
        customers!.add(new Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customers != null) {
      data['Customers'] = this.customers!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cus_id'] = this.cusId;
    data['cus_name'] = this.cusName;
    return data;
  }
}
