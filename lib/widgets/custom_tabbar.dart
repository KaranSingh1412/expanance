import 'package:finance_app/provider/defined_tags_provider.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:finance_app/screens/homepage.dart';
import 'package:finance_app/widgets/modal_button.dart';
import 'package:finance_app/widgets/modal_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabbar extends StatelessWidget {
  CustomTabbar({Key? key}) : super(key: key);
  final TextEditingController _tagNameController = TextEditingController();

  _addNewTag(BuildContext context) async {
    final definedTagsProv = Provider.of<DefinedTagsProvider>(context);
    await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          insetPadding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: 180,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModalTextField(
                  label: "Enter a name for the Tag",
                  controller: _tagNameController,
                  submitter: () {},
                  icon: Icons.book,
                  validationCallback: (value) {
                    if (value != null) {
                      if (value.length < 3) {
                        return "Must be at least 3 characters";
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ModalButton(
                        label: "Cancel",
                        buttonPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: ModalButton(
                        label: "Enter",
                        buttonPressed: () {
                          if (_tagNameController.text.isEmpty) {
                          } else {
                            definedTagsProv
                                .addDefinedTag(_tagNameController.text);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                  onPressed: () =>
                      _addNewTag(context), //open dialog window and add tag
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
