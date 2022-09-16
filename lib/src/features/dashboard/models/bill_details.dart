// To parse this JSON data, do
//
//     final billDetails = billDetailsFromJson(jsonString);

import 'dart:convert';

List<BillDetails> billDetailsFromJson(String str) => List<BillDetails>.from(json.decode(str).map((x) => BillDetails.fromJson(x)));

String billDetailsToJson(List<BillDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillDetails {
  BillDetails({
   required this.billNo,
   required this.billGenBy,
   required this.billToName,
  });

  String billNo;
  int billGenBy;
  String billToName;

  factory BillDetails.fromJson(Map<String, dynamic> json) => BillDetails(
    billNo: json["bill_no"],
    billGenBy: json["bill_gen_by"],
    billToName: json["bill_to_name"],
  );

  Map<String, dynamic> toJson() => {
    "bill_no": billNo,
    "bill_gen_by": billGenBy,
    "bill_to_name": billToName,
  };
}
