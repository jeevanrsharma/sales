import 'dart:convert';

import 'package:sales/src/features/dashboard/models/bill_details.dart';
import 'package:http/http.dart' as http;

import '../authentication/models/login.dart';

const String baseUrl = "http://192.168.1.101:8000/api/";

class Services{
  var client = http.Client();

  Future<List<BillDetails>?> getBills() async{
    var uri = Uri.parse(baseUrl+'dashboard');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
        return billDetailsFromJson(json);
    }
  }

  Future<Login?> bill(Login object) async{
    var uri = Uri.parse(baseUrl+'login');
    // var _payload = json.encode(object);
    print(object.userName);
    var response = await client.post(uri,
            body: {
          "user_name": object.userName,"password":object.password
        }
        );
    // print(response.body);
    var json_body = response.body;
      print(json_body);
    if(response.statusCode == 200){
      return Login.fromJson(json.decode(json_body));
    }
  }

}