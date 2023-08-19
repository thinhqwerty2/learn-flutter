import "package:flutter/material.dart";

class EcmWrapper extends StatefulWidget {
  const EcmWrapper({
    super.key,
    required this.title,
    required this.contents,
  });

  final String title;
  final Widget contents;

  @override
  State<EcmWrapper> createState() => _EcmWrapperState();
}

class _EcmWrapperState extends State<EcmWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: const Icon(Icons.search_rounded)),
            IconButton(
              icon: const Icon(
                Icons.notifications,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: widget.contents,
        ));
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            if (this.query.isEmpty) {
              close(context, null);
            } else {
              this.query = "";
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return Text("Bạn vừa tìm kiếm ${this.query}");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            this.query = index.toString();
            showResults(context);
          },
          title: Text(index.toString()),
        );
      },
    );
  }
}
