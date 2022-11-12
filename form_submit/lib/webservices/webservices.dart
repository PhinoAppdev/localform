import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/postdatamodel.dart';

var data;
var myresponse;
var responsemessage;
var responseresponse;

Future postData(
  one,
  two,
  three_a,
  three_b,
  four,
  five_A,
  five_a_a,
  five_a_b,
  five_a_c,
  five_a_d,
  five_a_e,
  five_a_f,
  five_a_g,
  five_a_h,
  five_a_i,
  five_a_j,
  five_a_k,
  five_a_l,
  five_b,
  five_c_a,
  five_c_b,
  five_c_c,
  certify_date,
  sign_path_1,
  sign_path_2,
  sign_path_3,
  sign_path_4,
  sign_path_5,
) async {
  // var uri = Uri.parse(
  //     'https://web.stellarinfosys.com/smartest/app_apis/submitForm.php');
  // var get = await http.get(uri);
  // if (get.statusCode == 200) {
  //   var data = jsonDecode(get.body);
  //   print(data);
  // }

  final http.Response response = await http.post(
    Uri.parse(
        'https://web.stellarinfosys.com/smartest/app_apis/submitForm.php'),
    body: {
      'one': one,
      'two': two,
      'three_A': three_a,
      'three_B': three_b.toString(),
      'four': four,
      'five_A': five_A,
      'five_A_a': five_a_a,
      'five_A_b': five_a_b,
      'five_A_c': five_a_c,
      'five_A_d': five_a_d,
      'five_A_e': five_a_e,
      'five_A_f': five_a_f,
      'five_A_g': five_a_g,
      'five_A_h': five_a_h,
      'five_A_i': five_a_i,
      'five_A_j': five_a_j,
      'five_A_k': five_a_l,
      'five_A_l': five_a_l,
      'five_B': five_b,
      'five_C_a': five_c_a,
      'five_C_b': five_c_b,
      'five_C_c': five_c_c,
      'certify_date': certify_date.toString(),
      'sign_path_1': sign_path_1,
      'sign_path_2': sign_path_2,
      'sign_path_3': sign_path_3,
      'sign_path_4': sign_path_4,
      'sign_path_5': sign_path_5,
    },
  );
  if (response != null) {
    var data = json.decode(response.body);
    return data;
  } else {
    throw Exception();
  }
}

getpdf() async {
  final http.Response response = await http.get(
    Uri.parse(
        'https://web.stellarinfosys.com/smartest/app_apis/getReports.php'),
  );
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    print(data);

    // print(myresponse.response + 'my response');
    // print(data.response[0][0]);
    return data;
  } else {
    throw Exception();
  }
  // print(dat)
}
