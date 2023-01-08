import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/utils/ButtonSelectWidget/button_select.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade800,
          title: const Text("Cá nhân"),
          centerTitle: true,
          leading: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          actions: const [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 35.0,
                      backgroundImage: NetworkImage(
                          "https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/09/avatar-anime-1.jpg?ssl=1"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hồ Đức Duy".toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("84348770100 - Nam, 29/04/2001",
                            style: TextStyle(fontSize: 12, color: Colors.white))
                      ],
                    )
                  ],
                ),
              ))),
      body: Container(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              width: 0.5, color: Colors.grey.shade300)),
                      elevation: 0,
                      child: Column(
                        children: [
                          ButtonSelectWidget(
                              lastRow: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                              leading: Icon(
                                Icons.edit,
                                color: Colors.blue.shade800,
                                size: 16,
                              ),
                              child: const Text("Chỉnh sửa tài khoản"),
                              onTab: () => {}),
                          ButtonSelectWidget(
                              lastRow: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                              leading: Icon(
                                Icons.manage_history_outlined,
                                color: Colors.blue.shade800,
                                size: 16,
                              ),
                              child: const Text("Quản lý hồ sơ y tế"),
                              onTab: () => {}),
                          ButtonSelectWidget(
                              lastRow: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                              leading: Icon(
                                Icons.lock_outline,
                                color: Colors.blue.shade800,
                                size: 16,
                              ),
                              child: const Text("Đổi mật khẩu"),
                              onTab: () => {}),
                          ButtonSelectWidget(
                              isBorderButton: false,
                              lastRow: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                              leading: Icon(
                                Icons.logout_outlined,
                                color: Colors.blue.shade800,
                                size: 16,
                              ),
                              child: const Text("Đăng xuất"),
                              onTab: () => {})
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              width: 0.5, color: Colors.grey.shade300)),
                      elevation: 0,
                      child: Column(
                        children: [
                          ButtonSelectWidget(
                              lastRow: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                              leading: Icon(
                                Icons.document_scanner_outlined,
                                color: Colors.blue.shade800,
                                size: 16,
                              ),
                              child: const Text("Điều khoản dịch vụ"),
                              onTab: () => {}),
                          ButtonSelectWidget(
                              lastRow: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Colors.grey,
                              ),
                              leading: Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.blue.shade800,
                                size: 16,
                              ),
                              child: const Text("Chính sách quyền riêng tư"),
                              onTab: () => {}),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
