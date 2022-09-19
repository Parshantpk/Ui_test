import 'package:flutter/material.dart';
import 'package:ui_test/widgets/add_button.dart';
import 'package:ui_test/widgets/get_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/widgets/remove_button.dart';

import '../blocs/cat_bloc/cat_bloc.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

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
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 12),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                BlocBuilder<CatBloc, CatState>(
                  builder: (context, state) {
                    if (state is CatLoadingState) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: GetShimmer(),
                          );
                        },
                      );
                    }
                    if (state is CatLoadedState) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.featuredCats.length,
                          itemBuilder: (context, index) {
                            final featured = state.featuredCats[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(featured.image),
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
                                              featured.title,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0, top: 4.0),
                                              child: Text(
                                                featured.description,
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            featured.buttonState
                                                ? AddButton(
                                                    onPressed: () {
                                                      BlocProvider.of<CatBloc>(
                                                              context)
                                                          .add(
                                                        FeaturedCatAddEvent(
                                                            title:
                                                                featured.title,
                                                            image:
                                                                featured.image,
                                                            description: featured
                                                                .description,
                                                            buttonState: featured
                                                                .buttonState,
                                                            index: index),
                                                      );
                                                    },
                                                  )
                                                : RemoveButton(
                                                    onPressed: () {
                                                      BlocProvider.of<CatBloc>(
                                                              context)
                                                          .add(
                                                        CatBlocFeaturedCatRemoveEvent(
                                                            index: index),
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
                        'Sorry, we have some problems loading featured cats 😿',
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
                const Padding(
                  padding: EdgeInsets.only(top: 22, bottom: 12),
                  child: Text(
                    'All cats',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                BlocBuilder<CatBloc, CatState>(
                  builder: (context, state) {
                    if (state is CatLoadingState) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: GetShimmer(),
                          );
                        },
                      );
                    }
                    if (state is CatLoadedState) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.allCats.length,
                          itemBuilder: (context, index) {
                            final cat = state.allCats[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(cat.image),
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
                                              cat.title,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0, top: 4.0),
                                              child: Text(
                                                cat.description,
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            cat.buttonState
                                                ? AddButton(
                                                    onPressed: () {
                                                      BlocProvider.of<CatBloc>(
                                                              context)
                                                          .add(
                                                        AllCatAddEvent(
                                                            title: cat.title,
                                                            image: cat.image,
                                                            description:
                                                                cat.description,
                                                            buttonState:
                                                                cat.buttonState,
                                                            index: index),
                                                      );
                                                    },
                                                  )
                                                : RemoveButton(
                                                    onPressed: () {
                                                      BlocProvider.of<CatBloc>(
                                                              context)
                                                          .add(
                                                        CatBlocAllCatsRemoveEvent(
                                                            index: index),
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
                        'Sorry, we have some problems loading all other cats 😿',
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
      ),
    );
  }
}
