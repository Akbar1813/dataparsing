import 'package:dataparsing/models/employee_modelCreate.dart.dart.dart';

import 'employee_modelCreate.dart';

class EmployeeCreate{
  String status;
  String message;
  EmCreate data;


  EmployeeCreate.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        data = EmCreate.fromJson(json['data']);

  Map<String, dynamic> toJson() =>{
    'status' : status,
    'message' : message,
    'data' : data.toJson(),
  };
}