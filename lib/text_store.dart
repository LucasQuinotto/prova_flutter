import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'text_store.g.dart';

class TextStore = AbstractTextStore with _$TextStore;

abstract class AbstractTextStore with Store{

  AbstractTextStore(){
    _loadTextList();
  }

  Future<void> _loadTextList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? text = prefs.getStringList('textList');
    if (text != null) {
      textList = text;
      for (var element in textList) {
        observableTextList.add(element);
      }
    }
  }

  Future<void> _saveTextList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('textList', textList);
  }

  List<String> textList = [];

  @observable
  ObservableList<String> observableTextList = ObservableList<String>();

  @action
  void addText(String text){
    textList.add(text);
    observableTextList.add(text);
    _saveTextList();
  }

  @action
  void editText(int indexText, String newText){
    textList[indexText] = newText;
    observableTextList[indexText] = newText;
    _saveTextList();
  }

  @action
  void removeText(int indexText){
    textList.removeAt(indexText);
    observableTextList.removeAt(indexText);
    _saveTextList();
  }
}
