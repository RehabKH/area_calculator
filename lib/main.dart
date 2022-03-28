import 'package:area_calculator/shapeContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Area Calculator',
      theme: ThemeData(
        accentColor: Colors.indigo[300],
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedItem = "Rectangle";
  List<String> shapes = ["Rectangle", "Triangle"];
  TextEditingController widthController = new TextEditingController(),
      heightController = new TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Area Calculator"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              children: [
      
                SizedBox(height: 10,),
                DropdownButton(
                  value: selectedItem,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: shapes.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedItem = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
      ShapeContainer(selectedItem),
       SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: widthController,
                  decoration:
                      InputDecoration(hintText: "Width", label: Text("Width")),
                ),
                SizedBox(
                  height: 10,
                ),
      
                TextFormField(
                  controller: heightController,
                  decoration:
                      InputDecoration(hintText: "Height", label: Text("Height")),
                ),
                SizedBox(
                  height: 10,
                ),
      
                TextButton(onPressed: () {
                  
                }, child: Text("Submit Area")),
                SizedBox(
                  height: 10,
                ),
      
                Text("Result: $result",style: TextStyle(color: Colors.indigo[300],fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
