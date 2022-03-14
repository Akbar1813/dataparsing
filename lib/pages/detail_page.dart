import 'package:dataparsing/models/OneEmployee_model.dart';
import 'package:dataparsing/models/employee_model.dart';
import 'package:flutter/material.dart';

import '../services/http_service.dart';

class DetailPage extends StatefulWidget {
  static final String id = 'detail_page';
  final int? employee_id;
  DetailPage({this.employee_id});


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Employee? employee;
  void _apiDataListId(int id) {
    Network.GET(Network.API_GET_ID+id.toString(), Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse(String response){
    EmpOne empOne = Network.paraEmpOne(response);
    setState(() {
      employee = empOne.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _apiDataListId(widget.employee_id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(employee!.employee_name! + '(' + employee!.employee_age!.toString() + ')',style: TextStyle(color: Colors.black,fontSize: 20),),
                SizedBox(height: 20,),
                Text('Salary: ' + employee!.employee_salary!.toString() + '\$',style: TextStyle(color: Colors.black,fontSize: 18),),
              ],
            ),
          ),
        )
    );
  }
}
