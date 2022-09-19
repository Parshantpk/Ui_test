import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_test/model/cat_model.dart';
import 'package:ui_test/model/profile_model.dart';

import '../../repositories/cat_repository.dart';

part 'me_event.dart';
part 'me_state.dart';

class MeBloc extends Bloc<MeEvent, MeState> {
  final CatRepository _catRepository;
  StreamSubscription? _profileSubscription;
  StreamSubscription? _myCatsSubscription;

  MeBloc({required CatRepository catRepository})
      : _catRepository = catRepository,
        super(MeLoadingState()) {
    on<LoadMeEvent>(_onLoadMeEvent);
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
    on<UpdateMyCatEvent>(_onUpdateMyCatEvent);
    on<MeBlocRemoveEvent>(_onMeBlocRemoveEvent);
  }

  void _onLoadMeEvent(LoadMeEvent event, Emitter<MeState> emitter) {
    _profileSubscription?.cancel();
    _myCatsSubscription?.cancel();
    _profileSubscription = _catRepository.getProfile().listen(
          (profile) => add(
            UpdateProfileEvent(profile),
          ),
        );

    _myCatsSubscription = _catRepository.getMyCats().listen(
          (myCats) => add(
            UpdateMyCatEvent(myCats),
          ),
        );
  }

  void _onUpdateProfileEvent(
      UpdateProfileEvent event, Emitter<MeState> emitter) {
    if (state is MeLoadedState) {
      emitter((state as MeLoadedState)
          .copyWith(profile: event.profile, myCats: null));
    } else {
      emitter(MeLoadedState(profile: event.profile));
    }
  }

  void _onUpdateMyCatEvent(UpdateMyCatEvent event, Emitter<MeState> emitter) {
    if (state is MeLoadedState) {
      emitter((state as MeLoadedState)
          .copyWith(myCats: event.myCats, profile: null));
    } else {
      emitter(MeLoadedState(myCats: event.myCats));
    }
  }

  FutureOr<void> _onMeBlocRemoveEvent(
      MeBlocRemoveEvent event, Emitter<MeState> emitter) {
    int index = event.index;
    _catRepository.removeCatOnMeBlocEvent(index: index);
  }
}
