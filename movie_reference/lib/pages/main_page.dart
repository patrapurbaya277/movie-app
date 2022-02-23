import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:movie_reference/pages/home_page.dart';
import 'package:movie_reference/pages/search_page.dart';
import 'package:movie_reference/pages/watch_later.dart';
import 'package:movie_reference/prefs/shared_pref.dart';
import 'package:movie_reference/styles.dart';
import 'package:movie_reference/widgets/drawer_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedMenu = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    WatchListMovie.loadList();
    super.initState();
  }

  Future<bool> _onWillPop() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Apakah anda yakin ingin keluar aplikasi ?"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Batal")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Ya")),
            ],
          );
        });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroundColor,
          drawer: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.black,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: 200,
                      child: Image.asset(
                        "assets/images/app_logo.png",
                      ),
                    ),
                  ),
                ),
                DrawerItem(
                  icon: Icons.home,
                  label: "Home",
                  onPressed: () {
                    if (selectedMenu != 0) {
                      setState(() {
                        selectedMenu = 0;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
                DrawerItem(
                  icon: Icons.playlist_add,
                  label: "Watch List",
                  onPressed: () {
                    if (selectedMenu != 1) {
                      setState(() {
                        selectedMenu = 1;
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
                const Divider(color: Colors.white30),
                const Text(
                  "v0.23 • Patra Purbaya",
                  style: TextStyle(color: Colors.white30),
                ),
              ],
            ),
          ),
          body: NestedScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (context, child) => [
              SliverAppBar(
                pinned: true,
                backgroundColor: backgroundColor.withOpacity(0.9),
                leading: TextButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
                title: Image.asset("assets/images/app_logo.png"),
                actions: [
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             const SearchPage()));
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(100))),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        child: Text("Search Movies"),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
            body: const [
              HomePage(),
              WatchLater(),
            ][selectedMenu],
          ),
        ),
      ),
    );
  }
}
