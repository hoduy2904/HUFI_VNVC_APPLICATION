import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_bloc.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_state.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primary,
          title: Text(
            "Thông báo",
            style: TypographyTheme.titleBar,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: BlocProvider(
          create: (context) => NotificationBloc(),
          child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: ((context, state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (state is NotificationSuccessState)
                          ...state.notifications.map(
                            (e) => Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.notifications_active_rounded,
                                          color: Colors.blue.shade600),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.content,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            DateFormat("dd/MM/yyyy hh:mm")
                                                .format(e.time),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if (!e.isRead)
                                    Positioned(
                                        top: 3,
                                        right: 10,
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue.shade300,
                                          ),
                                        ))
                                ],
                              ),
                            ),
                          )
                      ]))),
        )));
  }
}
