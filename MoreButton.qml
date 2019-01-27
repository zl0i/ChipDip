import QtQuick 2.4
import QtQuick.Controls 2.4


Item {
    id: _item
    property bool isOpen: false
    property var butArr: []
    signal addElement()
    signal editElement()
    signal deleteElement()
    signal calcTotal()

    property bool b_add: false
    property bool b_edit: false
    property bool b_delete: false
    property bool b_total: false

    FuncButton {
        color: "red"
        id: _mainbut
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 25//-width/2
        anchors.rightMargin: 25//-height/2
        source: "qrc:/image/more.png"
        onClicked: {
            startAnimationImage()

            if(!isOpen) {
                var cnt = 1

                if(b_delete === true) {
                    butArr[cnt-1] = _buttonComponent.createObject(_item, {"num": cnt, "state": "delete"})
                    cnt++
                }
                if(b_edit === true) {
                     butArr[cnt-1] = _buttonComponent.createObject(_item, {"num": cnt, "state": "edit"})
                     cnt++
                }
                if(b_add === true) {
                    butArr[cnt-1] = _buttonComponent.createObject(_item, {"num": cnt, "state": "add"})
                    cnt++
                }
                if(b_total === true) {
                    butArr[cnt-1] = _buttonComponent.createObject(_item, {"num": cnt, "state": "total"})
                    cnt++
                }
                isOpen = true
            }
            else {
                closeAll()
            }
        }

    }
    Component {
        id: _buttonComponent
        FuncButton {
           property int num: 1
           id: _button
           anchors.horizontalCenter: _mainbut.horizontalCenter
           y: _mainbut.y
           z: _mainbut.z-1           
           Component.onCompleted: {
               _animOpen.start()
           }
           state: "add"
           onClicked: {
               switch(state) {
                   case "add":
                       addElement()                       
                       break;
                   case "edit":
                       editElement()                        
                       break;
                   case "delete":
                       deleteElement()                       
                       break;
                   case "total":
                       calcTotal()                      
                       break;
               }
           }
           states: [
               State {
                   name: "add"
                   PropertyChanges {
                       target: _button
                       source: "qrc:/image/add.png"
                   }
               },
               State {
                   name: "edit"
                   PropertyChanges {
                       target: _button
                       source: "qrc:/image/edit.png"
                   }
               },
               State {
                   name: "delete"
                   PropertyChanges {
                       target: _button
                       source: "qrc:/image/delete.png"
                   }
               },
               State {
                   name: "total"
                   PropertyChanges {
                       target: _button
                       source: "qrc:/image/total.png"
                   }
               }
           ]
           NumberAnimation {
               id: _animOpen
               target: _button
               property: "y"
               from: _mainbut.y
               to: _mainbut.y - 75 * _button.num
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped: {
                   _button.y = to
               }
           }
           NumberAnimation {
               id: _animClose
               target: _button
               property: "y"
               from: _mainbut.y - 75 * _button.num
               to: _mainbut.y
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped:  {
                     butArr[num-1].destroy()
               }
           }
           function close () {
               _animClose.start()
           }
        }
    }

    function closeAll() {

        for(var i = 0; i < butArr.length; i++) {
            butArr[i].close()
        }
        isOpen = false
    }









}



