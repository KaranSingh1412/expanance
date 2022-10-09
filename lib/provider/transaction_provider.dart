import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class TransactionProvider extends ChangeNotifier {
  //List<DBTransaction> _transactionList = [];

  /*List<dynamic> get transactions {
    return _transactionList.reversed.toList();
  }*/

  List<DBTransaction> get transactions {
    return Hive.box<DBTransaction>("transactions")
        .values
        .toList()
        .reversed
        .toList();
  }

  void addTransaction(DBTransaction transaction) {
    Hive.box<DBTransaction>("transactions").add(transaction);
    notifyListeners();
  }

  void removeTransaction(DBTransaction transaction) {
    Hive.box<DBTransaction>("transactions").delete(transaction.key);
    notifyListeners();
  }
}
