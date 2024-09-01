import 'package:flutter/material.dart';
import 'package:qpay/core/shared/widgets/m_button.dart';
import 'package:qpay/core/theme/app_dimen.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future privacyPolicy({
  required BuildContext context,
  required Function() onTap,
}) {
  return WoltModalSheet.show(
    context: context,
    useSafeArea: true,
    pageListBuilder: (context) {
      return [
        WoltModalSheetPage(
          scrollController: ScrollController(),
          topBarTitle: Text(
            AppLocalizations.of(context)!.see_policy,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          isTopBarLayerAlwaysVisible: true,
          child: Padding(
            padding: EdgeInsets.all(AppDimen.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porta scelerisque massa quis iaculis. Aenean quis molestie tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam fermentum enim ipsum, id consequat dolor imperdiet eu. Cras pellentesque pretium libero, vel porta metus blandit ut. Sed non sollicitudin ligula. Nam ac mollis nulla, in auctor tortor. Nullam a sapien ut libero venenatis posuere. Vestibulum mi odio, fermentum in tristique sit amet, gravida non felis. Sed ultricies odio quis venenatis suscipit.
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus scelerisque rutrum tortor, sit amet sollicitudin erat rutrum sodales. Sed euismod dapibus nisi at ultricies. Aliquam erat volutpat. Vivamus leo risus, fringilla ut pharetra quis, ornare ultrices nulla. Aliquam erat volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent dapibus nibh id ipsum luctus, rhoncus semper mi iaculis. Praesent vitae augue et purus aliquam rhoncus vel ut libero. Quisque volutpat lacus ullamcorper lorem interdum molestie.
Mauris dignissim, turpis convallis efficitur tincidunt, ligula tortor blandit elit, et rhoncus nulla ipsum vel orci. Praesent non ligula gravida, varius urna id, imperdiet mi. Nulla at tristique turpis. Donec pretium, mi sit amet fermentum lacinia, sapien urna iaculis risus, nec sollicitudin arcu mi quis metus. Quisque nec elit dictum, ultricies enim vel, consectetur tortor. Integer ac odio porta, tincidunt sem id, posuere orci. Sed lacinia lobortis ex, nec cursus quam consequat lobortis. Curabitur urna nisl, lacinia eu odio et, elementum malesuada ex. Quisque non ultricies justo, in ornare tellus. Suspendisse tempus, sem vitae rutrum mattis, ligula libero ultrices sapien, consectetur pharetra turpis nibh a est. In pretium ante cursus elit pretium, sed ullamcorper lacus lobortis. Praesent tristique finibus augue at dapibus. Donec nec lorem interdum ex semper eleifend vel quis nunc. Phasellus et mattis sapien. Curabitur ut lectus felis. Vivamus purus elit, accumsan et nisl efficitur, laoreet posuere eros.
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Cras enim erat, pharetra convallis mauris at, tempor consectetur purus. Donec laoreet elit vel lorem lobortis, vitae semper augue sagittis. Vestibulum a eros fringilla enim gravida pretium ut volutpat libero. Vestibulum efficitur, elit et ultrices sollicitudin, turpis ipsum blandit dolor, consequat gravida risus justo non ipsum. Nulla venenatis nisl in quam eleifend porttitor sed id arcu. Vestibulum euismod bibendum turpis id placerat. Vestibulum pellentesque magna ipsum, eu fermentum dolor laoreet eu. Nunc mattis enim eu est fringilla convallis. Aenean sagittis diam lorem. Donec mattis elit non nisi vestibulum, at viverra tortor gravida. Sed scelerisque quam turpis, id tincidunt mauris efficitur in.
Vestibulum leo eros, convallis vitae eros id, laoreet aliquam sem. Nulla scelerisque egestas ante, et elementum eros porttitor eget. Praesent non pretium nulla. Morbi ac sapien diam. Fusce eget rutrum tellus, vel placerat quam. Proin bibendum interdum quam vitae venenatis. In hac habitasse platea dictumst. Nullam at tincidunt ipsum, eget ullamcorper neque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis erat sapien, dapibus quis ipsum eu, fermentum imperdiet lacus. Aliquam ornare, mauris et laoreet pulvinar, quam quam mollis tortor, nec ullamcorper lectus ante vel velit. Duis venenatis leo eget vehicula posuere. Quisque lobortis libero at risus faucibus, vel interdum nibh lacinia."""),
                const SizedBox(height: AppDimen.p16),
                MButton(text: "Compris", onPressed: () {
                  Navigator.of(context).pop();
                  onTap();
                }),
                const SizedBox(height: AppDimen.p16)
              ],
            ),
          ),
        )
      ];
    },
  );
}
