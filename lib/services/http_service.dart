import 'dart:convert';
import 'package:dataparsing/models/OneEmployee_model.dart';
import 'package:dataparsing/models/employeeList_model.dart';
import 'package:http/http.dart';
import 'package:dataparsing/models/employee_model.dart';

import '../models/empUpdate_model.dart';
import '../models/emp_create.dart';
import '../models/emp_delete.dart';
import '../models/employee_modelCreate.dart';


class Network{
  static String BASE = "dummy.restapiexample.com";
  //static Map <String, String> headers = {"Content-type" : "application/json; charset=UTF-8"};


  // http APIs
  static String API_GET = "/api/v1/employees";
  static String API_GET_ID = "/api/v1/employee/"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}


  // http Requests

  static Future<String?> GET(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE, api,params);
    var response = await get(uri);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }




  static Future<String?> POST(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE, api);
    var response = await post(uri,body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }
    return null;
  }
  static Future<String?> PUT(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE, api);
    var response = await put(uri,body: jsonEncode(params));
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async{
    var uri = Uri.http(BASE, api,params);
    var response = await delete(uri,);
    if(response.statusCode == 200){
      return response.body;
    }
    return null;
  }


  // http Params

  static Map<String,String> paramsEmpty(){
    Map<String,String> params = Map();
    return params;
  }

  static Map<String,String> paramsGet(Employee employee){
    Map<String,String> params = Map();
    params.addAll({
      'id' : employee.id.toString(),
    });
    return params;
  }

  static Map <String, String> paramsCreate(EmCreate employee){
    Map<String, String> params = Map();
    params.addAll({
      'name' : employee.name!,
      'salary' : employee.salary.toString(),
      'age' : employee.age.toString(),
    });
    return params;
  }



  static Map <String, String> paramsUpdate(Employee employee){
    Map<String, String> params = Map();
    params.addAll({
      'id' : employee.id.toString(),
      'employee_name': employee.employee_name!,
      'employee_salary' : employee.employee_salary.toString(),
      'employee_age' : employee.employee_age.toString(),
    });
    return params;
  }

  /* http parsing */
  static EmpList paraEmpList(String response){
    dynamic json = jsonDecode(response);
    var data = EmpList.fromJson(json);
    return data;
  }


  static EmpOne paraEmpOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static EmployeeCreate paraEmpCreate(String body){
    dynamic json = jsonDecode(body);
    var data = EmployeeCreate.fromJson(json);
    return data;
  }

  static EmpDelete paraEmpDelete(String body){
    dynamic json = jsonDecode(body);
    var data = EmpDelete.fromJson(json);
    return data;
  }

  static EmpUpdate paraEmpUpdate(String body){
    dynamic json = jsonDecode(body);
    var data = EmpUpdate.fromJson(json);
    return data;
  }

}