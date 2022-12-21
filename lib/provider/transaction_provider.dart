import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class TransactionProvider extends ChangeNotifier {
  List<DBTransaction> get transactions {
    return Hive.box<DBTransaction>("transactions")
        .values
        .toList()
        .reversed
        .toList();
  }

  static Future<void> createTransactionBox() async {
    Hive.registerAdapter(DBTransactionAdapter());
    await Hive.openBox<DBTransaction>("transactions");
  }

  void addTransaction(DBTransaction transaction) {
    Hive.box<DBTransaction>("transactions").add(transaction);
    notifyListeners();
  }

  void removeTransaction(DBTransaction transaction) {
    Hive.box<DBTransaction>("transactions").delete(transaction.key);
    notifyListeners();
  }

  List<DBTransaction> getTransactions(String tag) {
    if (tag == "all") {
      return transactions;
    } else {
      return transactions
          .where((element) => element.tags.contains(tag))
          .toList();
    }
  }
}
