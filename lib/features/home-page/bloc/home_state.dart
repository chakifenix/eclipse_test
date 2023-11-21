part of 'home_bloc.dart';

enum HomeStateStatus { initial, loading, success, fail }

class HomeState extends Equatable {
  final List<PersonList> personList;
  final List<Albums> albums;
  final List<Photos> photos;
  final HomeStateStatus status;
  final Object? exception;

  const HomeState(
      {this.personList = const [],
      this.albums = const [],
      this.photos = const [],
      this.status = HomeStateStatus.initial,
      this.exception});

  bool get isLoading => status == HomeStateStatus.loading;
  bool get isSuccess => status == HomeStateStatus.success;
  bool get isError => status == HomeStateStatus.fail;

  HomeState copyWith(
      {List<PersonList>? personList,
      List<Albums>? albums,
      List<Photos>? photos,
      HomeStateStatus? status,
      Object? exception}) {
    return HomeState(
        personList: personList ?? this.personList,
        albums: albums ?? this.albums,
        photos: photos ?? this.photos,
        status: status ?? this.status,
        exception: exception ?? this.exception);
  }

  @override
  List<Object?> get props => [personList, albums, photos, status, exception];
}
