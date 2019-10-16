import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        backgroundColor: Colors.indigo[100],
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Container(
      width: sizeX,
      height: sizeY,
      child: ListView(
        children: showContacts(),
        // fit: StackFit.expand,
        // children: createSquares(25),
        // scrollDirection: Axis.vertical,
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];
    List<Widget> squares = List<Widget>();
    squares.add(Container(
      color: Colors.black,
    ));
    while (i < numSquares) {
      Container square = Container(
        color: colors[i % 5],
        width: 100,
        height: 100,
        child: Text(i.toString()),
      );
      i++;
      squares.add(square);
    }
    return squares;
  }

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = List<Widget>();
    Container backGround = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('http://bit.ly/pizza_image'),
              fit: BoxFit.fitHeight)),
    );
    layoutChildren.add(backGround);
    Positioned pizzaCard = Positioned(
      top: sizeY / 20,
      left: sizeX / 20,
      child: Card(
        elevation: 12,
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: <Widget>[
            Text("Pizza Margaherita",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange[800])),
            Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'This Pizza is made of Tomato, \nMozzarella and Basil. \n\n Seriosly you can\'t miss it',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
                ))
          ],
        ),
      ),
    );
    layoutChildren.add(pizzaCard);
    Positioned buttonOrder = Positioned(
      bottom: sizeY / 20,
      left: sizeX / 20,
      width: sizeX - sizeX / 10,
      child: RaisedButton(
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.orange[900],
        child: Text('Order Now!',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        onPressed: () {},
      ),
    );
    layoutChildren.add(buttonOrder);
    return layoutChildren;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    Container square = Container(
      color: colors[position % 5],
      width: 100,
      height: 100,
      child: Text(position.toString()),
    );

    return square;
  }

  Widget createSeparator(int position) {
    Widget separator = Container(
      height: 15,
      color: Colors.black,
    );
    return separator;
  }

  List<Contact> buildContacts() {
    List<Contact> contacts = List<Contact>();
    contacts
        .add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
    contacts.add(
        Contact('Frank Slade', 'Scent of a Woman', Icons.sentiment_satisfied));
    contacts.add(Contact(
        'Milred Hayes',
        'Three Billboards Outside Ebbing, Missouri',
        Icons.sentiment_dissatisfied));
    contacts
        .add(Contact('Bruce Wayne', 'The Dark Night', Icons.sentiment_neutral));
    contacts.add(
        Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_satisfied));
    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContacts();
    for (int i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }
    List<ListTile> list = List<ListTile>();
    contacts.forEach((contact) {
      list.add(ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.subtitle),
        leading: CircleAvatar(
          child: Icon(contact.icon),
          backgroundColor: Colors.amber[600],
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => print(contact.name),
      ));
    });
    return list;
  }
}

class Contact {
  String name;
  String subtitle;
  IconData icon;
  Contact(this.name, this.subtitle, this.icon);
}
