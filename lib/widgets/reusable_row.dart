import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(title,style: TextStyle(fontSize: 17),),
              Text(value,style: TextStyle(fontSize: 17),)

            ],
          ),
          SizedBox(height: 5.0,),
          Divider()
        ],
      ),
    );
  }
}


