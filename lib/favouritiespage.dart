import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/models/item.dart';

class Favourities extends StatefulWidget {
  @override
  _FavouritiesState createState() => _FavouritiesState();
}

class _FavouritiesState extends State<Favourities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      backgroundColor: Colors.grey,
    );
  }

  get _buildAppBar {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      title: Text(
        "Favourites",
        style: TextStyle(color: Colors.orange, fontSize: 30),
      ),
    );
  }

  get _buildBody {
    return GridView.builder(
        padding: EdgeInsets.only(top: 15),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      _buildImagesItem,
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  get _buildImagesItem {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return _buildItem(itemList[index]);
      },
    );
  }

  _buildItem(Item item) {
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _buildImage(item.img),
          _buildButtonBorder(item.title, item.subTitle, item.price),
        ],
      ),
    );
  }

  _buildImage(String img) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          )),
    );
  }

  _buildButtonBorder(String title, subTitle, price) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ListTile(
                    title: Text(title),
                    subtitle: Text(subTitle),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.grade_rounded,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.grade_rounded,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.grade_rounded,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.grade_rounded,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.grade_rounded,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
