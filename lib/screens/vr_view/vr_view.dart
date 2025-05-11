import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VRView extends StatefulWidget {
  final String link;
  final String title;
  const VRView({super.key, required this.link, required this.title});

  @override
  State<VRView> createState() => _VRViewState();
}

class _VRViewState extends State<VRView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _controller.runJavaScript('''
              // Блок для первого div (logo_4r.png)
              try {
                var divs1 = document.getElementsByTagName('div');
                var found1 = false;
                for (var i = 0; i < divs1.length; i++) {
                  var div = divs1[i];
                  if (div.style.zIndex === '3100' && 
                      div.style.backgroundImage && 
                      div.style.backgroundImage.includes('logo_4r.png')) {
                    div.style.display = 'none'; // Скрываем первый div
                    found1 = true;
                    console.log('Div 1 (logo_4r.png) hidden.');
                    break; 
                  }
                }
                if (!found1) {
                  // console.log('Div 1 (logo_4r.png) not found.');
                }
              } catch (e) {
                console.error('Error processing Div 1 (logo_4r.png):', e);
              }

              // Блок для второго div (sb_menu.png)
              try {
                var divs2 = document.getElementsByTagName('div');
                var found2 = false;
                for (var i = 0; i < divs2.length; i++) {
                  var div = divs2[i];
                  if (div.style.zIndex === '3001' && 
                      div.style.backgroundImage && 
                      div.style.backgroundImage.includes('sb_menu.png')) {
                    div.remove(); // Удаляем второй div
                    found2 = true;
                    console.log('Div 2 (sb_menu.png) removed.');
                    break; 
                  }
                }
                if (!found2) {
                  // console.log('Div 2 (sb_menu.png) not found.');
                }
              } catch (e) {
                console.error('Error processing Div 2 (sb_menu.png):', e);
              }

              // НОВЫЙ БЛОК для третьего div (btn_show_controls.png)
              try {
                var divs3 = document.getElementsByTagName('div');
                var found3 = false;
                for (var i = 0; i < divs3.length; i++) {
                  var div = divs3[i];
                  // Условия для третьего div:
                  // z-index: 3001 и background-image содержит 'btn_show_controls.png'
                  if (div.style.zIndex === '3001' && 
                      div.style.backgroundImage && 
                      div.style.backgroundImage.includes('btn_show_controls.png')) {
                    
                    div.remove(); // Удаляем третий div
                    // Или, если хотите просто скрыть:
                    // div.style.display = 'none';
                    
                    found3 = true;
                    console.log('Div 3 (btn_show_controls.png) removed.');
                    break; 
                  }
                }
                if (!found3) {
                  // console.log('Div 3 (btn_show_controls.png) not found.');
                }
              } catch (e) {
                console.error('Error processing Div 3 (btn_show_controls.png):', e);
              }
            ''');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
            ''');
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.link),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ваша настройка для AppBar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), // Ваша настройка для AppBar
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color.fromARGB(121, 0, 0, 0), // Ваша настройка для AppBar
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}