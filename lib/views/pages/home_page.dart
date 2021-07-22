import 'package:flutter/material.dart';
import 'package:new_demo_app/views/widgets/search/search_movie.dart';
import 'package:new_demo_app/views/widgets/top_trend/top_trend_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _title = [
    'Top trending',
    'Search',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(_title[_tabController.index]),
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: TabBarView(
            controller: _tabController,
            children: [PopularMoviesList(), SearchMovieTab()],
            //children: [SearchMovieTab(), PopularMoviesList()],
          ),
        ),
        bottomSheet: TabBar(
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).accentColor, width: 5.0),
            ),
          ),
          labelColor: Colors.blue,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.movie,
                size: 30,
              ),
              text: "Top trend",
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              text: "Search",
            )
            // Padding(
            //     padding: EdgeInsets.all(20),
            //     child: Icon(
            //       Icons.movie,
            //       size: 30,
            //     )),
            // Padding(
            //     padding: EdgeInsets.all(20),
            //     child: Icon(
            //       Icons.search,
            //       size: 30,
            //     ))
          ],
        ),
      ),
    );
  }
}
