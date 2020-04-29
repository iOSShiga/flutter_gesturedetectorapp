import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';

void main() => runApp(MyApp());

class Product {
  
  final String name;
  final String description;
  final int price;
  final String image;
  
  Product(this.name, this.description, this.price, this.image);
  
  static List<Product> getProducts() {
    
    List<Product> items = <Product>[];

    items.add(
        Product(
            "Pixel",
            "Pixel is the most featureful phone ever",
            800,
            "img1.jpg"
        )
    );
    items.add(
        Product(
            "Laptop",
            "Laptop is most productive development tool",
            2000,
            "img2.jpg"
        )
    );
    items.add(
        Product(
            "Tablet",
            "Tablet is the most useful device ever for meeting",
            1500,
            "img3.jpg"
        )
    );
    items.add(
        Product(
            "Pendrive",
            "iPhone is the stylist phone ever",
            100,
            "img4.jpg"
        )
    );
    items.add(
        Product(
            "Floppy Drive",
            "iPhone is the stylist phone ever",
            20,
            "img5.jpg"
        )
    );
    items.add(
        Product(
            "iPhone",
            "iPhone is the stylist phone ever",
            1000,
            "img6.jpg"
        )
    );

    return items;

  }
  
  
  
}
    
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.blue
          ),

          home: MyHomePage(title: 'Product Navigation demo home page'),
        );
      }
    }


    class MyHomePage extends StatelessWidget {

  final String title;
  final items = Product.getProducts();

  MyHomePage({Key key, this.title}) : super(key : key);
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text("Product Navigation")),
          body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child:ProductBox(item: items[index]) ,
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(item: items[index])
                    ),
                    );
                  },
                );
              }),
        );
      }
    }

    
    class ProductBox extends StatelessWidget {
  
  ProductBox({Key key, this.item}) : super(key : key);
  
  final Product item;
  
      @override
      Widget build(BuildContext context) {
        return Container(
          child: Container(
            padding: EdgeInsets.all(2),
            height: 140,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("images/" + this.item.image,
                  height: 140,
                  width: 150,
                  fit: BoxFit.fill,),
                  
                  Flexible(
                    child: Container(

                      color: Colors.yellow,
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(this.item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.red
                            ),

                              textAlign: TextAlign.center,
                            ),


                          ),


                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(this.item.description)),

                          Align(
                              alignment: Alignment.topLeft,
                              child: Text('Price' + this.item.price.toString())),


                          RatingBox(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
    


    

    // Detail Page


    class ProductPage extends StatelessWidget {

  ProductPage({Key key, this.item}) : super(key : key);
  final Product item;

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(this.item.name),
          ),

          body: Center(
            child: Container(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Image.asset('images/' + this.item.image),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Text(this.item.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )
                          ),

                          Text(this.item.description),
                          Text('Price' + this.item.price.toString()),

                          RatingBox()
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      }
    }



    class RatingBox extends StatefulWidget {
      @override
      _RatingBoxState createState() => _RatingBoxState();
    }

    class _RatingBoxState extends State<RatingBox> {

  int _rating = 0;
  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

      @override
      Widget build(BuildContext context) {

    double _size = 20;
    print(_rating);

        return Row(
          children: [
            Container(
              padding: EdgeInsets.all(0),

              child: IconButton(
                icon: (

                _rating >= 1 ? Icon(
                  Icons.star,
                  size: _size,
                )
                : Icon(
                  Icons.star_border,
                  size: _size,
                )
                ),
                color: Colors.red[500],
                onPressed: _setRatingAsOne,
                iconSize: _size,
              ),
            ),

            Container(
              padding: EdgeInsets.all(0),

              child: IconButton(
                icon: (
                _rating >= 2 ? Icon(Icons.star,size: _size) : Icon(Icons.star_border, size: _size)
                ),
                color: Colors.red[500],
                onPressed: _setRatingAsTwo,
                iconSize: _size,
              ),
            ),

            Container(
              padding: EdgeInsets.all(0),

              child: IconButton(
                icon: (
                    _rating >= 3 ? Icon(Icons.star,size: _size) : Icon(Icons.star_border, size: _size)
                ),
                color: Colors.red[500],
                onPressed: _setRatingAsThree,
                iconSize: _size,
              ),
            ),
          ],
        );
      }
    }
