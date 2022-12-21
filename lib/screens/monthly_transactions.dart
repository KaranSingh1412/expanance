import 'package:finance_app/screens/homepage.dart';
import 'package:finance_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MonthlyPage extends StatelessWidget {
  const MonthlyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Monthly Page"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: const CustomAppbar(
        title: "Monthly Page",
      ),
      body: Center(
        child: Text(
          "Nothing here yet :)",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey.shade500,
              ),
        ),
      ),
    );
  }
}
