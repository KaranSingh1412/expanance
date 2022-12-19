import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:finance_app/provider/defined_tags_provider.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:finance_app/screens/homepage.dart';
import 'package:finance_app/utils/my_themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await TransactionProvider.createTransactionBox();
  await DefinedTagsProvider.createDefinedTagsBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => DefinedTagsProvider()),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Expanance',
        debugShowCheckedModeBanner: false,
        theme: MyThemes.mainTheme,
        home: const HomePage(),
      ),
    );
  }
}
