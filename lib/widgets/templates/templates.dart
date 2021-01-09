import 'package:flutter/material.dart';
import 'package:mi_card/widgets/templates/templatesModel.dart';

bool _isChecked = false;

// Announce Page
class Templates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 30),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 100),
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/template.png"),
                  fit: BoxFit.fitHeight)),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Templates',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                    child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Search Template',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[400])),
                      prefixIcon: Icon(Icons.search, color: Colors.blue[400])),
                ))
              ],
            )),
        Expanded(child: TemplatePage(kTemplates)),
      ]))),
    );
  }
}

class _TemplateListItem extends ListTile {
  _TemplateListItem(Template template)
      : super(
            onTap: () {},
            title: new Text(template.title),
            subtitle: new Text(template.categoryAndDateTime),
            leading:
                new Checkbox(value: _isChecked, onChanged: (bool value) {}));
}

class TemplatePage extends StatelessWidget {
  final List<Template> _templates;

  TemplatePage(this._templates);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (context, index) {
        return new _TemplateListItem(_templates[index]);
      },
      itemCount: _templates.length,
    ));
  }
}
