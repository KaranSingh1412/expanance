import 'package:finance_app/provider/defined_tags_provider.dart';
import 'package:finance_app/widgets/modal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({Key? key, required this.onChanged}) : super(key: key);
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    final definedTagsProv = Provider.of<DefinedTagsProvider>(context);
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              children: [
                ...definedTagsProv.definedTags.map(
                  (tab) {
                    return ModalButton(
                      buttonPressed: onChanged,
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
