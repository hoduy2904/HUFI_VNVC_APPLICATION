import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[800],
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: (Image.network(
              "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/316126447_1841700076168720_2777481558525569042_n.jpg?stp=dst-jpg_s851x315&_nc_cat=109&ccb=1-7&_nc_sid=da31f3&_nc_ohc=lNdanlPyDngAX_7cr-S&tn=Nqzr_mYTj8ovTKiJ&_nc_ht=scontent.fsgn5-8.fna&oh=00_AfDGWr00toLA_db5kdLXEojkfe4cqA78BP6EC8QR8y-T4g&oe=63AA87B3",
              width: 35,
              height: 35,
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text("Chào buổi sáng",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
                Text(
                  "Duy Hồ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      leading: Icon(
        Icons.notifications,
        color: Colors.white,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
