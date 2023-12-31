import 'package:flutter/material.dart';
import 'package:todo_app/features/home_page/data/models/todo_model.dart';

class CardWidget extends StatelessWidget {
  final Data data;
  final bool  isDefault;

  const CardWidget({Key? key, required this.data , required this.isDefault}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: MediaQuery.of(context).size.width - 15,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(int.parse("0xff${data.color}")),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.time!,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    data.text!,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
             Container(
               height: 20,
               width: 20,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                   border: Border.all(color: Colors.white)
               ),
               child:  Center(child: Icon(Icons.check,color: isDefault ? Colors.white : Colors.transparent,size: 15,)),
             )
            ],
          ),
        ));
  }
}
