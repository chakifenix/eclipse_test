import 'package:eclipse_test/features/home-page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.urls2,
      required this.urls,
      required this.index});

  final List urls2;
  final List urls;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 9, right: 9, top: 10),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                            title: Text('Photos'),
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 200,
                                height: 400,
                                child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemCount: urls2.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          // Действие при выборе иконки
                                          Navigator.of(context)
                                              .pop(); // Закрытие диалога
                                        },
                                        child: Image(
                                            image: NetworkImage(
                                                '${urls2[index]}')),
                                      );
                                    }),
                              )
                            ],
                          ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.withOpacity(0.8199999928474426),
                  ),
                  child: Image(
                    image: NetworkImage('${urls[0]}'),
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned(
                  bottom: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${state.personList[index].name} ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '${state.personList[index].company.name}, ${state.personList[index].company.catchPhrase} ${state.personList[index].company.bs}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(
                              'username: ${state.personList[index].username}, email: ${state.personList[index].email}, phone: ${state.personList[index].phone}, website: ${state.personList[index].website}'),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
