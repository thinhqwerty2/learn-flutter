import "package:dropdown_button2/dropdown_button2.dart";
import "package:flutter/material.dart";

class MultiSelectionBox extends StatefulWidget {
  MultiSelectionBox(
      {super.key,
      required this.mapItems,
      this.icon = const Icon(Icons.check_box_outline_blank),
      this.selectedIcon = const Icon(Icons.check_box_outlined),
      this.onChanged,
      this.decoration,
      this.formKey,
      this.dropdownSearchData});

  final Key? formKey;
  final InputDecoration? decoration;
  final Function(String?)? onChanged;
  final Icon icon;
  final Icon selectedIcon;
  final Map<String, String> mapItems;
  DropdownSearchData<String>? dropdownSearchData;

  @override
  State<MultiSelectionBox> createState() {
    return _MultiSelectionBoxState();
  }
}

class _MultiSelectionBoxState extends State<MultiSelectionBox> {
  List<String> selectedItemsId = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
          dropdownSearchData: widget.dropdownSearchData,
          decoration: widget.decoration,
          isExpanded: true,
          items: widget.mapItems.keys.map((key) {
            return DropdownMenuItem(
              value: key,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  final isSelected = selectedItemsId.contains(key);
                  return InkWell(
                    onTap: () {
                      isSelected
                          ? selectedItemsId.remove(key)
                          : selectedItemsId.add(key);
                      //This rebuilds the StatefulWidget to update the button's text
                      setState(() {});
                      //This rebuilds the dropdownMenu Widget to update the check mark
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(widget.mapItems[key]!, maxLines: null),
                          ),
                          const SizedBox(width: 16),
                          if (isSelected) widget.selectedIcon else widget.icon,
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
          value: selectedItemsId.isEmpty ? null : selectedItemsId.last,
          onChanged: (value) => widget.onChanged,
          //Widget will show on select
          selectedItemBuilder: (context) {
            return widget.mapItems.keys.map(
              (key) {
                return Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    selectedItemsId
                        .map((e) => widget.mapItems[e])
                        .toList()
                        .join(", "),
                    maxLines: null,
                  ),
                );
              },
            ).toList();
          },
          key: widget.formKey,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(left: 16, right: 8),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
