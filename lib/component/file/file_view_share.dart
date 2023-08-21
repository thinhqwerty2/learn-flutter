import "package:ecm_mobile/model/file_folder/file.dart";
import "package:ecm_mobile/model/file_folder/folder.dart";
import "package:ecm_mobile/view/mixin/list_tile_maker.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class FileActionShare extends StatelessWidget with ListTileMaker {
  const FileActionShare({
    super.key,
    required this.file,
    // required this.folder,
  });

  final File file;
  // final Folder folder;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) =>
          Column(
        children: [
          // FileImageHeader(docType: docType, title: title, subtitle: subtitle),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return tile(
                  title: AppLocalizations.of(context)!.fileOptions(index),
                  prefixIcon: const Icon(Icons.question_mark),
                  context: context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
