import 'package:MyClass/components/subject_card.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var top;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Text("This drawer")),
      key: _scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 220.0,
              floating: false,
              pinned: true,
              stretch: true,
              leading: Container(
                padding: EdgeInsets.all(8),
                child: Builder(builder: (BuildContext context) {
                  return RawMaterialButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    elevation: 2.0,
                    fillColor: Colors.deepOrange,
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  );
                }),
              ),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  centerTitle: top < 150 ? true : false,
                  title: Container(
                    constraints: BoxConstraints(
                        maxWidth: top < 150 ? double.infinity : 100),
                    child: Text(
                      // top.toString(),
                      "School Education",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.black,
                        // decoration: TextDecoration.none,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Stack(
                    children: [
                      Image.asset(
                        'assets/background.png',
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/background2.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ];
        },
        body: GridView(
          padding: EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 155 / 100,
          ),
          children: subjects
              .map(
                (e) => SubjectCard(
                  name: e.title,
                  image: e.image,
                  color: e.color,
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: MyNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class MyNavigation extends StatelessWidget {
  const MyNavigation({
    Key key,
    @required int selectedIndex,
    @required this.onItemTapped,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;
  final Function onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.backpack,
          ),
          label: 'My courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Darot',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.amber[800],
      onTap: onItemTapped,
    );
  }
}
