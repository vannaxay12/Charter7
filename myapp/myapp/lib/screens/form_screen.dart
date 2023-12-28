import 'package:flutter/material.dart';
import 'package:myapp/models/Transaction.dart';
import 'package:myapp/provider/transaction_provider.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController(); //ຮັບຄ່າຊີ່ລາຍການ
  final amountsController = TextEditingController(); //ຮັບຄ່າຈຳນວນเงิน
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເເບບformບັນທຶກຂໍ້ມູນ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: widget.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: new InputDecoration(labelText: 'ຊີ່ລາຍການ'),
                autofocus: true,
                controller:
                    widget.titleController, // Use widget. to access controllers
                validator: (String? str) {
                  if (str == null || str.isEmpty) {
                    return 'ກະລຸນາປ້ອນຊື່';
                  }
                  return null;
                },
              ),
              TextFormField(
                  decoration: new InputDecoration(labelText: 'ຈຳນວນเงิน'),
                  keyboardType: TextInputType.number,
                  controller: widget
                      .amountsController, // Use widget. to access controllers
                  validator: (String? amounts) {
                    if (amounts == null || amounts.isEmpty) {
                      return 'ກະລຸນາປ້ອນຈຳນວນเงิน';
                    }
                    if (double.parse(amounts) <= 0) {
                      return "ກະລຸນາປ້ອນຕົວເລກໃຫ້ໃຫຍ່ກວ່າ  0";
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              TextButton(
                child: Text('PUSH DATA'),
                onPressed: () {
                  if (widget.formKey.currentState?.validate() ?? true) {
                    var title = widget.titleController.text;
                    var amount = widget.amountsController.text;
                    // print(title);
                    // print(amounts);
                    // Use the provider to add a new transaction, for example:
                    Transaction statement = Transaction(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now());

                    var provider = Provider.of<This_TransactionProvider>(
                        context,
                        listen: false);
                    provider.addTransaction(statement);
                    // Navigator.pop(context);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
