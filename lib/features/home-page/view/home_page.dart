import 'package:eclipse_test/features/home-page/bloc/home_bloc.dart';
import 'package:eclipse_test/features/home-page/repo/get_albums.dart';
import 'package:eclipse_test/features/home-page/repo/get_person.dart';
import 'package:eclipse_test/features/home-page/repo/get_photos.dart';
import 'package:eclipse_test/features/home-page/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPerson extends StatelessWidget {
  const InfoPerson({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    List urls = [];
    List urls2 = [];

    PageController page = PageController();
    final homeBloc = HomeBloc(GetPerson(), GetAlbums(), GetPhotos());
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => homeBloc..add(LoadInfoList()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      child: PageView.builder(
                          controller: page,
                          itemCount: state.personList.length,
                          itemBuilder: (context, index) {
                            urls = [];
                            urls2 = [];
                            for (int i = 0; i < state.albums.length; i++) {
                              if (state.personList[index].id ==
                                  state.albums[i].userId) {
                                for (int j = 0; j < state.photos.length; j++) {
                                  if (state.albums[i].id ==
                                      state.photos[j].albumId) {
                                    urls.add(state.photos[j].url);
                                    urls2.add(state.photos[j].thumbnailUrl);
                                  }
                                }
                              }
                            }

                            return CardWidget(
                                urls2: urls2, urls: urls, index: index);
                          }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          page.previousPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.ease);
                        },
                        child: Container(
                            width: 50,
                            height: 30,
                            color: Colors.red,
                            child: Center(child: Text('Пред'))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          page.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.ease);
                        },
                        child: Container(
                            width: 50,
                            height: 30,
                            color: Colors.red,
                            child: Center(child: Text('Следующий'))),
                      ),
                    ],
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )),
    );
  }
}
