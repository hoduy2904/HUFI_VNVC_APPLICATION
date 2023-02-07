import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_bloc.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_event.dart';
import 'package:hufi_vnvc_application/blocs/profile_bloc/profile_state.dart';
import 'package:hufi_vnvc_application/models/province_model.dart';
import 'package:hufi_vnvc_application/screens/Auth/code_verify.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/utils/FormControlWidget/form_control.dart';
import 'package:hufi_vnvc_application/utils/RadioButtonWidget/radio_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileInfomationScreen extends StatefulWidget {
  final String? username;
  final String? password;
  final bool fromRegister;
  const ProfileInfomationScreen(
      {this.username, this.password, this.fromRegister = false, super.key});

  @override
  State<ProfileInfomationScreen> createState() =>
      _ProfileInfomationScreenState();
}

class _ProfileInfomationScreenState extends State<ProfileInfomationScreen> {
  var txtDatePicker = TextEditingController();
  List<ProvinceModel> itemss = List.empty();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorTheme.primary,
              title: Text(
                "Thông tin cá nhân",
                style: TypographyTheme.titleBar,
              ),
              centerTitle: true,
            ),
            body: BlocProvider(
                lazy: true,
                create: (context) => ProfileBloc()..add(OnLoadProvince()),
                child: Column(
                  children: [
                    imageProfile(),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: SingleChildScrollView(child: formValidate())),
                  ],
                ))));
  }

  Widget formValidate() {
    bool isFullnameValidate = false;
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state.submitState?.isValid == true && widget.fromRegister == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyCodeScreen(
                      username: widget.username!,
                    )));
      } else if (state.submitState?.isValid == true) {
        Navigator.pop(context);
      }
    }, builder: ((context, state) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FormControl(
                title: "Họ và tên",
                required: true,
                child: TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "NGUYỄN VĂN A",
                    isDense: true,
                    errorText: state.submitState?.submit == true
                        ? state.formInputStatus?.validateFullName
                        : null,
                    hintStyle: const TextStyle(fontSize: 12),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  ),
                  onChanged: (value) {
                    context
                        .read<ProfileBloc>()
                        .add(OnFullNameChange(fullName: value));
                  },
                )),
            FormControl(
                title: "Ngày sinh",
                required: true,
                child: InkWell(
                    child: TextField(
                  style: const TextStyle(fontSize: 12),
                  controller: txtDatePicker,
                  onTap: () async {
                    DateTime? picker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now().add(const Duration(hours: 1)));
                    if (picker != null) {
                      txtDatePicker.text =
                          DateFormat("dd/MM/yyyy").format(picker).toString();
                      context.read<ProfileBloc>().add(OnBirthdayChange(picker));
                    }
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6)),
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: Colors.blue.shade700,
                      ),
                      hintText: "25/12/2001",
                      isDense: true,
                      errorText: state.submitState?.submit == true
                          ? state.formInputStatus?.validateBirthday
                          : null,
                      hintStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 6),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6))),
                ))),
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
                              value: 0,
                              groupValue: state.formInputStatus?.sex,
                              borderRadius: BorderRadius.circular(4),
                              fontSize: 13,
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              onChange: (value) => {
                                    context
                                        .read<ProfileBloc>()
                                        .add(OnSexChange(sex: value))
                                  },
                              text: "Nam")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: RadioButtom(
                              borderRadius: BorderRadius.circular(4),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              value: 1,
                              fontSize: 13,
                              groupValue: state.formInputStatus?.sex,
                              onChange: (value) => {
                                    context
                                        .read<ProfileBloc>()
                                        .add(OnSexChange(sex: value))
                                  },
                              text: "Nữ"))
                    ],
                  ),
                )),
            FormControl(
                title: "Số CMND/CCCD/Passport",
                required: true,
                child: TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "251512351...",
                    isDense: true,
                    errorText: state.submitState?.submit == true
                        ? state.formInputStatus?.validateIdentityCode
                        : null,
                    hintStyle: const TextStyle(fontSize: 12),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  ),
                  onChanged: (value) {
                    context
                        .read<ProfileBloc>()
                        .add(OnIdentityCodeChange(identityCode: value));
                  },
                )),
            FormControl(
                title: "Địa chỉ",
                required: true,
                child: TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    hintText: "Trung tâm VNVC Thành Phố Hồ Chí Minh",
                    isDense: true,
                    errorText: state.submitState?.submit == true
                        ? state.formInputStatus?.validateAddress
                        : null,
                    hintStyle: const TextStyle(fontSize: 12),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  ),
                  onChanged: (value) {
                    context
                        .read<ProfileBloc>()
                        .add(OnAddressChange(address: value));
                  },
                )),
            FormControl(
                title: "Tỉnh/Thành phố",
                required: true,
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButton(
                        value: state.provinceStatus?.codeSelect,
                        isExpanded: true,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        isDense: true,
                        underline: Container(color: Colors.transparent),
                        hint: const Text("Tỉnh - Thành phố"),
                        items: (state.provinceStatus?.status == Status.SUCCESS)
                            ? state.provinceStatus?.provinces?.map((e) {
                                return DropdownMenuItem(
                                  value: e.code,
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList()
                            : null,
                        onChanged: ((value) {
                          context
                              .read<ProfileBloc>()
                              .add(OnProviceChange(value: value));
                        })))),
            FormControl(
                title: "Quận/Huyện",
                required: true,
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: (state.districtStatus?.isValidateDictrict ==
                                        false &&
                                    state.submitState?.submit == true)
                                ? Colors.red
                                : Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButton(
                        value: state.districtStatus?.codeSelect,
                        isExpanded: true,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        isDense: true,
                        underline: Container(color: Colors.transparent),
                        hint: const Text("Quận - Huyện"),
                        items: (state.districtStatus?.status == Status.SUCCESS)
                            ? state.districtStatus!.districts.map((e) {
                                return DropdownMenuItem(
                                  value: e.code,
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList()
                            : null,
                        onChanged: ((value) {
                          context
                              .read<ProfileBloc>()
                              .add(OnDistrictChange(value));
                        })))),
            FormControl(
                title: "Phường/Xã",
                required: true,
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(6)),
                    child: DropdownButton(
                        value: state.wardStatus?.codeSelect,
                        isExpanded: true,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                        isDense: true,
                        underline: Container(color: Colors.transparent),
                        hint: const Text("Phường - Xã"),
                        items: (state.wardStatus?.status == Status.SUCCESS)
                            ? state.wardStatus?.wards
                                .map((e) => DropdownMenuItem(
                                      value: e.code,
                                      child: Text(
                                        e.name,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ))
                                .toList()
                            : null,
                        onChanged: ((value) {
                          context.read<ProfileBloc>().add(OnWardChange(value));
                        })))),
            FormControl(
                title: "Số sổ BHYT",
                child: TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "BHYT",
                      isDense: true,
                      hintStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 6),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6))),
                  onChanged: (value) {
                    context
                        .read<ProfileBloc>()
                        .add(OnInsuranceCodeChange(insuranceCode: value));
                  },
                )),
            FormControl(
                title: "Email",
                child: TextField(
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6)),
                      hintText: "Email",
                      isDense: true,
                      errorText: isFullnameValidate ? "Lỗi" : null,
                      hintStyle: const TextStyle(fontSize: 12),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 6),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6))),
                  onChanged: (value) {
                    context
                        .read<ProfileBloc>()
                        .add(OnEmailChange(email: value));
                  },
                )),
            ElevatedButton(
                onPressed: (() {
                  context.read<ProfileBloc>().add(OnSubmitEvent(
                      isSubmit: true,
                      username: widget.username,
                      password: widget.password));
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => MyApp()));
                }),
                style: ElevatedButton.styleFrom(
                    disabledForegroundColor: Colors.white,
                    disabledBackgroundColor:
                        const Color.fromARGB(255, 127, 151, 213),
                    backgroundColor: ColorTheme.primary,
                    minimumSize: const Size.fromHeight(40)),
                child: const Text("Tiếp tục"))
          ],
        ),
      );
    }));
  }
}

class imageProfile extends StatelessWidget {
  const imageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: ((context, state) => Center(
                child: InkWell(
              onTap: () async {
                PickedFile? pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  File avatar = File(pickedFile.path);
                  context
                      .read<ProfileBloc>()
                      .add(OnChangeAvatarEvent(avatar: avatar));
                }
              },
              child: Stack(
                children: <Widget>[
                  state.avatar == null
                      ? const CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage("assets/image/vaccineDefault.jpg"),
                        )
                      : CircleAvatar(
                          radius: 50.0,
                          backgroundImage: FileImage(state.avatar!)),
                  Positioned(
                      bottom: 0.0,
                      right: 10.0,
                      child: Icon(
                        size: 24,
                        color: Colors.blue.shade700,
                        Icons.camera_alt,
                      ))
                ],
              ),
            ))));
  }
}
