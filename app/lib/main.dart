import 'package:flutter/material.dart';

import 'package:app/provider/transaction_provider.dart';
import 'package:app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return This_TransactionProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Database',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //DefaultTabController ເພື່ອຈາລະບູວ່າເຮົາຈະສ້າງແທບMenuຈັກອັນ
    final List<String> tabTitles = ['ລາຍການທຸລະກຳ', 'ເພີ່ມຂໍ້ມູນ'];
    return DefaultTabController(
      length: tabTitles.length,
      child:
          //TabBarView ສະແລງວິເຈັດ
          Scaffold(
              backgroundColor: Colors.red,
              body: TabBarView(
                children: [
                  HomeScreen(),
                  FormScreen(),
                ],
              ),
              bottomNavigationBar: TabBar(
                tabs: tabTitles.map((title) {
                  return Tab(
                    icon: title == 'ລາຍການທຸລະກຳ'
                        ? Icon(Icons.list)
                        : Icon(Icons.add),
                    text: title,
                  );
                }).toList(),
              )),
    );
  }
}
