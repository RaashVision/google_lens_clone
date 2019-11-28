import 'package:flutter/material.dart';
import 'package:google_lens_clone/interfaces/i_flashlight.dart';
import 'package:google_lens_clone/locator.dart';

class LensAppBar extends StatefulWidget {

  final Function (bool) toggleflash;

  LensAppBar(this.toggleflash);


  @override
  _LensAppBarState createState() => _LensAppBarState();
}

class _LensAppBarState extends State<LensAppBar> {

  bool toggle_flash = false;
  @override
  Widget build(BuildContext context) {
     return Container(
           color: Colors.transparent,
           width: MediaQuery.of(context).size.width,
           height: 80, child: AppBar(backgroundColor: Colors.transparent , centerTitle: true, title: Text('Google Lens'),
           elevation: 0.0,
           leading: GestureDetector(
             onTap: (){

                  //IFlashLight i_flashlight = locator<IFlashLight>();

               if(toggle_flash){
                 toggle_flash = false;
               }
               else{
                 toggle_flash = true;
               }
               setState(() {
                 
               });

             },

             child: toggle_flash ?Icon(Icons.flash_on) : Icon(Icons.flash_off),
           ),
            actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.image),
                  onPressed: () {
                    // Implement navigation to shopping cart page here...
                  
                  },
                ),
                _morePopup()
               
                // IconButton(
                //   padding: EdgeInsets.all(5.0),
                //   icon: Icon(Icons.more_vert),
                //   onPressed: () {
                //     // Implement navigation to shopping cart page here...
                //    _simplePopup();
                //   },
                // ),
              ],
           
           
           
            ));
  }

Widget _morePopup() =>  PopupMenuButton<String>(
    offset: Offset(0, 100),
    icon: Icon(Icons.more_vert),
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: "feedback",
                  child: Text("Send Feedback"),
                ),
                PopupMenuItem(
                  value: "privacy",
                  child: Text("Privacy Policy"),
                ),
                 PopupMenuItem(
                  value: "privacy",
                  child: Text("Terms of Services"),
                ),
              ],
        );





}