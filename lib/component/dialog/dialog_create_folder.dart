import "package:ecm_mobile/state/file_folder.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:provider/provider.dart";


class DialogCreateFolder extends StatelessWidget {
  const DialogCreateFolder({super.key});

  @override
  Widget build(BuildContext context) {
    var folderNameInput = TextEditingController();
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Tạo mới thư mục"),
            const SizedBox(height: 20),
             TextField(
              controller: folderNameInput,
              decoration: const InputDecoration(
                hintText: "Tên thư mục",
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<FileFoldersState>().createFolder(folderNameInput.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.createFolder),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.cancel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
