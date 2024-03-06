import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qpay/core/design/color.dart';
import 'package:qpay/core/design/common/widgets/add_profile.dart';
import 'package:qpay/core/design/common/widgets/auth_title.dart';
import 'package:qpay/core/design/common/widgets/line.dart';
import 'package:qpay/core/design/common/widgets/m_button.dart';
import 'package:qpay/core/design/common/widgets/subtitle.dart';
import 'package:qpay/core/design/common/widgets/tile_container.dart';
import 'package:qpay/core/design/spacing.dart';
import 'package:qpay/core/provider/image_picker_provider.dart';
import 'package:qpay/feature/upload_picture/widgets/select_source_tile.dart';

class UploadPictureScreen extends ConsumerStatefulWidget {
  const UploadPictureScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadPictureScreenState();
}

class _UploadPictureScreenState extends ConsumerState<UploadPictureScreen> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future _pickImageFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        ref
            .watch(imagePickerProvider.notifier)
            .update((_) => File(pickedFile.path));
      }
    }

    Future _pickImageFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        ref
            .watch(imagePickerProvider.notifier)
            .update((_) => File(pickedFile.path));
      }
    }

    void showChoiceUploadPicture() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: background,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(medium),
            child: TileContainer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SelectSourceTile(
                      title: AppLocalizations.of(context)!.take_picture,
                      onTap: _pickImageFromCamera,
                      icon: FontAwesomeIcons.camera,
                    ),
                    const Line(),
                    SelectSourceTile(
                      title: AppLocalizations.of(context)!.choose_picture,
                      onTap: _pickImageFromGallery,
                      icon: FontAwesomeIcons.photoFilm,
                    ),
                  ],
                ),
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
            Center(
              child: AddProfile(
                onTap: showChoiceUploadPicture,
                onDeletePicture: () {
                  ref.read(imagePickerProvider.notifier).update((_) => null);
                },
                image: ref.watch(imagePickerProvider),
              ),
            )
          ],
        ),
      ),
    );
  }
}
