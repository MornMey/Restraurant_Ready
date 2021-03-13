import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/models/item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.white,
        title: Container(
          child: Column(
            children: [
              _buildIcon,
              _buildSearch,
            ],
          ),
        ));
  }

  get _buildIcon {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("ResB",
              style: TextStyle(
                fontSize: 30,
                color: Colors.orange,
              )),
          IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.orange,
              ),
              iconSize: 30,
              onPressed: () {}),
        ],
      ),
    );
  }

  get _buildSearch {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Material(
        elevation: 0.2,
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              fillColor: Colors.grey,
              filled: true,
              contentPadding: EdgeInsets.only(left: 20),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              hintText: "Search...",
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );
  }

  get _buildBody {
    return Container(
      child: ListView(
        children: [
          _buildListTile,
          _buildImagesItem,
          _buildListTiles,
          _buildImagesItems,
          _buildImagesItems,
        ],
      ),
    );
  }

  get _buildListTile {
    return ListTile(
      leading: Text("Trending this week"),
      trailing: Text(
        "view all>",
        style: TextStyle(color: Colors.orange),
      ),
    );
  }

  get _buildImagesItem {
    return Container(
      height: 280,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: <Widget>[
          _buildImages,
          _buildImages,
          _buildImages,
          _buildImages,
        ],
      ),
    );
  }

  get _buildImages {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          _buildImage,
          _buildButtonBorder,
        ],
      ),
    );
  }

  get _buildImage {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage('asstes/image/1.jpg'),
            fit: BoxFit.cover,
          )),
    );
  }

  get _buildButtonBorder {
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
                    title: Text("Crispy Chicken Sandwich"),
                    subtitle: Text("Zaitoon Multicusine Restaurant"),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
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
                  )
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

  get _buildListTiles {
    return ListTile(
      leading: Text("Most Popular"),
      trailing: Text(
        "26 Restaurant>",
        style: TextStyle(color: Colors.orange),
      ),
    );
  }

  get _buildImagesItems {
    return Container(
      height: 280,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        scrollDirection: Axis.horizontal,
        pageSnapping: true,
        children: <Widget>[
          _buildImagese,
          _buildImagese,
          _buildImagese,
          _buildImagese,
        ],
      ),
    );
  }

  get _buildImagese {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          _buildImag,
          _buildButtonBorders,
        ],
      ),
    );
  }

  get _buildImag {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          image: DecorationImage(
            image: AssetImage('asstes/image/2.jpg'),
            fit: BoxFit.cover,
          )),
    );
  }

  get _buildButtonBorders {
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
                    title: Text("Crispy Chicken Sandwich"),
                    subtitle: Text("Zaitoon Multicusine Restaurant"),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
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
                  )
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
