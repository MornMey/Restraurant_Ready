import 'package:flutter/material.dart';
import 'package:flutter_application_restaurant/checkoutpage.dart';
import 'package:flutter_application_restaurant/models/item.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black87, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asstes/image/14.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _buildBody,
        ),
      ],
    );
  }

  get _buildBody {
    return Container(
      child: ListView(
        children: [
          _buildAppBar,
          _buildPrices,
          _buildCheckout,
        ],
      ),
    );
  }

  get _buildAppBar {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Cart",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.cancel_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
            ),
          )
        ],
      ),
    );
  }

  get _buildPrices {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildPrice,
          SizedBox(
            height: 20,
          ),
          _buildListMenu,
        ],
      ),
    );
  }

  get _buildPrice {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
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
                    title: Text("Subtotal"),
                    trailing: Text(
                      "50.00",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    title: Text("Tax & Fees"),
                    trailing: Text(
                      "25.00",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ListTile(
                    title: Text("Delivery"),
                    trailing: Text(
                      "Free",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  ListTile(
                    title: Text("Total"),
                    trailing: Text(
                      "75.00",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  get _buildListMenu {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return _buildItem(itemList[index]);
        },
      ),
    );
  }

  _buildItem(Item item) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _buildImage(item.img, item.title, item.price),
        ],
      ),
    );
  }

  _buildImage(String img, title, price) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Container(
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              leading: Image.asset(
                img,
                width: 100,
                height: 50,
              ),
              subtitle: Text(price),
            ),
          ],
        ),
      ),
    );
  }

  get _buildCheckout {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40,top: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Center(
          child: Text(
            "Checkout",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(),
            ),
          );
        },
      ),
    );
  }
}
