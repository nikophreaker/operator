import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:operator_test/features/auth/register/ui/screens/form_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key, required this.card,required this.camera});

  final CameraDescription camera;
  final String card;
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

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
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Pindai ${widget.card}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Tempatkan ${widget.card} Anda di dalam kotak.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(_controller);
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
                        builder: (context) => FormScreen(
                          // Pass the automatically generated path to
                          // the DisplayPictureScreen widget.
                          camera: widget.camera,
                          imagePath: image.path,
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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


