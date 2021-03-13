import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _darks = true;
  bool _dark = true;
  bool _dar = true;
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
          body: _buildBodys,
        ),
      ],
    );
  }

  get _buildBodys {
    return Container(
      child: ListView(
        children: [
          _buildAppBar,
          _buildTitle,
          _buildBody,
        ],
      ),
    );
  }

  get _buildAppBar {
    return Container(
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
      ),
    );
  }

  get _buildTitle {
    return Container(
      padding: EdgeInsets.only(left: 5),
      child: ListTile(
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  get _buildBody {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildPayments,
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  get _buildPayments {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _deAddress,
            _address,
            _paMethod,
            _paymentVisa,
            _paymentPaytm,
            _paymentLazypay,
            _cashDelivery,
            _payment,
          ],
        ),
      ),
    );
  }

  get _deAddress {
    return ListTile(
      title: Text("DELIVERY ADDRESS"),
    );
  }

  get _address {
    return Card(
      child: Container(
        child: ListTile(
          title: Text(
            "Work",
            style: TextStyle(color: Colors.orange),
          ),
          subtitle: Text("2A, VGP Selva Nagar, Velachery"),
          trailing: IconButton(
            icon: Icon(
              Icons.check_circle_rounded,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  get _paMethod {
    return ListTile(
      title: Text("PAYMENT METHOD"),
    );
  }

  get _paymentVisa {
    return Card(
      child: Container(
        child: ListTile(
          leading: Image.asset(
            'asstes/image/visa.png',
            width: 75,
          ),
          title: Text(
            "**** **** **** 2986",
          ),
          trailing: IconButton(
            icon: Icon(
              _darks
                  ? Icons.check_circle_outline_rounded
                  : Icons.check_circle_rounded,
              color: _darks ? Colors.grey : Colors.orange,
            ),
            onPressed: () {
              setState(() {
                _dark = _darks;
                _dar = _darks;
                _darks = !_darks;
              });
            },
          ),
        ),
      ),
    );
  }

  get _paymentPaytm {
    return Card(
      child: Container(
        child: ListTile(
          leading: Image.asset(
            'asstes/image/paytm.jpg',
            width: 75,
          ),
          title: Text(
            "********@paytm.in",
          ),
          trailing: IconButton(
            icon: Icon(
              _dark
                  ? Icons.check_circle_outline_rounded
                  : Icons.check_circle_rounded,
              color: _dark ? Colors.grey : Colors.orange,
            ),
            onPressed: () {
              setState(() {
                _dar = _dark;
                _darks = _dark;
                _dark = !_dark;
              });
            },
          ),
        ),
      ),
    );
  }

  get _paymentLazypay {
    return Card(
      child: Container(
        child: ListTile(
          leading: Image.asset(
            'asstes/image/lazypay.png',
            width: 75,
          ),
          title: Text(
            "********@lazypay.in",
          ),
          trailing: IconButton(
            icon: Icon(
              _dar
                  ? Icons.check_circle_outline_rounded
                  : Icons.check_circle_rounded,
              color: _dar ? Colors.grey : Colors.orange,
            ),
            onPressed: () {
              setState(() {
                _darks = _dar;
                _dark = _dar;
                _dar = !_dar;
              });
            },
          ),
        ),
      ),
    );
  }

  get _cashDelivery {
    return ListTile(
      title: Text(
        "Cash On Delivery",
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  get _payment {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Center(
          child: Text(
            "Payment",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
