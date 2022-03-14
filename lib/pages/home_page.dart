import 'package:dataparsing/models/OneEmployee_model.dart';
import 'package:dataparsing/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:dataparsing/models/employee_model.dart';
import 'package:dataparsing/services/http_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static int? id;
  Employee? employee;
  List <Employee> items = [];
  void _apiDataList() {
    Network.GET(Network.API_GET, Network.paramsEmpty()).then((response) => {
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
    initState() {
      super.initState();
       _apiDataList();

    }
    Future _openDetailPage() async{
    Map getId  = await Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context){
        return DetailPage(employee_id: id!);
      }
    ));
    if(getId.containsKey(id)){
      setState(() {
        id = getId[id];
      });
    }
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Employee list'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i){
            return itemOfList(items[i]);
          },
        )
      );
    }
    Widget itemOfList(Employee employee){
    return GestureDetector(
      onTap: (){
        setState(() {
          id = employee.id;
        });
        _openDetailPage();
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(employee.employee_name! + '(' + employee.employee_age.toString() + ')',style: TextStyle(color: Colors.black,fontSize: 20),),
            SizedBox(height: 20,),
            Text('Salary: ' + employee.employee_salary.toString() + '\$',style: TextStyle(color: Colors.black,fontSize: 18),),
          ],
        ),
      ),
    );
    }
  }