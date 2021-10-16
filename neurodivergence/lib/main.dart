import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: Material(child: MyApp(),),debugShowCheckedModeBanner: false,),);
}

class MyApp extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() => MyAppState();

}

class MyAppState extends State<MyApp>{

  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;
  List items = [
    {'item':"ADHD"},
    {'item':"Autism"},
    {'item':"Dyslexia"},
    {'item':"Dyscalculia"},
    {'item':"Dyspraxia"},
    {'item':"Epilepsy"},
    {'item':"Intellectual Disability"},
    {'item':"Tourettes and Tic Disorder"},
  ];

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(items);
    super.initState();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1.5,color: Colors.lightBlue.withOpacity(0.5)))
            ),
            child: Row(children: [
            Expanded(child: Text(i['item'],)),
            i['item'] == "Neurodivergence Type" ? Icon(Icons.keyboard_arrow_down,size: 35,color: Colors.white,) : Image.asset("asset/${i['item']}.png",width: 35,height: 35,)
          ],),),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: Color(0xff1d58f0),systemNavigationBarIconBrightness: Brightness.light
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xfff9f9f9),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("asset/bg.png",fit: BoxFit.fitWidth,)
                  ],
                ),
                Container(padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                      Row(
                        children: [
                          Expanded(child: Text("Type Of\nNeurodivergence",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),)),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(color: Color(0xff1d58f0),borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: DropdownBelow(
                          hint: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(child: Text("Neurodivergence Type")),
                                Icon(Icons.keyboard_arrow_down,size: 35,color: Colors.white,)
                              ],
                            ),
                          ),
                          itemWidth: MediaQuery.of(context).size.width - 60,
                          itemTextstyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.lightBlue),
                          boxTextstyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                          boxWidth: MediaQuery.of(context).size.width - 60,
                          boxHeight: 50,
                          boxDecoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white54)),
                          value: _selectedTest,
                          items: _dropdownTestItems,
                          onChanged: onChangeDropdownTests,
                        ),
                      )
                  ],
                ),
                )
              ],
            ),
          ),
        ),        
      )),
    );
  }
}
