import "package:ecm_mobile/model/file_folder/file.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class FileImageHeader extends StatelessWidget {
  final File file;

  const FileImageHeader({
    super.key,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder<String>(
        future: file.logoPath,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SvgPicture.string(snapshot.data!);
          }
          return SvgPicture.asset("images/document_icon/blank.svg");
        },
      ),
      Text(file.name),
      Text(file.subtitle),
    ]);
  }
}
