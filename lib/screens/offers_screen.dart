import 'package:mycart/screens/my_cart.dart';
import 'package:mycart/services/data_manager.dart';
import 'package:mycart/widgets/offers/offers_items.dart';
import 'package:mycart/widgets/sub_menu/sub_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OffersScreen extends StatefulWidget {
  static const appBarTitle = 'Offers';
  static const routeName = '/offers';

  @override
  OffersScreenState createState() {
    return OffersScreenState();
  }
}

class OffersScreenState extends State<OffersScreen> {
  bool isLoading = true;

  @override
  void initState() {
    iniOffersItems();
  }

  Future<void> iniOffersItems() async {
    await DataManager.iniOffersItems();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          brightness: Brightness.dark,
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF00d466),
                  Color(0xFF00af87),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          leadingWidth: 65,
          title: Text(
            'Offers',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 15, right: 9, top: 9, bottom: 9),
            child: IconButton(
              icon: Image.asset('assets/images/other_icons/back_arrow.png'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 3, right: 15, top: 5, bottom: 5),
              child: IconButton(
                icon: Image.asset('assets/images/other_icons/cart_sm.png'),
                onPressed: () =>
                    Navigator.pushNamed(context, MyCartScreen.routeName),
              ),
            ),
          ],
        ),
        body: isLoading
            ? Container(
                alignment: Alignment.center,
                child: SpinKitSquareCircle(
                  color: Color(0xFF00af87),
                  size: 20,
                ),
              )
            : ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 22, left: 30, right: 30, bottom: 22),
                    child: offersItems(context),
                  ),
                ],
              ),
      ),
    );
  }
}
//
