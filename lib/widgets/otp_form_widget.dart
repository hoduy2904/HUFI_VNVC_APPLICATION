import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPFormWidget extends StatefulWidget {
  final Function onChanged;
  const OTPFormWidget({super.key, required this.onChanged});
  @override
  State<OTPFormWidget> createState() => _OTPFormWidgetState();
}

class _OTPFormWidgetState extends State<OTPFormWidget> {
  String code1 = "";
  String code2 = "";
  String code3 = "";
  String code4 = "";
  String code5 = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              autofocus: true,
              onChanged: ((value) => {
                    if (value.length == 1)
                      {
                        setState(
                          () {
                            code1 = value;
                          },
                        ),
                        FocusScope.of(context).nextFocus()
                      }
                  }),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              onChanged: ((value) => {
                    if (value.length == 1)
                      {
                        setState(
                          () {
                            code2 = value;
                          },
                        ),
                        FocusScope.of(context).nextFocus()
                      }
                  }),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              onChanged: ((value) => {
                    if (value.length == 1)
                      {
                        setState(
                          () {
                            code3 = value;
                          },
                        ),
                        FocusScope.of(context).nextFocus()
                      }
                  }),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              onChanged: ((value) => {
                    if (value.length == 1)
                      {
                        setState(
                          () {
                            code4 = value;
                          },
                        ),
                        FocusScope.of(context).nextFocus()
                      }
                  }),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextField(
              onChanged: ((value) => {
                    if (value.length == 1)
                      {
                        setState((() {
                          String codeFull =
                              code1 + code2 + code3 + code4 + value;
                          widget.onChanged(codeFull);
                        })),
                        FocusScope.of(context).nextFocus()
                      }
                  }),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      ),
    );
  }
}
