class EmployeeProfileUpdateRequest {
  final String? phoneNumber;
  final String? address;

  EmployeeProfileUpdateRequest({
    this.phoneNumber,
    this.address,
  });

  factory EmployeeProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      EmployeeProfileUpdateRequest(
        phoneNumber: json["phoneNumber"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
