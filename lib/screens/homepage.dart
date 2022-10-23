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
    transactionList = transactionProv.transactions;
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
        return AddTransactionSheet();
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
      appBar: AppBar(
        title: Text(
          "Expanance",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        actions: [
          IconButton(
            onPressed: () {
              /**
               * add Code here TODO
               */
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Current balance",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "estimated",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    totalAmount % 1 == 0
                        ? '$totalAmount'
                        : '${totalAmount.toString().split(".")[0]}.${totalAmount.toString().split(".")[1].substring(0, 2)} €',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: totalAmount < 0
                              ? Colors.red.shade700
                              : Colors.black,
                          fontWeight: totalAmount < 0
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Transaction history",
                    style: Theme.of(context).textTheme.headlineSmall,
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
              : Text(
                  "No Transactions yet",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                ),
        ],
      ),
    );
  }
}
