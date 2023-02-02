import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_bloc.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_event.dart';
import 'package:hufi_vnvc_application/blocs/notification_bloc/notification_state.dart';
import 'package:hufi_vnvc_application/themes/color.dart';
import 'package:hufi_vnvc_application/themes/typography.dart';
import 'package:hufi_vnvc_application/utils/Debouncer/debouncer.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var debounce = Debouncer(milliseconds: 1000);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primary,
          title: Text(
            "Thông báo",
            style: TypographyTheme.titleBar,
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
            create: (context) =>
                NotificationBloc()..add(OnLoadNotificationEvent()),
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: ((context, state) {
                if (state.status == NotificationStatus.Loading) {
                  return Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: ColorTheme.primary, size: 24),
                  );
                } else if (state.status == NotificationStatus.Failed) {
                  return Center(
                    child: Text(state.message!),
                  );
                } else if (state.status == NotificationStatus.Success) {
                  if (state.notifications.isEmpty) {
                    return const Center(
                      child: Text("Không có thông báo nào"),
                    );
                  } else {
                    return NotificationListener<ScrollEndNotification>(
                        onNotification: (notification) {
                          if (notification.metrics.maxScrollExtent -
                                  notification.metrics.pixels <
                              20) {
                            debounce.run(() => context
                                .read<NotificationBloc>()
                                .add(OnFetchNotificationEvent()));
                          }
                          return true;
                        },
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                              ...state.notifications.map(
                                (e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              Icons
                                                  .notifications_active_rounded,
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
                                                    .format(e.created),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      if (!e.isSeen)
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
                            ])));
                  }
                } else {
                  return const Center(
                    child: Text("Không có kết nối"),
                  );
                }
              }),
            )));
  }
}
