import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _firstNumTEController = TextEditingController();
  final TextEditingController _secondNumTEController = TextEditingController();
  final GlobalKey<FormState> _fomrkey = GlobalKey<FormState>();
  double _result =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum App'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _fomrkey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNumTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter 1st Number',
                  labelText: '1st Number',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Enter a valid value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _secondNumTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter 2nd Number',
                  labelText: '2nd Number',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Enter a valid value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30,),
              _buildButtonBar(),
              const SizedBox(height: 16,),
              Text('Result :  ${_result.toStringAsFixed(4)}',
                style: const TextStyle(
                fontSize: 24,
              ),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: _onTapAddButton,
                    icon: Icon(Icons.add),
                ),
                IconButton(
                    onPressed: _onTapSubtractionButton,
                    icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: _onTapMultipllicationButton,
                  icon: Icon(Icons.star_rate_rounded),
                ),
                IconButton(
                  onPressed: _onTapDivisionButton,
                  icon: Icon(Icons.safety_divider),
                ),
              ],
            );
  }

  void _onTapAddButton(){
    /*if(_validateTextFields() == false){
      return;
    };*/
    if(_fomrkey.currentState!.validate()){
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      _result = firstNum + secondNum;
      setState((){});
    }
  }
  void _onTapSubtractionButton(){
    if(_fomrkey.currentState!.validate()){
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      if (firstNum > secondNum){
        _result = firstNum - secondNum;
      }else{
        _result = secondNum - firstNum;
      }
      setState((){});
    }
  }
  void _onTapMultipllicationButton(){
    if(_fomrkey.currentState!.validate()==false){
      return;
    } //this same as the one above- a different way
    double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
    double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
    _result = firstNum * secondNum;
    setState((){});
  }
  void _onTapDivisionButton(){
    if(_fomrkey.currentState!.validate()){
      double firstNum = double.tryParse(_firstNumTEController.text) ?? 0;
      double secondNum = double.tryParse(_secondNumTEController.text) ?? 0;
      if (firstNum > secondNum){
        _result = firstNum / secondNum;
      }else{
        _result = secondNum / firstNum;
      }
      setState((){});
    }
  }

  @override
  void dispose() {
    _firstNumTEController.dispose();
    _secondNumTEController.dispose();
    super.dispose();
  }

  /*bool _validateTextFields(){
    if(_firstNumTEController.text.isEmpty){
      return false;
    }
    if(_secondNumTEController.text.isEmpty){
      return false;
    }
    return true;
  }*/
}
