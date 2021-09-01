import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sangamarket/src/pages/home_page.dart';
import 'package:sangamarket/src/pages/search_page.dart';
import 'package:sangamarket/src/pages/shopping_cart_page.dart';
import 'package:sangamarket/src/themes/light_color.dart';
import 'package:sangamarket/src/themes/theme.dart';
import 'package:sangamarket/src/widgets/title_text.dart';
import 'package:sangamarket/src/widgets/extentions.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  bool isHomePageSelected = true;
  List<Widget> _pageOptions = <Widget>[
    MyHomePage(),
    SearchPage(),
    ShoppingCartPage(),
    MyHomePage()
  ];
  List<String> _tilteText1list = ['Nos', '', 'Mon'];
  List<String> _tilteText2list = ['Produits', 'Catégories', 'Panier'];

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 10),
                ],
              ),
              child: Image.asset("assets/user.png"),
            ),
          ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _title() {
    return Container(
        margin: AppTheme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: _tilteText1list.elementAt(_currentIndex),
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: _tilteText2list.elementAt(_currentIndex),
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            !isHomePageSelected
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.delete_outline,
                      color: LightColor.green,
                    ),
                  ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
                : SizedBox()
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    _title(),
                    Expanded(
                      child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInToLinear,
                          switchOutCurve: Curves.easeOutBack,
                          child: _pageOptions.elementAt(_currentIndex)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: Icon(Icons.home), title: Text("Accueil"), selectedColor: Colors.green),
          SalomonBottomBarItem(
              icon: Icon(Icons.favorite_rounded),
              title: Text("Recherche"),
              selectedColor: Colors.yellow[900]),
          SalomonBottomBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              title: Text("Mon Panier"),
              selectedColor: Colors.redAccent),
          SalomonBottomBarItem(icon: Icon(Icons.menu_rounded), title: Text("Menu"))
        ],
      ),
    );
  }
}
