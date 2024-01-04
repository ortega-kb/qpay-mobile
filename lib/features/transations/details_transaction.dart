import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/common/widgets/my_title.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/spacing.dart';

class DetailsTransaction extends StatelessWidget {
  const DetailsTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "details_transaction"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: medium),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(middleSmall),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text("Référence"),
                  subtitle: Text("#QP7854152"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.copy_rounded,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
