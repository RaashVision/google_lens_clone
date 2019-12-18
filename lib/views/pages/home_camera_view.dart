import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_lens_clone/models/carousal_item_model.dart';
import 'package:google_lens_clone/viewmodels/home_camera_viewmodel.dart';
import 'package:google_lens_clone/views/core/base_view.dart';
import 'package:google_lens_clone/views/pages/random_particles_view.dart';
import 'package:google_lens_clone/views/pages/search_image_view.dart';
import 'package:google_lens_clone/views/widgets/carousal_slider_widget.dart';
import 'package:google_lens_clone/views/widgets/lens_appbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HomeCameraView extends StatefulWidget {
  @override
  _HomeCameraViewState createState() => _HomeCameraViewState();
}




class _HomeCameraViewState extends State<HomeCameraView> with SingleTickerProviderStateMixin{
  CameraController cameracontroller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;
  int maincameraindex = 0; //back camera
  BuildContext _context;
  @override
  void initState() {

    super.initState();
     availableCameras().then((availableCameras) {

      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });

    //Initiliaze camera controller
    // _initCameraController(cameras[maincameraindex]).then((void v) {});
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameracontroller != null) {
      await cameracontroller.dispose();
    }

    cameracontroller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    cameracontroller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (cameracontroller.value.hasError) {
        print('Camera error ${cameracontroller.value.errorDescription}');
      }
    });

    try {
      await cameracontroller.initialize();
    } on CameraException catch (e) {
     // _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }
 
final List<CarousalItemModel> _carousallist = [

  CarousalItemModel(Icons.translate,"Translate"),
  CarousalItemModel(Icons.library_books,"Text"),
  CarousalItemModel(Icons.search,"Auto"),
  CarousalItemModel(Icons.shopping_cart,"Shopping"),
  CarousalItemModel(Icons.fastfood,"Dining"),
];




  @override
  Widget build(BuildContext context) {

    //temporart solution
    _context = context;
     return BaseView<HomeCameraViewModel>(
        onModelReady: (model)=> model.getDefaultData(),
           builder: (context, model, child) =>  Scaffold(
            backgroundColor: Colors.black,
             body:  Stack(

           children: <Widget>[
           (cameras !=  null) ?  CameraPreview(cameracontroller) :Container(),
             Positioned.fill(child :LensParticles(15)),
             CustomCarousalSlider(_carousallist,selectedpage),
              Align(
                alignment: Alignment.topCenter,
                child: LensAppBar(true,null,OpenGallery)),
         
           ],
         ),

           )
     );
  }


  void selectedpage(int pagindex) async{

     // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      
      // Attempt to take a picture and log where it's been saved
      final path = join(
        // In this example, store the picture in the temp directory. Find
        // the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      await cameracontroller.takePicture(path);

      var decodedImage = await decodeImageFromList(File(path).readAsBytesSync());

     await Navigator.push(_context, PageTransition(type: PageTransitionType.fade, child:  SearchImageView(imagePath: path,islandscape: decodedImage.width > decodedImage.height,)));

    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  
void OpenGallery() async{

  int ds = 0;

 // model.services.i_imagepicker.pickerImageFromGallery();

}

}