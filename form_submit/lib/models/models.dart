// To parse this JSON data, do
//
//     final categorymodels = categorymodelsFromJson(jsonString);

import 'dart:convert';

Categorymodels categorymodelsFromJson(String str) => Categorymodels.fromJson(json.decode(str));

String categorymodelsToJson(Categorymodels data) => json.encode(data.toJson());

class Categorymodels {
    Categorymodels({
        this.response,
        this.error,
        this.message,
        this.resultArray,
    });

    String ? response;
    bool ?error;
    String? message;
    List<ResultArray> ?resultArray;

    factory Categorymodels.fromJson(Map<String, dynamic> json) => Categorymodels(
        response: json["response"],
        error: json["error"],
        message: json["message"],
        resultArray: List<ResultArray>.from(json["result_array"].map((x) => ResultArray.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "error": error,
        "message": message,
        "result_array": List<dynamic>.from(resultArray!.map((x) => x.toJson())),
    };
}

class ResultArray {
    ResultArray({
        this.reportName,
        this.reportPath,
    });

    String ?reportName;
    String ?reportPath;

    factory ResultArray.fromJson(Map<String, dynamic> json) => ResultArray(
        reportName: json["report_name"] == null ? null : json["report_name"],
        reportPath: json["report_path"],
    );

    Map<String, dynamic> toJson() => {
        "report_name": reportName == null ? null : reportName,
        "report_path": reportPath,
    };
}
