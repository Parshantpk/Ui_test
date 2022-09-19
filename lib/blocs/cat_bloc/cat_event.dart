part of 'cat_bloc.dart';

abstract class CatEvent extends Equatable {
  const CatEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadCatEvent extends CatEvent {}

class UpdateAllCatEvent extends CatEvent {
  final List<Cat> allCats;

  const UpdateAllCatEvent(this.allCats);
  @override
  // TODO: implement props
  List<Object?> get props => [allCats];
}

class UpdateFeaturedCatEvent extends CatEvent {
  final List<Cat> featuredCats;

  const UpdateFeaturedCatEvent(this.featuredCats);
  @override
  // TODO: implement props
  List<Object?> get props => [featuredCats];
}

class AllCatAddEvent extends CatEvent {
  final String title;
  final String image;
  final String description;
  final bool buttonState;
  final int index;

  const AllCatAddEvent({
    required this.title,
    required this.image,
    required this.description,
    required this.buttonState,
    required this.index,
  });
}

class FeaturedCatAddEvent extends CatEvent {
  final String title;
  final String image;
  final String description;
  final bool buttonState;
  final int index;

  const FeaturedCatAddEvent({
    required this.title,
    required this.image,
    required this.description,
    required this.buttonState,
    required this.index,
  });
}

class CatBlocAllCatsRemoveEvent extends CatEvent {
  final int index;

  const CatBlocAllCatsRemoveEvent({required this.index});
}

class CatBlocFeaturedCatRemoveEvent extends CatEvent {
  final int index;

  const CatBlocFeaturedCatRemoveEvent({required this.index});
}
