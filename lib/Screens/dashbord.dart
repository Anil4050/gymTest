import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_listview/infinite_listview.dart';

import '../Controller/dashbordController.dart';
import '../Widget.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  dashbordController gym = Get.put(dashbordController());
  @override
  void initState() {
    super.initState();
    gym.readJson();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    List<String> img = [
      "assets/Images/gym_non_stop.png",
      "assets/Images/gym_rebel.png",
      "assets/Images/gym_non_stop.png",
    ];
    // final List<Container> myWidgets = img
    //     .map(
    //       (e) => Container(
    //         width: 175,
    //         height: 300,
    //         margin: const EdgeInsets.symmetric(horizontal: 5.0),
    //         decoration: BoxDecoration(boxShadow: const [
    //           BoxShadow(
    //             offset: Offset(0, 2),
    //             blurRadius: 12,
    //             color: Color.fromRGBO(0, 0, 0, 0.16),
    //           )
    //         ], color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
    //         child: Stack(
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(15),
    //               child: Container(
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(50.0)),
    //                   child: Image.asset(
    //                       height: 100,
    //                       width: 200,
    //                       fit: BoxFit.cover,
    //                       "assets/Images/map.png")),
    //             ),
    //             Positioned(
    //               bottom: 40,
    //               left: -4,
    //               right: -4,
    //               top: 40,
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(15.0)),
    //                 child: Column(
    //                   children: [
    //                     ClipRRect(
    //                       borderRadius: const BorderRadius.only(
    //                           topRight: Radius.circular(15.0),
    //                           topLeft: Radius.circular(15.0)),
    //                       child: Image.asset(
    //                           height: 100, width: 185, fit: BoxFit.fitWidth, e),
    //                     ),
    //                     // Text("data")
    //                   ],
    //                 ),
    //                 // Text(
    //                 //   'text ${gym.gymData[0]}',
    //                 // ),
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 20,
    //               left: 5,
    //               right: -4,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     gym.gymData['gyms'][1]['title'].toString(),
    //                     style: const TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 14,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                   Column(
    //                     children: [
    //                       Text(
    //                         '\$ ${gym.gymData['gyms'][0]['price']}',
    //                         style: const TextStyle(
    //                             color: Colors.blue, fontSize: 12),
    //                       ),
    //                       const Text(
    //                         "/day",
    //                         style: TextStyle(color: Colors.grey, fontSize: 10),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Positioned(
    //               bottom: 0,
    //               left: 5,
    //               right: -4,
    //               top: 100,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: const [
    //                   Icon(
    //                     Icons.star,
    //                     color: Colors.yellow,
    //                     size: 20,
    //                   ),
    //                   Text(
    //                     '5.5 ',
    //                     style: TextStyle(color: Colors.blue, fontSize: 12),
    //                   ),
    //                   Text(
    //                     "01 Aug - 30 Aug, 2020",
    //                     style: TextStyle(color: Colors.grey, fontSize: 10),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Obx(
    //               () => Positioned(
    //                   right: 5,
    //                   top: 50,
    //                   child: IconButton(
    //                     icon: Icon(
    //                       gym.fav.value
    //                           ? Icons.favorite
    //                           : Icons.favorite_border,
    //                       color: Colors.white,
    //                       size: 35,
    //                     ),
    //                     onPressed: (() {
    //                       if (kDebugMode) {
    //                         print("on tap fav. ////////");
    //                       }
    //                       gym.fav.value
    //                           ? gym.updateFav(false)
    //                           : gym.updateFav(true);
    //                     }),
    //                   )),
    //             )
    //             // Text(
    //             //   'text ${gym.gymData[0]}',
    //             // ),
    //           ],
    //         ),
    //       ),
    //     )
    //     .toList();

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          (() => !gym.isLoading.value
              ? Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          const BoxDecoration(color: Colors.blue, boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ]),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                'assets/Icons/dumbbell.svg',
                                height: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            'assets/Icons/map.svg',
                            height: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset(
                            'assets/Icons/search.svg',
                            height: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "	https://i0.wp.com/kindstatus.com/wp-content/uploads/2022/09/whatsapp-dp.jpg?fit=500%2C500&ssl=1"),
                            radius: 15,
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Recommended Gyms",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(bottom: 20, top: 20),
                      height: 250,
                      width: double.infinity,

                      child: ListView.builder(
                        itemCount: gym.gymData['gyms'].length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 175,
                            height: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                      child: Image.asset(
                                          height: 100,
                                          width: 200,
                                          fit: BoxFit.cover,
                                          "assets/Images/map.png")),
                                ),
                                Positioned(
                                  bottom: 40,
                                  left: -4,
                                  right: -4,
                                  top: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0)),
                                          child: Image.asset(
                                              height: 120,
                                              width: 185,
                                              fit: BoxFit.fitWidth,
                                              img[index]),
                                        ),
                                        // Text("data")
                                      ],
                                    ),
                                    // Text(
                                    //   'text ${gym.gymData[0]}',
                                    // ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 35,
                                  left: 5,
                                  right: -4,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        gym.gymData['gyms'][index]['title']
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '\$ ${gym.gymData['gyms'][index]['price']}',
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12),
                                          ),
                                          const Text(
                                            "/day",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 17,
                                  left: 5,
                                  right: 5,
                                  top: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      Text(
                                        gym.gymData['gyms'][index]['rating']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Text(
                                        gym.gymData['gyms'][index]['date']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    right: 5,
                                    top: 50,
                                    child: IconButton(
                                      icon: Icon(
                                        gym.gymData['gyms'][index]['favorite']
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      onPressed: (() {
                                        if (kDebugMode) {
                                          print("on tap fav. ////////");
                                        }
                                        gym.UpdateFav(
                                            gym.gymData['gyms'][index]['id'],
                                            gym.gymData['gyms'][index],
                                            context);
                                        // gym.fav.value
                                        //     ? gym.updateFav(false)
                                        //     : gym.updateFav(true);
                                      }),
                                    )),

                                // Text(
                                //   'text ${gym.gymData[0]}',
                                // ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Popular Classis",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      // margin: const EdgeInsets.only(bottom: 20, top: 20),
                      // color: Colors.amber,
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: gym.icon.length,
                        itemBuilder: (BuildContext context, int index) {
                          return classes(gym, index);
                        },
                      ),
                    ),
                    // Container(
                    //   height: 500,
                    //   // Leave margin here for top bar
                    //   color: Colors.grey[900],
                    //   padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 5.0),
                    //   child: (Column(mainAxisSize: MainAxisSize.min, children: [
                    //     Expanded(
                    //       child: InfiniteListView.builder(
                    //         // itemCount: 222,
                    //         scrollDirection: Axis.horizontal,
                    //         // controller: _infiniteController,
                    //         anchor: 0.5,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return Material(
                    //             child: classes(gym, index),
                    //           );
                    //         },
                    //       ),
                    //     ),
                    //   ])),
                    // ),
                    Container(
                      height: 500,
                      width: 700,
                      padding: EdgeInsets.all(10.0),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:
                            gym.gymData['gyms'][0]['popular_clasess'].length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 2,
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: Row(children: [
                                Column(
                                  children: [Image.asset(img[index])],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('data'),
                                        Text('data'),
                                      ],
                                    ),
                                    Text('data'),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icons/dumbbell.svg',
                                          height: 25,
                                          color: Colors.white,
                                        ),
                                        Text('data'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Icons/dumbbell.svg',
                                          height: 25,
                                          color: Colors.white,
                                        ),
                                        Text('data'),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              : CircularProgressIndicator()),
        ),
      ),
    ));
  }
}
