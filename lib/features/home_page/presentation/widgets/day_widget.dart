
import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final String day;
  final String date;
  final Color cardColor;
  final Color textColor;

  const DayWidget({Key? key , required this.day , required this.date , required this.cardColor , required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Text(
              day,
              style:  TextStyle( fontSize: 17 , color: textColor),
            ),
          ),
          Text(
            date,
            style:  TextStyle( fontSize: 17 , color: textColor),
          )
        ],
      ),
    );
  }
}
