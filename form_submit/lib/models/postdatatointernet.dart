// To parse this JSON data, do
//
//     final LocalUserdatajson = LocalUserdatajsonFromJson(jsonString);

import 'dart:convert';

List<LocalUserdatajson> LocalUserdatajsonFromJson(String str) =>
    List<LocalUserdatajson>.from(
        json.decode(str).map((x) => LocalUserdatajson.fromJson(x)));

String LocalUserdatajsonToJson(List<LocalUserdatajson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalUserdatajson {
  LocalUserdatajson({
    this.id,
    this.one,
    this.two,
    this.threeA,
    this.threeB,
    this.four,
    this.fiveA,
    this.fiveAA,
    this.fiveAB,
    this.fiveAC,
    this.fiveAD,
    this.fiveAE,
    this.fiveAF,
    this.fiveAG,
    this.fiveAH,
    this.fiveAI,
    this.fiveAJ,
    this.fiveAK,
    this.fiveAL,
    this.fiveB,
    this.fiveCA,
    this.fiveCB,
    this.fiveCC,
    this.certifyDate,
    this.signPath1,
    this.signPath2,
    this.signPath3,
    this.signPath4,
    this.signPath5,
  });

  int? id;
  String? one;
  String? two;
  String? threeA;
  String? threeB;
  String? four;
  String? fiveA;
  String? fiveAA;
  String? fiveAB;
  String? fiveAC;
  String? fiveAD;
  String? fiveAE;
  String? fiveAF;
  String? fiveAG;
  String? fiveAH;
  String? fiveAI;
  String? fiveAJ;
  String? fiveAK;
  String? fiveAL;
  String? fiveB;
  String? fiveCA;
  String? fiveCB;
  String? fiveCC;
  String? certifyDate;
  String? signPath1;
  String? signPath2;
  String? signPath3;
  String? signPath4;
  String? signPath5;

  factory LocalUserdatajson.fromJson(Map<String, dynamic> json) =>
      LocalUserdatajson(
        id: json["id"],
        one: json["one"],
        two: json["two"],
        threeA: json["three_a"],
        threeB: json["three_b"],
        four: json["four"],
        fiveA: json["five_A"],
        fiveAA: json["five_a_a"],
        fiveAB: json["five_a_b"],
        fiveAC: json["five_a_c"],
        fiveAD: json["five_a_d"],
        fiveAE: json["five_a_e"],
        fiveAF: json["five_a_f"],
        fiveAG: json["five_a_g"],
        fiveAH: json["five_a_h"],
        fiveAI: json["five_a_i"],
        fiveAJ: json["five_a_j"],
        fiveAK: json["five_a_k"],
        fiveAL: json["five_a_l"],
        fiveB: json["five_b"],
        fiveCA: json["five_c_a"],
        fiveCB: json["five_c_b"],
        fiveCC: json["five_c_c"],
        certifyDate: json["certify_date"],
        signPath1: json["sign_path_1"],
        signPath2: json["sign_path_2"],
        signPath3: json["sign_path_3"],
        signPath4: json["sign_path_4"],
        signPath5: json["sign_path_5"],
      );

  Map<String, Object?> toJson() {
    return {
      "id": id,
      "one": one,
      "two": two,
      "three_a": threeA,
      "three_b": threeB,
      "four": four,
      "five_A": fiveA,
      "five_a_a": fiveAA,
      "five_a_b": fiveAB,
      "five_a_c": fiveAC,
      "five_a_d": fiveAD,
      "five_a_e": fiveAE,
      "five_a_f": fiveAF,
      "five_a_g": fiveAG,
      "five_a_h": fiveAH,
      "five_a_i": fiveAI,
      "five_a_j": fiveAJ,
      "five_a_k": fiveAK,
      "five_a_l": fiveAL,
      "five_b": fiveB,
      "five_c_a": fiveCA,
      "five_c_b": fiveCB,
      "five_c_c": fiveCC,
      "certify_date": certifyDate,
      "sign_path_1": signPath1,
      "sign_path_2": signPath2,
      "sign_path_3": signPath3,
      "sign_path_4": signPath4,
      "sign_path_5": signPath5,
    };
  }
}
