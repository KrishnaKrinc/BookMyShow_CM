import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: const Color.fromARGB(255, 46, 49, 71),
        //title row of text and icons
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Column for text and location
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                // header Text
                Text(
                  'It All Starts Here',
                  style: TextStyle(
                    fontSize: 22.5,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // reactive widget of the user region
                Text(
                  'Salem',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Opacity(
              opacity: 0.0,
              child: Icon(Icons.search),
            ),
            //icons
            // search icon
            const Icon(
              Icons.search_sharp,
              size: 26,
            ),
            // Notification
            const Icon(
              Icons.notifications_none_rounded,
              size: 26,
            ),
            // Qr Scanner Icon
            const Icon(
              Icons.qr_code_scanner_outlined,
              size: 26,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Options list - scrollable - row
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 60,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Recommended and See all row
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Recommended Text
                const Text(
                  'Recommended Movies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                // Text Button for see all option
                TextButton(
                    onPressed: () {
                      print('See All');
                    },
                    child: Row(
                      children: const <Widget>[
                        Text(
                          'See All',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.right,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 8,
                          color: Colors.red,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(height: 15),

          // Movies List - Scrollable - row
          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
                Container(
                  color: Colors.red,
                  width: 105,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
