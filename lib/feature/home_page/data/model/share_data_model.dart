// To parse this JSON data, do
//
//     final shareDataModel = shareDataModelFromJson(jsonString);

import 'dart:convert';

ShareDataModel shareDataModelFromJson(String str) =>
    ShareDataModel.fromJson(json.decode(str));

String shareDataModelToJson(ShareDataModel data) => json.encode(data.toJson());

class ShareDataModel {
  String? responseCode;
  String? responseMessage;
  Data? data;

  ShareDataModel({
    this.responseCode,
    this.responseMessage,
    this.data,
  });

  factory ShareDataModel.fromJson(Map<String, dynamic> json) => ShareDataModel(
        responseCode: json["response_code"],
        responseMessage: json["response_message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "response_message": responseMessage,
        "data": data?.toJson(),
      };
}

class Data {
  MarketSumary? marketSumary;
  List<Datum>? minuteData;
  List<Datum>? hourData;
  List<Datum>? dayData;
  List<Datum>? monthData;
  List<Datum>? yearlyData;

  Data({
    this.marketSumary,
    this.minuteData,
    this.hourData,
    this.dayData,
    this.monthData,
    this.yearlyData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        marketSumary: json["market_sumary"] == null
            ? null
            : MarketSumary.fromJson(json["market_sumary"]),
        minuteData: json["minute_data"] == null
            ? []
            : List<Datum>.from(
                json["minute_data"]!.map((x) => Datum.fromJson(x))),
        hourData: json["hour_data"] == null
            ? []
            : List<Datum>.from(
                json["hour_data"]!.map((x) => Datum.fromJson(x))),
        dayData: json["day_data"] == null
            ? []
            : List<Datum>.from(json["day_data"]!.map((x) => Datum.fromJson(x))),
        monthData: json["month_data"] == null
            ? []
            : List<Datum>.from(
                json["month_data"]!.map((x) => Datum.fromJson(x))),
        yearlyData: json["yearly_data"] == null
            ? []
            : List<Datum>.from(
                json["yearly_data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "market_sumary": marketSumary?.toJson(),
        "minute_data": minuteData == null
            ? []
            : List<dynamic>.from(minuteData!.map((x) => x.toJson())),
        "hour_data": hourData == null
            ? []
            : List<dynamic>.from(hourData!.map((x) => x.toJson())),
        "day_data": dayData == null
            ? []
            : List<dynamic>.from(dayData!.map((x) => x.toJson())),
        "month_data": monthData == null
            ? []
            : List<dynamic>.from(monthData!.map((x) => x.toJson())),
        "yearly_data": yearlyData == null
            ? []
            : List<dynamic>.from(yearlyData!.map((x) => x.toJson())),
      };
}

class Datum {
  DateTime? date;
  double? index;
  double? change;
  double? percentChange;

  Datum({
    this.date,
    this.index,
    this.change,
    this.percentChange,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        index: json["index"]?.toDouble(),
        change: json["change"]?.toDouble(),
        percentChange: json["percent_change"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "index": index,
        "change": change,
        "percent_change": percentChange,
      };
}

class MarketSumary {
  String? todayNepse;
  double? change;
  double? percentChange;

  MarketSumary({
    this.todayNepse,
    this.change,
    this.percentChange,
  });

  factory MarketSumary.fromJson(Map<String, dynamic> json) => MarketSumary(
        todayNepse: json["today_nepse"],
        change: json["change"]?.toDouble(),
        percentChange: json["percent_change"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "today_nepse": todayNepse,
        "change": change,
        "percent_change": percentChange,
      };
}
