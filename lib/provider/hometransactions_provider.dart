import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:flutter/cupertino.dart';

class HomeTransactionsProvider extends ChangeNotifier {
  List<DBTransaction> _homeTransactions = [];

  List<DBTransaction> get homeTransactions {
    return _homeTransactions;
  }

  void addHomeTransaction(DBTransaction homeTransaction) {
    _homeTransactions.add(homeTransaction);
    notifyListeners();
  }

  void removeHomeTransaction(DBTransaction homeTransaction) {
    _homeTransactions.remove(homeTransaction);
    notifyListeners();
  }

  void updateHomeTransactionsList(List<DBTransaction> transactionsList) {
    _homeTransactions = transactionsList;
    notifyListeners();
  }
}
