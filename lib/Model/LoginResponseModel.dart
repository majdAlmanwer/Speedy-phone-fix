class LoginResponseModel {
  String? message;
  String? description;
  String? branchId;
  String? branchName;
  String? empName;

  LoginResponseModel(
      {this.message,
      this.description,
      this.branchId,
      this.branchName,
      this.empName});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    description = json['description'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    empName = json['emp_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['description'] = description;
    data['branch_id'] = branchId;
    data['branch_name'] = branchName;
    data['emp_name'] = empName;
    return data;
  }
}
