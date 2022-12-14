import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  final DBTransaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 200,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      DateFormat("dd.MM.yyyy EEEE", "de")
                          .format(transaction.dateOfTransaction)
                          .toString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<TransactionProvider>(context,
                                  listen: false)
                              .removeTransaction(transaction);
                        },
                        icon: const Icon(Icons.delete_forever),
                        splashRadius: 20,
                      ),
                      ...transaction.tags.map((element) {
                        return SizedBox(
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            elevation: 8,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3.0,
                                horizontal: 10,
                              ),
                              child: Text(
                                element,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  transaction.amount > 0
                      ? "+${((transaction.amount * 100).round() / 100).toString()} €"
                      : "${((transaction.amount * 100).round() / 100).toString()} €",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: transaction.amount > 0
                            ? Colors.lightGreenAccent.shade400
                            : Colors.red.shade700,
                        fontWeight: FontWeight.w400,
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
