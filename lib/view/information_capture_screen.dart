
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'text_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class InformationCaptureScreen extends StatelessWidget {
  const InformationCaptureScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final editTextController = TextEditingController();
    final textStore = TextStore();

    return Scaffold(
      backgroundColor: Colors.cyan.shade200,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.cyan.shade900,
                    Colors.cyan.shade700,
                    Colors.cyan.shade400,
                    Colors.cyan.shade200
                  ]
              )
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 40, right: 40, bottom: 50),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: Observer(
                      builder: (context) {
                        return ListView.builder(
                            itemCount: textStore.observableTextList.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Card(
                                  child: Row(
                                    children: [
                                      Expanded
                                        (child: Center(
                                          child: Text(textStore.observableTextList[index], style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold))
                                      ),
                                      ),
                                      InkWell(
                                          onTap: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Column(
                                                      children: [
                                                        const Text("Editar texto", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                                                          child: TextField(
                                                              textAlign: TextAlign.center,
                                                              controller: editTextController,
                                                              style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                                                              decoration: const InputDecoration(
                                                                  hintText: "Novo texto",
                                                                  hintStyle: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                                                                  filled: true,
                                                                  fillColor: Colors.white,
                                                                  border: OutlineInputBorder()
                                                              ),
                                                              onSubmitted: (text){
                                                                if (text != ""){
                                                                  textStore.editText(index, text);
                                                                  editTextController.clear();
                                                                  Navigator.pop(context);
                                                                }
                                                              }
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                            );
                                          },
                                          child: const Icon(Icons.border_color, color: Colors.black87, size: 37,)
                                      ),
                                      InkWell(
                                          onTap: (){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Center(
                                                        child: Text("Excluir Texto?", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold))),
                                                    actionsAlignment: MainAxisAlignment.spaceEvenly,
                                                    actions: [
                                                      InkWell(
                                                        onTap: (){
                                                          textStore.removeText(index);
                                                          Navigator.pop(context);
                                                        },
                                                        child: const Text("Excluir", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
                                                      ),
                                                      InkWell(
                                                        onTap: (){
                                                          Navigator.pop(context);
                                                        },
                                                        child: const Text("Cancelar", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
                                                      )
                                                    ],
                                                  );
                                                }
                                            );
                                          },
                                          child: const Icon(Icons.cancel, color: Colors.red, size: 37,)
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      }
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 70),
                child: TextField(
                    textAlign: TextAlign.center,
                    controller: textController,
                    style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                        hintText: "Digite seu texto",
                        hintStyle: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder()
                    ),
                    onSubmitted: (text){
                      if (text != ""){
                        textStore.addText(text);
                        textController.clear();
                      }
                    }
                ),
              )
            ],
          )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: TextButton(
          onPressed: () async{
            if (!await launchUrl(Uri.parse("https://www.google.com.br"))){
              throw Exception('não conseguiu acessar a url');
            }
          },
          child: const Text("Politica de Privacidade", style: TextStyle(color: Colors.white, fontSize: 14),),
        ),
      ),
    );
  }
}
