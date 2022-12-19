import 'package:finance_app/models/db_models/db_transaction.dart';
import 'package:finance_app/provider/defined_tags_provider.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:finance_app/widgets/modal_button.dart';
import 'package:finance_app/widgets/modal_textfield.dart';
import 'package:finance_app/widgets/tag_circle.dart';
import 'package:finance_app/widgets/transactiontype_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum TYPE {
  incoming,
  outgoing,
}

class AddTransactionSheet extends StatefulWidget {
  const AddTransactionSheet({Key? key}) : super(key: key);

  @override
  State<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final Radius borderRadius = const Radius.circular(25);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TYPE transactionType = TYPE.outgoing;
  List<String> transactionTags = ["once"];

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now().add(
        Duration(
          seconds: 2628288 - DateTime.now().day * 24 * 60 * 60,
        ),
      ),
    );

    if (newSelectedDate != null) {
      setState(() {
        selectedDate = newSelectedDate;
      });
    }
  }

  _addTransaction(BuildContext context, String title, double amount,
      DateTime dateOfTransaction, List<String> tags) {
    Provider.of<TransactionProvider>(context, listen: false).addTransaction(
      DBTransaction(
        title: title,
        amount: transactionType == TYPE.incoming ? amount : -amount,
        dateOfTransaction: dateOfTransaction,
        tags: tags,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final definedTagsProv = Provider.of<DefinedTagsProvider>(context);
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: borderRadius,
          topRight: borderRadius,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModalTextField(
              label: "Title",
              controller: titleController,
              submitter: () {},
              icon: Icons.book,
            ),
            Row(
              children: [
                Expanded(
                  child: ModalTextField(
                    label: "Amount",
                    controller: amountController,
                    submitter: () {},
                    icon: Icons.numbers,
                    inputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TransactionTypeButton(
                        backgroundColor: transactionType == TYPE.incoming
                            ? Theme.of(context).colorScheme.surface
                            : Colors.transparent,
                        buttonPressed: () {
                          setState(() {
                            transactionType = TYPE.incoming;
                          });
                        },
                        label: "+",
                      ),
                      TransactionTypeButton(
                        backgroundColor: transactionType == TYPE.outgoing
                            ? Theme.of(context).colorScheme.surface
                            : Colors.transparent,
                        buttonPressed: () {
                          setState(() {
                            transactionType = TYPE.outgoing;
                          });
                        },
                        label: "-",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: const Icon(Icons.calendar_month_rounded),
                      ),
                      Text(
                        DateFormat.yMMMd().format(selectedDate),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...definedTagsProv.definedTags
                          .map((tagLabel) => TagCircle(
                              label: tagLabel, tagList: transactionTags))
                          .toList(),
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: ModalButton(
                buttonPressed: () {
                  var amount =
                      amountController.text.replaceAll(RegExp(r','), '.');
                  _addTransaction(
                    context,
                    titleController.text,
                    double.parse(amount),
                    selectedDate,
                    transactionTags,
                  );
                  Navigator.pop(context);
                },
                label: "Done",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
