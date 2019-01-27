import QtQuick 2.11
import QtQuick.Controls 2.4

Rectangle {
    width: 220
    height: 100
    color: "#FA8072"
    signal createTable(var name)
    signal cansle()
    Column {
        anchors.centerIn: parent
        spacing: 10
        TextField {
            id: _nameTable
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Название"
        }
        Row {
            spacing: 5
            Button {
                text: "Создать"
                onClicked: {
                    if(_nameTable.text.length !== 0) {
                        createTable(_nameTable.text)
                        destroy()
                    }
                }
            }
            Button {
                text: "Отмена"
                onClicked: {
                    cansle()
                }
            }
        }
    }

}
