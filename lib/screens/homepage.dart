import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:finance_app/widgets/add_transaction_sheet.dart';
import 'package:finance_app/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

/**
 * TODO:
 * - error handling in addtransaction sheet
 * - add animation list
 * - add multiple bank accounts
 * - add app drawer
 * - replace dropdown with tabbar
 * - replace datetime button with Icon calendar button
 */

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double totalAmount = 0.0; // the total amount
  List<String> items = ["all", "once", "monthly"]; //item filters
  String initialDropdownValue = "all"; //current item filter (initial)
  List<DBTransaction> transactionList = []; //list of transactions

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  void didChangeDependencies() {
    final transactionProv = Provider.of<TransactionProvider>(context);
    transactionList =
        transactionProv.transactions; //get the transactions from the provider
    super.didChangeDependencies();
  }

  ///opens the form for creating/adding a new transaction
  ///
  ///arguments to set for the transactions
  /// - title
  /// - amount
  /// - date of the transaction
  /// - the tags (monthly, once)
  void openTransactionSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const AddTransactionSheet();
      },
    );
  }

  ///gets executed everytime something new renders on the screen
  ///has all the important widgets to render the homepage
  ///
  ///@param context - is the context of the current state to the widget
  @override
  Widget build(BuildContext context) {
    final transactionProv = Provider.of<TransactionProvider>(context);
    if (mounted) {
      totalAmount = transactionProv.transactions
          .map((element) => element.amount)
          .fold(0, (value, element) => value + element);
    }
    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Text(
          "Expanance",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          openTransactionSheet();
        },
        child: const Icon(
          Icons.money,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transaction history",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Text(
                    "${((totalAmount * 100).round() / 100).toString()} €",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: totalAmount < 0
                              ? Colors.red.shade700
                              : Colors.black,
                          fontWeight: totalAmount < 0
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                  ),
                  DropdownButton(
                    value: initialDropdownValue,
                    items: items
                        .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        initialDropdownValue = value!;
                        if (value == "all") {
                          transactionList = transactionProv.transactions;
                        } else {
                          transactionList = transactionProv.transactions
                              .where((element) => element.tags.contains(value))
                              .toList();
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          transactionProv.transactions.isNotEmpty
              ? Expanded(
                  child: AnimatedBuilder(
                    animation: transactionProv,
                    builder: (context, _) => SizedBox(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return transactionList.isNotEmpty
                              ? TransactionCard(
                                  transaction: transactionList[index],
                                )
                              : const SizedBox();
                        },
                        itemCount: transactionList.length,
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    Icon(
                      Icons.attach_money_rounded,
                      color: Colors.grey.shade500,
                      size: 60,
                    ),
                    Text(
                      "No Transactions yet",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
