import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/common/theme_helper.dart';
import 'package:flutter_quiz_app/models/category.dart';
import 'package:flutter_quiz_app/screens/quiz_category_details.dart';
import 'package:flutter_quiz_app/stores/quiz_store.dart';

class QuizCategoryScreen extends StatefulWidget {
  static const routeName = '/quizCategory';
  const QuizCategoryScreen({Key? key}) : super(key: key);

  @override
  _QuizCategoryScreenState createState() => _QuizCategoryScreenState();
}

class _QuizCategoryScreenState extends State<QuizCategoryScreen> {
  late List<Category> categoryList = [];
  @override
  void initState() {
    var quizStore = QuizStore();
    quizStore.loadCategoriesAsync().then((value) {
      setState(() {
        categoryList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 500, right: 500),
          alignment: Alignment.center,
          decoration: ThemeHelper.fullScreenBgBoxDecoration(),
          child: Column(
            children: [
              screenHeader(),
              Expanded(
                child: categoryListView(categoryList),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget screenHeader() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          GestureDetector(
            child: Image(
              image: AssetImage("assets/icons/back.png"),
              width: 40,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Text(
            "المحاور",
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Widget categoryListView(List<Category> categoryList) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 20,
        runSpacing: 30,
        direction: Axis.horizontal,
        children: categoryList
            .map((x) => GestureDetector(
                  child: categoryListViewItem(x),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        //here 
                        QuizCategoryDetailsScreen.routeName,
                        arguments: x);
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget categoryListViewItem(Category category) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Image(
            
            image: AssetImage(category.imagePath,),
            width: 80,
          ),
          Expanded(
          child:Text(category.name,style:TextStyle(color:Color.fromARGB(255, 14, 13, 12),fontSize:30)),
          ),
          
        ],
      ),
    );
  }
}
