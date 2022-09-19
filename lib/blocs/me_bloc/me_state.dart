part of 'me_bloc.dart';

abstract class MeState extends Equatable {
  const MeState();
  @override
  List<Object> get props => [];
}

class MeLoadingState extends MeState {}

class MeLoadedState extends MeState {
  List<Profile> profile;
  List<Cat> myCats;

  MeLoadedState(
      {this.profile = const <Profile>[], this.myCats = const <Cat>[]});

  MeLoadedState copyWith({
    List<Profile>? profile,
    List<Cat>? myCats,
  }) {
    return MeLoadedState(
        profile: profile ?? this.profile, myCats: myCats ?? this.myCats);
  }

  @override
  List<Object> get props => [profile, myCats];
}
