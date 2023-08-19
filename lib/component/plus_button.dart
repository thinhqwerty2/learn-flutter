import "package:flutter/material.dart";
import "package:ecm_mobile/component/dialog/dialog_create_folder.dart";

class BottomSheetFile extends StatelessWidget {
  const BottomSheetFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      // Đặt chiều cao phù hợp
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: ListView(
        children: [
          _buildButton(
            icon: Icons.create_new_folder,
            label: "Tạo thư mục",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogCreateFolder(); // Hiển thị màn hình B dưới dạng dialog
                },
              );
            },
          ),
          SizedBox(height: 10), // Thêm khoảng cách dọc
          _buildButton(
            icon: Icons.upload_file,
            label: "Tải lên tài liệu",
            onPressed: () {
              print("Create folder");
            },
          ),
          SizedBox(height: 10), // Thêm khoảng cách dọc
          _buildButton(
            icon: Icons.picture_in_picture,
            label: "Tải lên ảnh",
            onPressed: () {
              print("Upload image");
            },
          ),
          SizedBox(height: 10), // Thêm khoảng cách dọc
          _buildButton(
            icon: Icons.camera,
            label: "Chụp ảnh, videos",
            onPressed: () {
              print("Upload image");
            },
          ),
          SizedBox(height: 10), // Thêm khoảng cách dọc
          _buildButton(
            icon: Icons.qr_code,
            label: "Quét tài liệu",
            onPressed: () {
              print("Upload image");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) =>
        Colors.white),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.brown,
          ),
          SizedBox(width: 10), // Thêm khoảng cách ngang
          Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  void showDialogCreateFolder() {

  }
}