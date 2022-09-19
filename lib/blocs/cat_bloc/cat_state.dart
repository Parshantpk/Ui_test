part of 'cat_bloc.dart';

abstract class CatState extends Equatable {


  @override
  List<Object> get props => [];

}

class CatLoadingState extends CatState {}

class CatLoadedState extends CatState {
  List<Cat> allCats;
  List<Cat> featuredCats;


   CatLoadedState({this.allCats = const <Cat>[],  this.featuredCats = const <Cat>[]});

  CatLoadedState copyWith({
    List<Cat>? allCats,
    List<Cat>? featuredCats,
  }) {
    return CatLoadedState(allCats: allCats ?? this.allCats,
        featuredCats: featuredCats ?? this.featuredCats);
  }

  @override
  List<Object> get props => [allCats, featuredCats];
}
