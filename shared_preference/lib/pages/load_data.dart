import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadData extends StatefulWidget {
  const LoadData({super.key});

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  String? name;
  int? icon1;
  int? icon2;

  List<IconData> listData = [
    Icons.home,
    Icons.flag,
    Icons.flight,
    Icons.percent
  ];

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
      icon1 = prefs.getInt("icon1");
      icon2 = prefs.getInt("icon2");
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text("Load Data"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            name != null && icon1 != null && icon2 != null
                ? Column(
                    children: [
                      Text(name!),
                      SizedBox(
                        height: 15,
                      ),
                      Icon(listData[icon1!]),
                      SizedBox(
                        height: 15,
                      ),
                      Icon(listData[icon2!]),
                    ],
                  )
                : CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
