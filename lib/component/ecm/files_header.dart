import "../../view/mixin/list_tile_maker.dart";
import "package:flutter/material.dart";

class FilesHeader extends StatelessWidget with ListTileMaker {
  final String title;

  const FilesHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications,),
          onPressed: () {
            print("Hiển thị thông báo");
// Handle icon button press
          },
        ),
        IconButton(onPressed: () {
          print("tìm kiếm");
        }, icon: const Icon(Icons.search_rounded))
      ],
    );
  }
}

AppBar getAppBar(String title) => AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            print("Hiển thị thông báo");
// Handle icon button press
          },
        )
      ],
    );
