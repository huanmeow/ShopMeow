import 'package:flutter/material.dart';

import '../../utils/contants.dart';
class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [

          const SizedBox(width: 10),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...Code", border: InputBorder.none),
            ),
          ),
          IconButton(onPressed: (){

          }, icon:const  Icon(Icons.search)),
          // height: 25,
          //   width: 1.5,
          //   color: Colors.grey,
          // ),
          // IconButton(
          //   onPressed: () {
          //
          //   },
          //   icon: const Icon(
          //     Icons.tune,
          //     color: Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}