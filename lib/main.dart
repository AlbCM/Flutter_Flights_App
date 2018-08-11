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

  /*BoxDecoration gradient() {
    var lGradient = new BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            stops: [0.0, 1.0],
            colors: [const Color(0xFF915FB5), const Color(0xFFCA436b)],
            tileMode: TileMode.repeated));
    return lGradient;
  }*/

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
              height: 420.0,
              decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0)),
              child: bodyContent(),
            )));
    return bContainer;
  }

  Widget bodyContent() {
    var bContent = DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.white,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      tabs: [
                        Tab(
                            icon: Icon(
                          Icons.flight,
                          color: Colors.deepPurple,
                        )),
                        Tab(icon: Icon(Icons.train, color: Colors.deepPurple)),
                        Tab(icon: Icon(Icons.traffic, color: Colors.deepPurple))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new Container(child: flightsView())),
    );

    return bContent;
  }

  Widget flightsView() {
    var fView = TabBarView(children: <Widget>[
      Container(color: Colors.deepPurple),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ]);
    return fView;
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
