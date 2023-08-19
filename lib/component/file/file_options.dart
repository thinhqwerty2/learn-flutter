import "package:ecm_mobile/component/file/file_image_header.dart";
import "package:ecm_mobile/component/file/file_view_share.dart";
import "package:ecm_mobile/model/file_folder/file.dart";
import "package:ecm_mobile/view/mixin/list_tile_maker.dart";
import "package:flutter/material.dart";
class FileAction extends StatelessWidget with ListTileMaker {
  FileAction({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      builder: (BuildContext context, ScrollController scrollController) =>
          Column(
        children: [
          FileImageHeader(file: file,),
          const Divider(thickness: 1),
          Expanded(
            child: ListView(
              children: [
                tile(
                    title: "Chia sẻ",
                    context: context,
                    onTap: () {
                      _showShareOptions(context,file);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showShareOptions(BuildContext context, File file) {
  showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return  FileActionShare(file: file);
      });
}
