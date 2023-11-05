import 'package:flutter/material.dart';
import 'project.dart';

class TeamFolderPage extends StatelessWidget {
  const TeamFolderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Image Section
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text Box
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                /* Text(
                  'Your Text Here',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ), */

                const SizedBox(height: 30), // Adjust the height as needed
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProjectPage(folderName: ''), // Navigate to the NextPage
                      ),
                    );
                    // Add the action you want the button to perform here
                  },style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87), // Change the background color here
                ),
                  child: Text("Let's get Started"),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
