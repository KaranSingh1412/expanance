import 'package:hive/hive.dart';

part 'db_transaction.g.dart';

@HiveType(typeId: 0)
class DBTransaction extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  double amount;

  @HiveField(2)
  DateTime dateOfTransaction;

  @HiveField(3)
  List<String> tags;

  DBTransaction(
      {required this.title,
      required this.amount,
      required this.dateOfTransaction,
      required this.tags})
      : super();
}
