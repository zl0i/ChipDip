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

    FuncButton {
        color: "green"
        id: _mainbut
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 25//-width/2
        anchors.rightMargin: 25//-height/2
        onClicked: {
            if(!isOpen) {                
                butArr[0] = (_but1.createObject(_item, {"num": 1, "onClicked": deleteElement()}))
                butArr[1] = (_but2.createObject(_item, {"num": 2}))
                butArr[2] = (_but3.createObject(_item, {"num": 3}))
                isOpen = true
            }
            else {
                butArr[0].close()
                butArr[1].close()
                butArr[2].close()
                isOpen = false
            }

        }
    }

    Component {
        id: _but1
        FuncButton {
           property int num: 0
           property var c
           id: _bb
           anchors.horizontalCenter: _mainbut.horizontalCenter
           y: _mainbut.y
           z: _mainbut.z-1
           onClicked: {

               //deleteElement()
           }
           Component.onCompleted: {
               _animOpen.start()

           }          
           NumberAnimation {
               id: _animOpen
               target: _bb
               property: "y"
               from: _mainbut.y
               to: _mainbut.y - 75 * _bb.num
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped: {
                   _bb.y = to
               }
           }
           NumberAnimation {
               id: _animClose
               target: _bb
               property: "y"
               from: _mainbut.y - 75 * _bb.num
               to: _mainbut.y
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped:  {
                  _bb.destroy()
               }
           }
           function close () {
               _animClose.start()
           }
        }
    }
    Component {
        id: _but2
        FuncButton {
           property int num: 0
           id: _bb
           anchors.horizontalCenter: _mainbut.horizontalCenter
           y: _mainbut.y
           z: _mainbut.z-1
           Component.onCompleted: {
               _animOpen.start()
           }
           onClicked: {
               editElement()
           }
           NumberAnimation {
               id: _animOpen
               target: _bb
               property: "y"
               from: _mainbut.y
               to: _mainbut.y - 75 * _bb.num
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped: {
                   _bb.y = to
               }
           }
           NumberAnimation {
               id: _animClose
               target: _bb
               property: "y"
               from: _mainbut.y - 75 * _bb.num
               to: _mainbut.y
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped:  {
                   _bb.destroy()

               }
           }
           function close () {
               _animClose.start()
           }
        }
    }

    Component {
        id: _but3
        FuncButton {
           property int num: 0
           id: _bb
           anchors.horizontalCenter: _mainbut.horizontalCenter
           y: _mainbut.y
           z: _mainbut.z-1
           Component.onCompleted: {
               _animOpen.start()

           }
           onClicked: {
               addElement()
           }

           NumberAnimation {
               id: _animOpen
               target: _bb
               property: "y"
               from: _mainbut.y
               to: _mainbut.y - 75 * _bb.num
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped: {
                   _bb.y = to
               }
           }
           NumberAnimation {
               id: _animClose
               target: _bb
               property: "y"
               from: _mainbut.y - 75 * _bb.num
               to: _mainbut.y
               duration: 200
               running: false
               easing.type: Easing.InOutQuad
               onStopped:  {
                   _bb.destroy()

               }
           }
           function close () {
               _animClose.start()
           }
        }
    }




}



