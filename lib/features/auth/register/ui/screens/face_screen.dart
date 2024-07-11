import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:operator_test/features/auth/register/ui/screens/result_screen.dart';

class FaceScreen extends StatefulWidget {
  const FaceScreen(
      {super.key,
      required this.cardNumber,
      required this.cardAccess,
      required this.name,
      required this.email,
      required this.camera,
      required this.card});

  final String? cardNumber;
  final String? cardAccess;
  final String name;
  final String email;
  final CameraDescription camera;
  final String card;

  @override
  State<FaceScreen> createState() => _FaceScreenState();
}

class _FaceScreenState extends State<FaceScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Ambil Foto Wajah",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Tolong posisikan wajah Anda di tengah area selfie dan lalu ambil foto.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(0.0),
                      decoration: BoxDecoration(
                        border:
                        Border.all(color: Color(0xff7CFFFF), width: 5.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                        child: OverflowBox(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * _controller.value.aspectRatio,
                              child: CameraPreview(_controller),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              IconButton(
                onPressed: () async {
                  // Take the Picture in a try / catch block. If anything goes wrong,
                  // catch the error.
                  try {
                    // Ensure that the camera is initialized.
                    await _initializeControllerFuture;

                    // Attempt to take a picture and get the file `image`
                    // where it was saved.
                    final image = await _controller.takePicture();

                    if (!context.mounted) return;

                    // If the picture was taken, display it on a new screen.
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          // Pass the automatically generated path to
                          // the DisplayPictureScreen widget.
                          cardAccess: widget.cardAccess,
                          cardNumber: widget.cardNumber,
                          name: widget.name,
                          email: widget.email,
                          cardPhoto: widget.card,
                          facePhoto: image.path,
                        ),
                      ),
                    );
                  } catch (e) {
                    // If an error occurs, log the error to the console.
                    print(e);
                  }
                },
                icon: Column(
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Text(
                      "Ambil Foto",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
