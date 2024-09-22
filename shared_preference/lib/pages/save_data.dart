import 'package:flutter/material.dart';
import 'package:shared_preference/pages/load_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveData extends StatefulWidget {
  const SaveData({super.key});

  @override
  State<SaveData> createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {
  final TextEditingController nameController = TextEditingController();
  int? selectedIcon1;
  int? selectedIcon2;

  List<IconData> listData = [
    Icons.home,
    Icons.flag,
    Icons.flight,
    Icons.percent
  ];

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", nameController.text);
    await prefs.setInt("icon1", selectedIcon1!);
    await prefs.setInt("icon2", selectedIcon2!);

    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Save Data!"),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(listData.length, (index) {
              return IconButton(
                icon: Icon(
                  listData[index],
                  size: 40,
                ),
                color: selectedIcon1 == index ? Colors.black : Colors.grey,
                onPressed: () {
                  setState(() {
                    selectedIcon1 = index;
                  });
                },
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(listData.length, (index) {
              return IconButton(
                icon: Icon(
                  listData[index],
                  size: 40,
                ),
                color: selectedIcon2 == index ? Colors.black : Colors.grey,
                onPressed: () {
                  setState(() {
                    selectedIcon2 = index;
                  });
                },
              );
            }),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              saveData();
            },
            child: Text("Save Data"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoadData()));
        },
        child: Icon(Icons.flag),
      ),
    );
  }
}
