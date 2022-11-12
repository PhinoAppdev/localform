import 'dart:core';



// @Entity()
class LocalStorageModel {
  String? one;
  String? two;
  String? three_a;
  String? three_b;
  String? four;
  String? five_A;
  String? five_a_a;
  String? five_a_b;
  String? five_a_c;
  String? five_a_d;
  String? five_a_e;
  String? five_a_f;
  String? five_a_g;
  String? five_a_h;
  String? five_a_i;
  String? five_a_j;
  String? five_a_k;
  String? five_a_l;
  String? five_b;
  String? five_c_a;
  String? five_c_b;
  String? five_c_c;
  String? certify_date;
  String? sign_path_1;
  String? sign_path_2;
  String? sign_path_3;
  String? sign_path_4;
  String? sign_path_5;

  LocalStorageModel({
    this.one,
    this.two,
    this.three_a,
    this.three_b,
    this.four,
    this.five_A,
    this.five_a_a,
    this.five_a_b,
    this.five_a_c,
    this.five_a_d,
    this.five_a_e,
    this.five_a_f,
    this.five_a_g,
    this.five_a_h,
    this.five_a_i,
    this.five_a_j,
    this.five_a_k,
    this.five_a_l,
    this.five_b,
    this.five_c_a,
    this.five_c_b,
    this.five_c_c,
    this.certify_date,
    this.sign_path_1,
    this.sign_path_2,
    this.sign_path_3,
    this.sign_path_4,
    this.sign_path_5,
  });
  Map<String, dynamic> toMap() {
    return {
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
    };
  }
}
