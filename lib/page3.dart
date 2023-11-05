import 'package:flutter/material.dart';

import 'assets_page.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/SSBS.jpeg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0), // Adjust the margin as needed
            child: Text("You are at", style: TextStyle(fontSize: 18)),
          ),
          Container(
            padding: EdgeInsets.all(8.0), // Adjust the padding as needed
            child: Card(
              elevation: 5, // Adjust the elevation value to control the level of elevation
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "SHAHEED SUKHDEV COLLEGE",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(35.0), // Adjust the padding as needed
            child: Text("Do you wish to start your tour?", style: TextStyle(fontSize: 18)),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Container(
                padding: EdgeInsets.only(left: 0.0, top: 20, bottom: 31.2, right: 0.0),
                child: Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AssetsPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                          padding: EdgeInsets.all(15.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Text("Yes"),
                      ),
                      SizedBox(width: 16.0), // Add space between buttons
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                          padding: EdgeInsets.only(top:12.0, left: 0.0, right: 0.0, bottom: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Text("No"),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
