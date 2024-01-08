import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qpay/common/widgets/line.dart';
import 'package:qpay/common/widgets/m_title.dart';
import 'package:qpay/common/widgets/row_details.dart';
import 'package:qpay/common/widgets/tile_container.dart';
import 'package:qpay/features/invoice/widgets/add_item.dart';
import 'package:qpay/features/invoice/widgets/item.dart';
import 'package:qpay/features/invoice/widgets/total.dart';
import 'package:qpay/routing/app_routes.dart';
import 'package:qpay/utils/color.dart';
import 'package:qpay/utils/enums/currency.dart';
import 'package:qpay/utils/spacing.dart';

import '../../common/widgets/m_button.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MTitle(text: "invoice"),
        actions: [

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: "generate_invoice",
          onTap: () => context.push(AppRoutes.generateInvoice),
        ),
      ),
      body: Column(
        children: [
          AddItem(onPressed: () {}),
          const SizedBox(height: medium),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(medium),
                  child: TileContainer(
                    child: Column(
                      children: [
                        Item(name: "Jus d'orange", price: 5000, qte: 3),
                        const Line(),
                        Item(name: "Biscuit", price: 3000, qte: 3),
                        const Line(),
                        RowDetails(title: "sub_total", value: "10000.0"),
                        RowDetails(title: "tax_on_sell", value: "5 %"),
                        const Line(),
                        Total()
                      ],
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
