import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/Transaction.dart';
import 'package:myapp/provider/transaction_provider.dart';
import 'package:myapp/screens/form_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Myapp'),
        actions: [
          //ປຸ່ມອອກຂາກເເອບ
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.exit_to_app),
          )
          //ປຸ່ມເຂົ້າເເບບformບັນທຶກຂໍ້ມູນ

          // IconButton(
          //   icon: Text('ເເບບformບັນທຶກຂໍ້ມູນ'),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             fullscreenDialog: true,
          //             builder: (context) {
          //               return FormScreen();
          //             }));
          //   },
          // ),
        ],
      ),
      body: Consumer<This_TransactionProvider>(
        builder: (context, This_TransactionProvider provider, child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                'ບໍ່ພົບຂໍ້ມູນ',
                style: TextStyle(fontSize: 40),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: count, //ຈຳນວນ ຂໍ້ມູນ
              itemBuilder: (context, int index) {
                Transaction data = provider.transactions[index];
                return Card(
                  elevation: 6.0, //ເເສງເງົາ
                  margin:
                      //vertical: height
                      //horizontal: width
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      //Circle=ວົງມົນ
                      child: FittedBox(
                        child: Text(data.amount.toString()),
                      ),
                    ),
                    title: Text(data.title), // Fix: Use transaction.title
                    subtitle: Text(data.date
                        .toString()), //=  subtitle: Text(DateFormat("dd/MM/yyyy").format(data.date)),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
