import 'package:finance_app/provider/defined_tags_provider.dart';
import 'package:finance_app/provider/transaction_provider.dart';
import 'package:finance_app/widgets/modal_button.dart';
import 'package:finance_app/widgets/modal_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabbar extends StatefulWidget {
  const CustomTabbar({Key? key, required this.tagButtonCallback})
      : super(key: key);
  final void Function(String) tagButtonCallback;

  @override
  State<CustomTabbar> createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  final TextEditingController _tagNameController = TextEditingController();

  _addNewTag(BuildContext context) async {
    final definedTagsProv =
        Provider.of<DefinedTagsProvider>(context, listen: false);
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
                          if (_tagNameController.text.isNotEmpty &&
                              definedTagsProv.definedTags.length <= 7) {
                            definedTagsProv
                                .addDefinedTag(_tagNameController.text);
                            Navigator.pop(context);
                            setState(() {
                              _tagNameController.text = "";
                            });
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
                  buttonPressed: () => widget.tagButtonCallback("all"),
                  label: "all",
                ),
                ...definedTagsProv.definedTags.map(
                  (tab) {
                    return ModalButton(
                      buttonPressed: () => widget.tagButtonCallback(tab),
                      label: tab,
                    );
                  },
                ).toList(),
                definedTagsProv.definedTags.length <= 7
                    ? IconButton(
                        onPressed: () => _addNewTag(
                            context), //open dialog window and add tag
                        icon: const Icon(Icons.add),
                        iconSize: 15,
                        splashRadius: 16,
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//transactionProv.transactions.where((element) => element.tags.contains(tab)).toList();