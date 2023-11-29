import 'package:flutter/material.dart';

class GeneralAlert {
  showErrorModal(BuildContext context,
      void Function() _onPressed, String _msg, double _size) {
    var size = MediaQuery.of(context).size;
    return showDialog(
      context: context,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: LayoutBuilder(builder: (context, boxConstraints) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: boxConstraints.maxWidth * .8,
                height: boxConstraints.maxWidth * .7,
                child: Container(
                  margin: EdgeInsets.all(size.width * 0.04),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: size.height * .01),
                          child: Center(
                              child: Text(
                            _msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: size.width * _size,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.fade,
                          )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: _onPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF97D2C7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  width: 1.5,
                                  color: Color(0xFF79A89F),
                                ),
                              ),
                            ),
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                fontFamily: 'Kaisei HarunoUmi',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}