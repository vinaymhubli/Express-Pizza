import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pizza_order/rating/congrats.dart';

class DialogBox extends StatefulWidget {
  DialogBox({Key? key}) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  var _slidingcontroller = PageController();
  var _starposition = 200.0;
  var _ratingfeature = 0;
  var _selecteditems = -1;
  var _detailview = false;

  late final rating = [
    'Extra cheese',
    'Fast delivery',
    'Poor',
    'Average',
    'Good',
    'Best',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(
            height: max(300, MediaQuery.of(context).size.height * 0.3),
            child: PageView(
              controller: _slidingcontroller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildthanknotes(),
                _rateof(),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Color.fromARGB(255, 230, 112, 48),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Congrats()));
                  },
                  child: Text('Done'),
                  textColor: Colors.white,
                ),
              )),
          Positioned(
              right: 0,
              child: MaterialButton(
                onPressed: hidedialog,
                child: Text('Skip'),
                textColor: Colors.grey,
              )),
          AnimatedPositioned(
            top: _starposition,
            left: 0,
            right: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => IconButton(
                          icon: index < _ratingfeature
                              ? Icon(
                                  Icons.star,
                                  size: 32,
                                  color: Colors.orange,
                                )
                              : Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.orange,
                                  size: 32,
                                ),
                          onPressed: () {
                            _slidingcontroller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceInOut);
                            setState(() {
                              _starposition = 20.0;
                              _ratingfeature = index + 1;
                            });
                          },
                        ))),
            duration: Duration(milliseconds: 300),
          ),
          if (_detailview)
            Positioned(
                left: 0,
                top: 0,
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _detailview = false;
                    });
                  },
                  child: Icon(Icons.arrow_back),
                ))
        ],
      ),
    );
  }

  _buildthanknotes() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Thanks for ordering',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 230, 112, 48),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'we\'d love to get feedback',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'cheers for next order',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  _rateof() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_detailview,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('What could be better?'),
              Wrap(
                spacing: 10.0,
                alignment: WrapAlignment.center,
                children: List.generate(
                    rating.length,
                    (index) => InkWell(
                          onTap: () {
                            setState(() {
                              _selecteditems = index;
                            });
                          },
                          child: Chip(
                              backgroundColor: _selecteditems == index
                                  ? Colors.red
                                  : Colors.grey[100],
                              label: Text(rating[index])),
                        )),
              ),
              SizedBox(
                height: 12.0,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      _detailview = true;
                    });
                  },
                  child: Text(
                    'Want to tell us more?',
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
          replacement: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tell us more'),
              Chip(label: Text('Contact us 9988774455')),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  hidedialog() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}
