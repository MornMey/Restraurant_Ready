import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                image: AssetImage('asstes/image/12.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
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

  bool _hide = true;
  get _buildBody {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: ListView(
        children: [
          _buildText,
          SizedBox(
            height: 90,
          ),
          _buildUser,
          SizedBox(
            height: 30,
          ),
          _buildPassword,
          SizedBox(
            height: 30,
          ),
          _buildSigin,
          SizedBox(
            height: 30,
          ),
          _buildFaSigin,
          SizedBox(
            height: 30,
          ),
          _buildFoget,
          SizedBox(
            height: 60,
          ),
          _buildDontSignUp,
        ],
      ),
    );
  }

  get _buildText {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Welcome Back",
              style: TextStyle(fontSize: 40, color: Colors.orange),
            ),
            subtitle: Text(
              "Sign in to Continue",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  get _buildUser {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[500].withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: _hide,
        autocorrect: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(),
          labelText: "Username",
          prefixIcon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  get _buildPassword {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[500].withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        obscureText: _hide,
        autocorrect: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(),
            labelText: "Password",
            prefixIcon: Icon(
              Icons.vpn_key_rounded,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _hide ? Icons.visibility : Icons.visibility_off_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _hide = !_hide;
                });
              },
            )),
      ),
    );
  }

  get _buildSigin {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "SIGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  get _buildFaSigin {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
            ),
            onPressed: () {}),
        title: Text(
          "Connect with Facebook",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  get _buildFoget {
    return Center(
      child: Text(
        "Foget Password",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  get _buildDontSignUp {
    return Center(
      child: Text(
        "Don't have an account Sign Up",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
