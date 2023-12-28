import 'package:flutter/foundation.dart';
import 'package:myapp/models/Transaction.dart';

class This_TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];
//ດຶງຂໍ້ມຸນ
  List<Transaction> get transactions => _transactions;
// = List<Transaction> get transactions (){return _transactions;}
  void addTransaction(Transaction statement) {
    _transactions.insert(0, statement); //
    notifyListeners(); /*_transactions.insert(0, statement); 
    เป็นการนำ statement (ธุรกรรมใหม่) แทรกเข้าไปในลิสต์ _transactions ที่ตำแหน่งที่ 0 
    หรือตำแหน่งแรกของลิสต์ นั่นคือการเพิ่ม statement ไว้ที่จุดเริ่มต้นของลิสต์อยู่ครับ/ค่ะ*/
  }
}
