import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/blocs/me_bloc/me_bloc.dart';
import 'package:ui_test/widgets/remove_button.dart';
import '../widgets/get_shimmer.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MeBloc, MeState>(
                builder: (context, state) {
                  if (state is MeLoadingState) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: GetShimmer(),
                    );
                  }
                  if (state is MeLoadedState) {
                    final profile = state.profile[0];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.title,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Age: ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  profile.age.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 77,
                          height: 76,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(profile.image),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      'Sorry, we have some problems loading your profile 😿',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(
                          0.6,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'My cats',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              BlocBuilder<MeBloc, MeState>(
                builder: (context, state) {
                  if (state is MeLoadingState) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: GetShimmer(),
                        );
                      },
                    );
                  }
                  if (state is MeLoadedState) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.myCats.length,
                        itemBuilder: (context, index) {
                          final myCats = state.myCats[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFE0E0E0),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 94,
                                    height: 94,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(myCats.image),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 6,
                                          left: 10,
                                          right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            myCats.title,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3.0, top: 4.0),
                                            child: Text(
                                              myCats.description,
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          RemoveButton(
                                            onPressed: () {
                                              BlocProvider.of<MeBloc>(context)
                                                  .add(
                                                MeBlocRemoveEvent(index: index),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return Text(
                      'Sorry, we have some problems loading my cats 😿',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(
                          0.6,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
