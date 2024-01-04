import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/common/widgets/my_title.dart';
import 'package:qpay/features/invoice/widgets/add_item.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/spacing.dart';

import '../../common/widgets/my_button.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTitle(text: "invoice"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MyButton(
          text: "generate_invoice",
          onPressed: () => context.push(AppRoutes.generateInvoice),
        ),
      ),
      body: Column(
        children: [
          AddItem(onPressed: () {}),
          const SizedBox(height: medium),
          Expanded(
            child: ListView(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
