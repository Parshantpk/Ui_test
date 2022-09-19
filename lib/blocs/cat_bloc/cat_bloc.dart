import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cat_model.dart';
import '../../repositories/cat_repository.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository _catRepository;
  StreamSubscription? _allCatsSubscription;
  StreamSubscription? _featuredSubscription;

  CatBloc({required CatRepository catRepository})
      : _catRepository = catRepository,
        super(CatLoadingState()) {
    on<LoadCatEvent>(_onLoadCatEvent);
    on<UpdateAllCatEvent>(_onUpdateCatEvent);
    on<UpdateFeaturedCatEvent>(_onUpdateFeaturedCatEvent);
    on<AllCatAddEvent>(_onAllCatAddEvent);
    on<FeaturedCatAddEvent>(_onFeaturedCatAddEvent);
    on<CatBlocAllCatsRemoveEvent>(_onCatBlocAllCatsRemoveEvent);
    on<CatBlocFeaturedCatRemoveEvent>(_onCatBlocFeaturedCatRemoveEvent);
  }

  void _onLoadCatEvent(LoadCatEvent event, Emitter<CatState> emitter) {
    _allCatsSubscription?.cancel();
    _featuredSubscription?.cancel();
    _allCatsSubscription = _catRepository.getAllCats().listen(
          (cats) => add(
            UpdateAllCatEvent(cats),
          ),
        );

    _featuredSubscription = _catRepository.getFeaturedCats().listen(
          (featuredCats) => add(
            UpdateFeaturedCatEvent(featuredCats),
          ),
        );
  }

  void _onUpdateCatEvent(UpdateAllCatEvent event, Emitter<CatState> emitter) {
    if (state is CatLoadedState) {
      emitter((state as CatLoadedState)
          .copyWith(allCats: event.allCats, featuredCats: null));
    } else {
      emitter(CatLoadedState(allCats: event.allCats));
    }
  }

  void _onUpdateFeaturedCatEvent(
      UpdateFeaturedCatEvent event, Emitter<CatState> emitter) {
    if (state is CatLoadedState) {
      emitter((state as CatLoadedState)
          .copyWith(featuredCats: event.featuredCats, allCats: null));
    } else {
      emitter(CatLoadedState(featuredCats: event.featuredCats));
    }
  }

  FutureOr<void> _onAllCatAddEvent(
      AllCatAddEvent event, Emitter<CatState> emitter) {
    String title = event.title;
    String image = event.image;
    String description = event.description;
    bool buttonState = event.buttonState;
    int index = event.index;
    _catRepository.addFromAllCat(
      title: title,
      image: image,
      description: description,
      buttonState: buttonState,
      index: index,
    );
  }

  FutureOr<void> _onFeaturedCatAddEvent(
      FeaturedCatAddEvent event, Emitter<CatState> emitter) {
    String title = event.title;
    String image = event.image;
    String description = event.description;
    bool buttonState = event.buttonState;
    int index = event.index;
    _catRepository.addFromFeaturedCat(
      title: title,
      image: image,
      description: description,
      buttonState: buttonState,
      index: index,
    );
  }

  FutureOr<void> _onCatBlocAllCatsRemoveEvent(
      CatBlocAllCatsRemoveEvent event, Emitter<CatState> emitter) {
    int index = event.index;
    _catRepository.removeCatOnCatBlocAllCatsEvent(index: index);
  }

  FutureOr<void> _onCatBlocFeaturedCatRemoveEvent(
      CatBlocFeaturedCatRemoveEvent event, Emitter<CatState> emitter) {
    int index = event.index;
    _catRepository.removeCatOnCatBlocFeaturedCatEvent(index: index);
  }
}
