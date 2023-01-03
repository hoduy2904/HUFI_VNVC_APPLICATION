import 'package:flutter/material.dart';
import 'package:hufi_vnvc_application/main.dart';
import 'package:hufi_vnvc_application/models/province_model.dart';
import 'package:hufi_vnvc_application/network/address_request.dart';
import 'package:hufi_vnvc_application/utils/FormControlWidget/form_control.dart';
import 'package:hufi_vnvc_application/utils/RadioButtonWidget/radio_button.dart';

class ProfileInfomationScreen extends StatefulWidget {
  const ProfileInfomationScreen({super.key});

  @override
  State<ProfileInfomationScreen> createState() =>
      _ProfileInfomationScreenState();
}

class _ProfileInfomationScreenState extends State<ProfileInfomationScreen> {
  String fullName = "";
  String sex = "nam";
  List<ProvinceModel> itemss = List.empty();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddressRequest.fetchProvince().then((value) => {
          setState(() {
            itemss = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Text("Thông tin cá nhân"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                imageProfile(),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: ListView(
                  children: [formValidate(fullName, itemss)],
                )),
              ],
            )));
  }

  Widget formValidate(String fullName, List<ProvinceModel> itemss) {
    FocusNode day = FocusNode();
    FocusNode month = FocusNode();
    FocusNode year = FocusNode();
    bool isFullnameValidate = false;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          FormControl(
              title: "Họ và tên",
              required: true,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "NGUYỄN VĂN A",
                    isDense: true,
                    errorText: isFullnameValidate ? "Lỗi" : null,
                    hintStyle: const TextStyle(fontSize: 12),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3))),
                onChanged: (value) {
                  setState(() => {fullName = value});
                },
              )),
          FormControl(
              title: "Ngày sinh",
              required: true,
              child: Row(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.tight,
                      child: TextField(
                        maxLength: 2,
                        focusNode: day,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "NGÀY",
                            isDense: true,
                            errorText: isFullnameValidate ? "Lỗi" : null,
                            hintStyle: const TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3))),
                        onChanged: (value) {
                          if (value.length > 1) {
                            FocusScope.of(context).requestFocus(month);
                          }
                          setState(() => {fullName = value});
                        },
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: TextField(
                        maxLength: 2,
                        focusNode: month,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "THÁNG",
                            isDense: true,
                            errorText: isFullnameValidate ? "Lỗi" : null,
                            hintStyle: TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3))),
                        onChanged: (value) {
                          if (value.length > 1) {
                            FocusScope.of(context).requestFocus(year);
                          }
                        },
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: TextField(
                        maxLength: 4,
                        focusNode: year,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "NĂM",
                            isDense: true,
                            errorText: isFullnameValidate ? "Lỗi" : null,
                            hintStyle: TextStyle(fontSize: 12),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3))),
                        onChanged: (value) {
                          setState(() => {fullName = value});
                        },
                      )),
                ],
              )),
          FormControl(
              title: "Giới tính",
              required: true,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Row(
                  children: [
                    Expanded(
                        child: RadioButtom(
                            value: "nam",
                            groupValue: sex,
                            borderRadius: BorderRadius.circular(4),
                            fontSize: 13,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            onChange: (value) => {
                                  setState((() {
                                    sex = value;
                                  }))
                                },
                            text: "Nam")),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: RadioButtom(
                            borderRadius: BorderRadius.circular(4),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            value: "nu",
                            fontSize: 13,
                            groupValue: sex,
                            onChange: (value) => {
                                  setState((() {
                                    sex = value;
                                  }))
                                },
                            text: "Nữ"))
                  ],
                ),
              )),
          Row(
            children: [
              Expanded(
                  child: FormControl(
                      title: "Quốc tịch",
                      required: true,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                            isExpanded: true,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            isDense: true,
                            underline: Container(color: Colors.transparent),
                            hint: const Text("Chọn Quốc tịch"),
                            items: itemss
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.name),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: ((value) {})),
                      ))),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: FormControl(
                      title: "Dân tộc",
                      required: true,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                            isExpanded: true,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                            isDense: true,
                            underline: Container(color: Colors.transparent),
                            hint: const Text("Chọn Quốc tịch"),
                            items: itemss
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.name),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: ((value) {})),
                      ))),
            ],
          ),
          FormControl(
              title: "Tỉnh/Thành phố",
              required: true,
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                      isExpanded: true,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      isDense: true,
                      underline: Container(color: Colors.transparent),
                      hint: const Text("Tỉnh - Thành phố"),
                      items: itemss
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      onChanged: ((value) {})))),
          FormControl(
              title: "Quận/Huyện",
              required: true,
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                      isExpanded: true,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      isDense: true,
                      underline: Container(color: Colors.transparent),
                      hint: const Text("Quận - Huyện"),
                      items: itemss
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      onChanged: ((value) {})))),
          FormControl(
              title: "Phường/Xã",
              required: true,
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                      isExpanded: true,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      isDense: true,
                      underline: Container(color: Colors.transparent),
                      hint: const Text("Phường - Xã"),
                      items: itemss
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      onChanged: ((value) {})))),
          FormControl(
              title: "Số sổ BHYT",
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                      isExpanded: true,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      isDense: true,
                      underline: Container(color: Colors.transparent),
                      hint: const Text("Số BHYT"),
                      items: itemss
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      onChanged: ((value) {})))),
          FormControl(
              title: "Email",
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    isDense: true,
                    errorText: isFullnameValidate ? "Lỗi" : null,
                    hintStyle: const TextStyle(fontSize: 12),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3))),
                onChanged: (value) {
                  setState(() => {fullName = value});
                },
              )),
          FormControl(
              title: "Nghề nghiệp",
              child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                      isExpanded: true,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      isDense: true,
                      underline: Container(color: Colors.transparent),
                      hint: const Text("Nghề nghiệp"),
                      items: itemss
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      onChanged: ((value) {})))),
          ElevatedButton(
              onPressed: (() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
              style: ElevatedButton.styleFrom(
                  disabledForegroundColor: Colors.white,
                  disabledBackgroundColor:
                      const Color.fromARGB(255, 127, 151, 213),
                  backgroundColor: Colors.blue.shade800,
                  minimumSize: Size.fromHeight(40)),
              child: const Text("Tiếp tục"))
        ],
      ),
    );
  }
}

Widget imageProfile() {
  return Center(
    child: Stack(
      children: const <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(
              "https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/09/avatar-anime-1.jpg?ssl=1"),
        ),
        Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Icon(
              size: 24,
              color: Colors.white,
              Icons.camera_alt,
            ))
      ],
    ),
  );
}
