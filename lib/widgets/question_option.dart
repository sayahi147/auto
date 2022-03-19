import 'package:flutter/material.dart';

class QuestionOption extends StatelessWidget {
  bool isSelected;
  String text;
  String optionText;
  int index;

  QuestionOption(this.index, this.optionText, this.text,
      {Key? key, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.topRight,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 231, 7, 63), width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.white),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    //optionText,
                    "",
                    style: TextStyle(
                        color: isSelected
                            ? Color.fromARGB(255, 8, 8, 8)
                            : Theme.of(context).primaryColor,
                        fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
