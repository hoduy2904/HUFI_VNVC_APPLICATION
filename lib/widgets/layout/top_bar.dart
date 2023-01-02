import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget with PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue[800],
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: (Image.network(
              "https://cdn.vox-cdn.com/thumbor/W6YyHkPAoXd8VGz2OGMjqkWWM7E=/0x0:2370x1574/1400x1400/filters:focal(1185x787:1186x788)/cdn.vox-cdn.com/uploads/chorus_asset/file/20103707/Screen_Shot_2020_07_21_at_9.38.25_AM.png",
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
