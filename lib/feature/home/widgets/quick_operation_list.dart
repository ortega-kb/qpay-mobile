import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/feature/home/widgets/quick_operation_tile.dart';

class QuickOperationList extends StatelessWidget {
  const QuickOperationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.arrowRightArrowLeft,
            onTap: () {},
          ),
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.link,
            onTap: () {},
          ),
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.arrowsSpin,
            onTap: () {},
          ),
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.arrowsSpin,
            onTap: () {},
          ),
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.arrowsSpin,
            onTap: () {},
          ),
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.arrowsSpin,
            onTap: () {},
          ),
          const SizedBox(width: medium),
          QuickOperationTile(
            title: "",
            icon: FontAwesomeIcons.arrowsSpin,
            onTap: () {},
          ),
          const SizedBox(width: medium),
        ],
      ),
    );
  }
}
