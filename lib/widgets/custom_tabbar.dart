import 'package:finance_app/provider/defined_tags_provider.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:finance_app/screens/homepage.dart';
import 'package:finance_app/widgets/modal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final definedTagsProv = Provider.of<DefinedTagsProvider>(context);
    final transactionProv = Provider.of<TransactionProvider>(context);
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                ModalButton(
                  buttonPressed: () {
                    HomePage.transactionList = transactionProv.transactions;
                  },
                  label: "all",
                ),
                ...definedTagsProv.definedTags.map(
                  (tab) {
                    return ModalButton(
                      buttonPressed: () {
                        HomePage.transactionList = transactionProv.transactions
                            .where((element) => element.tags.contains(tab))
                            .toList();
                      },
                      label: tab,
                    );
                  },
                ).toList(),
                IconButton(
                  onPressed: () {}, //open dialog window and add tag
                  icon: const Icon(Icons.add),
                  iconSize: 15,
                  splashRadius: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
