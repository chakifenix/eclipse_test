import 'package:bloc/bloc.dart';
import 'package:eclipse_test/features/home-page/repo/get_albums.dart';
import 'package:eclipse_test/features/home-page/repo/get_person.dart';
import 'package:eclipse_test/features/home-page/repo/get_photos.dart';
import 'package:eclipse_test/model/albums_model.dart';
import 'package:eclipse_test/model/person_list.dart';
import 'package:eclipse_test/model/photos_model.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPerson repo;
  GetAlbums repoAlbums;
  GetPhotos repoPhotos;
  HomeBloc(this.repo, this.repoAlbums, this.repoPhotos)
      : super(const HomeState()) {
    on<LoadInfoList>((event, emit) async {
      // TODO: implement event handler
      try {
        final response = await repo.getPerson();
        final responseAlbum = await repoAlbums.getAlbums();
        final responsePhotos = await repoPhotos.getPhotos();
        final List<PersonList> persons = [];
        final List<Albums> albums = [];
        final List<Photos> photos = [];
        for (Map<String, dynamic> index in response.data) {
          persons.add(PersonList.fromJson(index));
        }
        for (Map<String, dynamic> index in responseAlbum.data) {
          albums.add(Albums.fromJson(index));
        }
        for (Map<String, dynamic> index in responsePhotos.data) {
          photos.add(Photos.fromJson(index));
        }
        emit(state.copyWith(
            personList: persons,
            albums: albums,
            photos: photos,
            status: HomeStateStatus.success));
      } catch (e) {
        emit(state.copyWith(exception: e, status: HomeStateStatus.fail));
      }
    });
  }
}
