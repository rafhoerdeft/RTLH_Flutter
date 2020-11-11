import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/main_controller.dart';
import '../../widget/boxcard_widget.dart';
import '../../widget/carousel_widget.dart';
import '../../config/size_config.dart';

class MainPage extends StatelessWidget {
  final MainController mainc = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];

    Sizes23 size23 = Sizes23();
    size23.getSize(context);

    final _body = Column(
      children: <Widget>[
        // Slider & Box Card
        Stack(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal[500],
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                ),
                height: size23.height,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(200)),
                      child: CarouselSlider(
                        items:
                            imgList.map((item) => CarouselBox(item)).toList(),
                        options: CarouselOptions(
                          height: size23.height - 65,
                          // aspectRatio: 2,
                          viewportFraction: 1.0,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {
                            mainc.changeSlide(index);
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 65,
                      left: 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: imgList.map((item) {
                          int index = imgList.indexOf(item);
                          return Obx(
                            () => AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width:
                                  mainc.slideActive.value == index ? 18.0 : 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(10),
                                color: mainc.slideActive.value == index
                                    ? Color.fromRGBO(255, 255, 255, 1.0)
                                    : Color.fromRGBO(0, 0, 0, 0.3),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BoxCardWidget(
              mgTop: size23.height - 33,
              mgBottom: 20,
              mgLeft: 30,
              mgRight: 30,
              content: Container(
                child: Center(
                  child: Text(
                    'This is Box Card',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.only(left: 30, right: 30),
              height: (MediaQuery.of(context).size.height / 2) / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                        padding: EdgeInsets.all(30),
                        child: Text('${index + 1}. Lorem ipsum')),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5),
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Container(
                    padding: EdgeInsets.all(30), child: Text('1. Lorem ipsum')),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(50),
      //   child: AppBar(
      //     backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      //     elevation: 0,
      //     automaticallyImplyLeading: false,
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // floating: false,
            elevation: 0,
            // snap: false,
            automaticallyImplyLeading: false,
            title: Text('MyApp'),
            pinned: true,
            backgroundColor: Color.fromRGBO(25, 255, 255, 1.0),
            expandedHeight: 156.5,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(color: Colors.teal),
            ),
            //     Container(
            //   color: Colors.red,
            // ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _body,
              ],
            ),
          ),
          // SliverFillRemaining(
          //   child: _body,
          // )
        ],
      ),
    );
  }
}
