import "package:dropdown_button2/dropdown_button2.dart";
import "package:ecm_mobile/component/form_component/multi_selection_box.dart";
import "package:ecm_mobile/component/form_component/text_area.dart";
import "package:ecm_mobile/theme/input.dart";
import "package:flutter/material.dart";

class FormCreateTask extends StatefulWidget {
  const FormCreateTask({super.key});

  @override
  State<FormCreateTask> createState() => _FormCreateTaskState();
}

class _FormCreateTaskState extends State<FormCreateTask> {
  final GlobalKey<FormState> _formTask = GlobalKey<FormState>();
  late String taskName;

  late String _description;
  late List<String> taskAssignor = ["Nguyễn Văn A", "Nguyễn Văn B"];
  late String _selectedAssignor;
  late List<String> worker = ["Nguyễn Văn Z", "Nguyễn Văn X"];
  late String _selectedWorker;
  late Map<String, String> supervisor = {
    "1": "Một",
    "2": "Hai",
    "3":
        "Nguễn văn Aaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
  };

  late List<String> _selectedSupervisor = [];

  TextEditingController dateInput = TextEditingController();
  late DateTimeRange deadline;

  late List<String> status = ["Tạo mới", "Tạo mới 2"];
  late String _selectedStatus;

  void _submitForm() {
    if (_formTask.currentState!.validate()) {
      _formTask.currentState!.save();
      print("Name: $taskName");
    }
  }

  @override
  void dispose() {
    dateInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formTask,
          child: Column(
            children: [
              MyTextArea(key: _formTask),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration:
                      inputDecoration.copyWith(label: const Text("Nội dung")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nhập nội dung công việc";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: DropdownButtonFormField2(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Chọn người giao việc";
                    }
                    return null;
                  },
                  decoration: inputDecoration.copyWith(
                      label: const Text("Người giao việc")),
                  items: taskAssignor
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    _selectedAssignor = value as String;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: DropdownButtonFormField2(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Chọn người thực hiện";
                    }
                    return null;
                  },
                  decoration: inputDecoration.copyWith(
                      label: const Text("Người thực hiện")),
                  items: worker
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    _selectedWorker = value as String;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: FormField<DateTime>(
                    initialValue: DateTime.now(),
                    builder: (FormFieldState field) {
                      return TextField(
                        readOnly: true,
                        controller: dateInput,
                        decoration: inputDecoration.copyWith(
                          label: const Text("Khoảng thời gian"),
                        ),
                        onTap: () async {
                          deadline = (await showDateRangePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now()
                                  .add(const Duration(days: 14))))!;
                          dateInput.text = deadline.toString();
                          print(deadline);
                        },
                      );
                    }),
              ),
              MultiSelectionBox(
                mapItems: supervisor,
                decoration:
                    inputDecoration.copyWith(label: Text("Người giám sát")),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: const Text("Submit"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _formTask.currentState?.reset();
                      },
                      child: const Text("Reset"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
