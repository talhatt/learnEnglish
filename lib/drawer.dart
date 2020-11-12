import 'package:flutter/material.dart';
import 'package:hello/add_to_drawer_menu.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Container(
            child: FlatButton.icon(
              icon: Icon(Icons.account_circle),
              label: Text("Giriş Yap"),
              onPressed: () {
                Navigator.pushNamed(context, "/signIn");
              },
            ),
          ),
        ),
        AddToDrawerMenu(
          text: "Ana Sayfa",
          routeName: "/home",
          iconName: Icons.home,
        ),
        AddToDrawerMenu(
          text: "Zor Kelimeler",
          routeName: "/categories",
          iconName: Icons.error_outline,
        ),
        Divider(color: Colors.blue),
        AddToDrawerMenu(text: "Uygulamayı paylaş", iconName: Icons.share),
        AddToDrawerMenu(
            text: "Arkadaşlarını davet et", iconName: Icons.plus_one),
        Divider(color: Colors.blue),
        AddToDrawerMenu(text: "Yardım"),
        AddToDrawerMenu(text: "Geri Bildirim"),
        AddToDrawerMenu(text: "Ayarlar"),
      ],
    );
  }
}
