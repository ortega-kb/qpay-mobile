import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qpay/core/design/common/widgets/add_profile.dart';
import 'package:qpay/core/design/common/widgets/auth_title.dart';
import 'package:qpay/core/design/common/widgets/m_button.dart';
import 'package:qpay/core/design/common/widgets/subtitle.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/feature/upload_picture/widgets/select_source_tile.dart';

class UploadPictureScreen extends ConsumerStatefulWidget {
  const UploadPictureScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadPictureScreenState();
}

class _UploadPictureScreenState extends ConsumerState<UploadPictureScreen> {
  
  @override
  Widget build(BuildContext context) {
    void showChoiceUploadPicture() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SelectSourceTile(
                    title: AppLocalizations.of(context)!.take_picture,
                    onTap: () {},
                    icon: FontAwesomeIcons.camera,
                  ),
                  SelectSourceTile(
                    title: AppLocalizations.of(context)!.choose_picture,
                    onTap: () {},
                    icon: FontAwesomeIcons.photoFilm,
                  ),
                  const SizedBox(height: medium),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Subtitle(text: AppLocalizations.of(context)!.not_yet),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(medium),
        child: MButton(
          text: AppLocalizations.of(context)!.go,
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: extraLarge),
            AuthTitle(title: AppLocalizations.of(context)!.picture_profile),
            const SizedBox(height: medium),
            Subtitle(text: AppLocalizations.of(context)!.add_profile),
            const SizedBox(height: medium),
            Center(child: AddProfile(onTap: showChoiceUploadPicture))
          ],
        ),
      ),
    );
  }
}
