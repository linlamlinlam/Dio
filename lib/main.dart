import 'package:flutter/material.dart';
import "package:dio/dio.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String name;
  late String job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dio")),
      body: Center(
        child: Column(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return SimpleDialog(
                            title: const Text("岗位信息"),
                            children: [
                              SimpleDialogOption(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      label: Text("用户名"),
                                      border: OutlineInputBorder()),
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                              ),
                              SimpleDialogOption(
                                child: TextField(
                                  decoration: const InputDecoration(
                                      label: Text("职责"),
                                      border: OutlineInputBorder()),
                                  onChanged: ((value) {
                                    setState(() {
                                      job = value;
                                    });
                                  }),
                                ),
                              ),
                              SimpleDialogOption(
                                child: ElevatedButton(
                                    onPressed: () async {
                                      var res = await Dio().put(
                                          "https://reqres.in/api/api/users/1",
                                          data: {
                                            "name": name,
                                            "job": job,
                                          });
                                      print(res.data);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("修改信息")),
                              )
                            ],
                          );
                        }));
                  },
                  child: const Text("put修改数据"))
            ]),
      ),
    );
  }
}
/* () async {
                    var res = await Dio().put(
                        "https://reqres.in/api/api/users/1",
                        data: {"name": "2", "job": "2"});
                    print(res);
                  }, */