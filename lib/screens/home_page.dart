import 'dart:io';

import 'package:news/bloc/app_bloc.dart';
import 'package:news/bloc/app_events.dart';
import 'package:news/bloc/app_states.dart';
import 'package:news/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/repositorie/news_repositorie.dart';

class MedData extends StatefulWidget {
  State<MedData> createState() => _MedDataState();
}

class _MedDataState extends State<MedData> {
  String? createdAt;

  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => UserBloc(NewsRepository()))
        ],
        child: Scaffold(
          backgroundColor: Color.fromARGB(241, 255, 255, 255),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text('Новости',
                style: TextStyle(color: Colors.black, fontFamily: 'Stolzl')),
            elevation: 0,
            actions: [],
          ),
          body: blocBody(),
        ));
  }
}

Widget blocBody() {
  return BlocProvider(
    create: (context) => UserBloc(
      NewsRepository(),
    )..add(LoadUserEvent()),
    child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        List<ArticleModel> sensorList = state.sensors;

        return SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 60),
            Center(
                child: Container(
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sensorList.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 116, 116, 116)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Image.network(
                                    '${sensorList[index].urlToImage}',
                                  )),
                              SizedBox(height: 20),
                              Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Автор',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 254, 254),
                                                fontFamily: 'Stolzl',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(height: 5),
                                        Text(
                                            "${sensorList[index].author == null ? 'no data' : '${sensorList[index].author}'} ",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontFamily: 'Stolzl',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400))
                                      ])),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Содержание ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(height: 10),
                                      Text(
                                          '${sensorList[index].content == null ? 'no data' : '${sensorList[index].content}'}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 312,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                168, 176, 176, 176)),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Описание ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                          '${sensorList[index].description == null ? 'no data' : '${sensorList[index].description}'}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 312,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                168, 176, 176, 176)),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: 40,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 20),
                                      Text('Дата публикации: ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        width: 42,
                                      ),
                                      Text(
                                          '${sensorList[index].publishedAt == null ? 'no data' : '${sensorList[index].publishedAt}'}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 312,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                168, 176, 176, 176)),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 40),
                              Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 20),
                                      Text('Источники: ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(width: 30),
                                      Text(
                                          '${sensorList[index].source == null ? 'no data' : '${sensorList[index].source}'}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 312,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                168, 176, 176, 176)),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 40),
                              Padding(
                                  padding: EdgeInsets.only(left: 14),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Заголовок',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                      Text(
                                          '${sensorList[index].title == null ? 'no data' : '${sensorList[index].title}'}',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'Stolzl',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 312,
                                        height: 1,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                168, 176, 176, 176)),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 90)
                            ],
                          )),
                      SizedBox(height: 50)
                    ]);
                  }),
              width: 355,
              height: 900,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            )),
          ],
        ));

        ;
      }
      if (state is UserErrorState)
        return const Center(child: Text('You have no data'));
      return Container();
    }),
  );
}
