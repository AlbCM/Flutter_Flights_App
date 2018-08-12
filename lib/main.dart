import 'package:flutter/material.dart';

void main() => runApp(new FlightsApp());

/*TODO:
  - Cambiar fuente
  - Arreglar el tabbar
    - Espacio
    - Borde
    - Agregar precio de pasaje en el icono
  - Agregar content
  - Agregar borde a la imagen

*/
// Parametros de la app
class FlightsApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlightsApp",
      debugShowCheckedModeBanner: false,
      home: new SearchScreen(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  Widget imageHeader() {
    //No es responsivo preguntar como hacerlo
    var image = Container(
        width: double.infinity,
        height: 275.0,
        child: Image.asset('assets/boston.jpg',
            fit: BoxFit.fill,
            color: Color(0xFF9434e2).withOpacity(1.0),
            colorBlendMode: BlendMode.softLight));
    return image;
  }

  Widget textHeader() {
    var text = Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 90.5),
        child: Row(
          children: <Widget>[
            new Expanded(
                child: Column(
              children: <Widget>[
                Text(
                  "FLYING FROM",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                Text("CHICAGO",
                    style: TextStyle(color: Colors.white, fontSize: 26.0)),
                Text("All airports",
                    style: TextStyle(color: Colors.white, fontSize: 16.0))
              ],
            )),
            new Center(
                child: Column(children: <Widget>[
              new Icon(
                Icons.flight,
                color: Colors.white,
                size: 40.0,
              )
            ])),
            new Expanded(
                child: Column(
              children: <Widget>[
                Text(
                  "FLYING TO",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                Text("SEATTLE",
                    style: TextStyle(color: Colors.white, fontSize: 26.0)),
                Text("Tacoma intl.",
                    style: TextStyle(color: Colors.white, fontSize: 16.0))
              ],
            )),
          ],
        ));
    return text;
  }

  Widget bodyContainer() {
    var bContainer = Container(
        child: new Positioned(
            left: 10.0,
            right: 10.0,
            top: 210.0,
            child: new Container(
                width: 340.0,
                height: 430.0,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: new Column(
                  children: <Widget>[bodyTapBar(), bodyCard()],
                ))));
    return bContainer;
  }

  Widget bodyTapBar() {
    var bContent = Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: <Widget>[
            new Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0, left: 16.0),
                    decoration: BoxDecoration(
                      border: new BorderDirectional(
                          bottom: BorderSide(
                              color: Colors.purple[600], width: 2.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.flight,
                          color: Colors.purple[600],
                          size: 25.0,
                        ),
                        Text(" \$219",
                            style: TextStyle(
                                color: Colors.purple[600], fontSize: 18.0))
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0, left: 16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.directions_railway,
                          color: Colors.black26,
                          size: 25.0,
                        ),
                        Text(" \$102",
                            style: TextStyle(
                                color: Colors.black26, fontSize: 18.0))
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 5.0, left: 16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.black26,
                          size: 25.0,
                        ),
                        Text(" \$74",
                            style: TextStyle(
                                color: Colors.black26, fontSize: 18.0))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
    return bContent;
  }

  Widget bodyCard() {
    var card = Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0),
      child: new Center(
          child: Row(
        children: <Widget>[
          new Expanded(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black26,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "6:00 am",
                      style: TextStyle(color: Colors.black45, fontSize: 18.0),
                    ),
                    Text(
                      "O' hare",
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
                Icon(Icons.flight, color: Colors.black26),
                Column(
                  children: <Widget>[
                    Text(
                      "8:25 am",
                      style: TextStyle(color: Colors.black45, fontSize: 18.0),
                    ),
                    Text(
                      "Tacoma intl.",
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
                Text(
                  "\$ 219",
                  style: TextStyle(color: Colors.black45, fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      )),
    );

    return card;
  }

  Widget buildHeader() {
    var stack = Stack(children: [imageHeader(), textHeader(), bodyContainer()]);
    return stack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildHeader(),
      backgroundColor: Colors.white,
    );
  }
}
