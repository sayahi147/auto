import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/common/theme_helper.dart';
import 'package:flutter_quiz_app/models/category.dart';
import 'package:flutter_quiz_app/models/quiz.dart';
import 'package:flutter_quiz_app/stores/quiz_store.dart';

class QuizCategoryDetailsScreen extends StatefulWidget {
  static const routeName = '/categoryDetails';
  late Category category;

  QuizCategoryDetailsScreen(this.category, {Key? key}) : super(key: key);

  @override
  _QuizCategoryDetailsScreenState createState() => _QuizCategoryDetailsScreenState(category);
}

class _QuizCategoryDetailsScreenState extends State<QuizCategoryDetailsScreen> {
  late Category category;

  _QuizCategoryDetailsScreenState(this.category);

  late List<Quiz> quizList = [];
  @override
  void initState() {
    var quizStore = QuizStore();
    quizStore.loadQuizListByCategoryAsync(category.id).then((value) {
      setState(() {
        quizList = value;
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
              screenHeader(category),
              Expanded(
                child: categoryDetailsView(quizList),
              ),
            ],
          ),
        ),
      ),
    );
  }

  screenHeader(Category category) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.centerLeft,
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
           // "${category.name} Quiz",
             "التمارين",
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  categoryDetailsView(List<Quiz> quizList) {
    return SingleChildScrollView(
      child: Column(
        children: quizList
            .map((quiz) => GestureDetector(
                  child: categoryDetailsItemView(quiz),
                  onTap: () {
                    Navigator.of(context).pushNamed("/quiz", arguments: quiz);
                  },
                ))
            .toList(),
      ),
    );
  }

  categoryDetailsItemBadge(Quiz quiz) {
  
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ThemeHelper.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            )),
        child: Text(
         
         "٣٠ سؤال",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  categoryDetailsItemView(Quiz quiz) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(bottom: 20),
      decoration: ThemeHelper.roundBoxDeco(),
      child: Stack(
        children: [
          categoryDetailsItemBadge(quiz),
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                
                //Expanded(
                  Container(
                    
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                     // crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        Text(
                          quiz.title,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(quiz.description),
                      ]),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}