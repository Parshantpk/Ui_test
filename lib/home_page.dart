import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _featured =
      FirebaseFirestore.instance.collection('featured');
  final CollectionReference _cats =
      FirebaseFirestore.instance.collection('cats');
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
                const Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                StreamBuilder(
                  stream: _featured.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFE0E0E0),
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
                                          image: AssetImage(
                                              documentSnapshot['image']),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical: 8.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              documentSnapshot['title'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6.0),
                                              child: Text(
                                                documentSnapshot['description'],
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0),
                                                ),
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  stops: [0.0, 1.0],
                                                  colors: [
                                                    Color(0xFFFFAB91),
                                                    Color(0xFFFF6F43),
                                                  ],
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                onPressed: null,
                                                child: const Text(
                                                  'Add',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ),
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
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'All cats',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                StreamBuilder(
                  stream: _cats.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFE0E0E0),
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
                                          image: AssetImage(
                                              documentSnapshot['image']),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical: 8.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              documentSnapshot['title'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6.0),
                                              child: Text(
                                                documentSnapshot['description'],
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0),
                                                ),
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  stops: [0.0, 1.0],
                                                  colors: [
                                                    Color(0xFFFFAB91),
                                                    Color(0xFFFF6F43),
                                                  ],
                                                ),
                                              ),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  primary: Colors.transparent,
                                                  shadowColor:
                                                      Colors.transparent,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                onPressed: null,
                                                child: const Text(
                                                  'Add',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              ),
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
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _customBottomNavigationBar(),
    );
  }

  Widget _customBottomNavigationBar() {
    int _currentIndex = 0;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          stops: [0.0, 1.0],
          colors: [
            Colors.white,
            Color(0xFFFBE9E7),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: BottomNavigationBar(
          onTap: (value) {
            if (value != _currentIndex) {
              setState(() {
                _currentIndex = value;
              });
              // widget.onTap(value);
            }
          },
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFFFF6F43),
          unselectedItemColor: Color(0xDE000000),
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Cats'),
            BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Me'),
          ],
        ),
      ),
    );
  }
}
// return
// SafeArea(
//   child: Stack(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(
//             horizontal: 24, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Featured',
//               style: TextStyle(
//                 fontSize: 34,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const SizedBox(
//               height: 5.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xFFE0E0E0),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 94,
//                       height: 94,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image:
//                           AssetImage('assets/images/cat.png'),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 8.0,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment:
//                           CrossAxisAlignment.stretch,
//                           children: [
//                             const Text(
//                               'Awesome cat',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 6.0),
//                               child: Text(
//                                 'Very nice cat with cute hairs',
//                                 style: TextStyle(
//                                   color: Colors.black
//                                       .withOpacity(0.6),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                                 gradient: LinearGradient(
//                                   begin: Alignment.bottomCenter,
//                                   end: Alignment.topCenter,
//                                   stops: [0.0, 1.0],
//                                   colors: [
//                                     Color(0xFFFFAB91),
//                                     Color(0xFFFF6F43),
//                                   ],
//                                 ),
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   tapTargetSize:
//                                   MaterialTapTargetSize
//                                       .shrinkWrap,
//                                   primary: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         8.0),
//                                   ),
//                                 ),
//                                 onPressed: null,
//                                 child: const Text(
//                                   'Add',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xFFE0E0E0),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(16.0),
//                   //color: Colors.red,
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 94,
//                       height: 94,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image:
//                           AssetImage('assets/images/cat.png'),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 8.0,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment:
//                           CrossAxisAlignment.stretch,
//                           children: [
//                             const Text(
//                               'Awesome cat',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 6.0),
//                               child: Text(
//                                 'Very nice cat with cute hairs',
//                                 style: TextStyle(
//                                     color: Colors.black
//                                         .withOpacity(0.6),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                                 gradient: LinearGradient(
//                                   begin: Alignment.bottomCenter,
//                                   end: Alignment.topCenter,
//                                   stops: [0.0, 1.0],
//                                   colors: [
//                                     Color(0xFFFFAB91),
//                                     Color(0xFFFF6F43),
//                                   ],
//                                 ),
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   tapTargetSize:
//                                   MaterialTapTargetSize
//                                       .shrinkWrap,
//                                   primary: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         8.0),
//                                   ),
//                                 ),
//                                 onPressed: null,
//                                 child: const Text(
//                                   'Add',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             const Text(
//               'All cats',
//               style: TextStyle(
//                 fontSize: 34,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xFFE0E0E0),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(16.0),
//                   //color: Colors.red,
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 94,
//                       height: 94,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image:
//                           AssetImage('assets/images/cat.png'),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 8.0,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment:
//                           CrossAxisAlignment.stretch,
//                           children: [
//                             const Text(
//                               'Awesome cat',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 6.0),
//                               child: Text(
//                                 'Very nice cat with cute hairs',
//                                 style: TextStyle(
//                                     color: Colors.black
//                                         .withOpacity(0.6),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                                 gradient: LinearGradient(
//                                   begin: Alignment.bottomCenter,
//                                   end: Alignment.topCenter,
//                                   stops: [0.0, 1.0],
//                                   colors: [
//                                     Color(0xFFFFAB91),
//                                     Color(0xFFFF6F43),
//                                   ],
//                                 ),
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   tapTargetSize:
//                                   MaterialTapTargetSize
//                                       .shrinkWrap,
//                                   primary: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         8.0),
//                                   ),
//                                 ),
//                                 onPressed: null,
//                                 child: const Text(
//                                   'Add',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xFFE0E0E0),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 94,
//                       height: 94,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image:
//                           AssetImage('assets/images/cat.png'),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 8.0,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment:
//                           CrossAxisAlignment.stretch,
//                           children: [
//                             const Text(
//                               'Awesome cat',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 6.0),
//                               child: Text(
//                                 'Very nice cat with cute hairs',
//                                 style: TextStyle(
//                                     color: Colors.black
//                                         .withOpacity(0.6),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                   colors: [
//                                     Color(0xFFE0E0E0)
//                                         .withOpacity(0.0),
//                                     Color(0xFFE0E0E0)
//                                         .withOpacity(1.0),
//                                   ],
//                                 ),
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   tapTargetSize:
//                                   MaterialTapTargetSize
//                                       .shrinkWrap,
//                                   primary: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         8.0),
//                                   ),
//                                 ),
//                                 onPressed: null,
//                                 child: const Text(
//                                   'Remove',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color(0xFFE0E0E0),
//                     width: 1.0,
//                   ),
//                   borderRadius: BorderRadius.circular(16.0),
//                   //color: Colors.red,
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 94,
//                       height: 94,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16.0),
//                         image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image:
//                           AssetImage('assets/images/cat.png'),
//                         ),
//                       ),
//                     ),
//                     // const SizedBox(
//                     //   width: 8.0,
//                     // ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0,
//                           vertical: 8.0,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment:
//                           CrossAxisAlignment.stretch,
//                           children: [
//                             const Text(
//                               'Awesome cat',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 6.0),
//                               child: Text(
//                                 'Very nice cat with cute hairs',
//                                 style: TextStyle(
//                                     color: Colors.black
//                                         .withOpacity(0.6),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                             Container(
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8.0),
//                                 ),
//                                 gradient: LinearGradient(
//                                   begin: Alignment.bottomCenter,
//                                   end: Alignment.topCenter,
//                                   stops: [0.0, 1.0],
//                                   colors: [
//                                     Color(0xFFFFAB91),
//                                     Color(0xFFFF6F43),
//                                   ],
//                                 ),
//                               ),
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   tapTargetSize:
//                                   MaterialTapTargetSize
//                                       .shrinkWrap,
//                                   primary: Colors.transparent,
//                                   shadowColor: Colors.transparent,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(
//                                         8.0),
//                                   ),
//                                 ),
//                                 onPressed: null,
//                                 child: const Text(
//                                   'Add',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// );
