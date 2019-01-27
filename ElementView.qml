import QtQuick 2.11
import QtQuick.Controls 2.4


Item {
    property var addDlg
    Loader {
        id: _loader
        anchors.fill: parent
        sourceComponent: _elementcomponent
    }
    Component {
        id: _elementcomponent
        Item {
            anchors.fill: parent
            MyList {
                id: _list
                anchors.fill: parent
                model: _workdb.list_ElementTableModel
                onOpenTable: {
                    _workdb.updateTableModel(String(table))
                    _loader.sourceComponent = _tablecomponent
                }
            }
            MoreButton {
                //z: _loader.z + 1
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: 50
                b_add: true
                b_delete: true

                onAddElement: {
                    addDlg = _addTable.createObject(_loader)
                }
                onDeleteElement: {
                    _list.select = true
                }
            }
        }
    }
    Component {
        id: _tablecomponent
        Item {
            anchors.fill: parent
            ElementList {
                state: "element"
                anchors.fill: parent
                onBack: {
                    _loader.sourceComponent = _elementcomponent
                }
            }
            MoreButton {
                //z: _loader.z + 1
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: 50
                b_add: true
                b_edit: true
                b_delete: true

                onAddElement: {
                    //addDlg = _addTable.createObject(_elementcomponent)
                }
                onDeleteElement: {
                    console.log("delete")
                }
            }
        }
    }
    Component {
        id: _addTable
        AddTable {

            anchors.centerIn: parent
            onCreateTable: {
                _workdb.createTable(String(name))

            }
            onCansle: {
                addDlg.destroy()
            }

        }
    }

}
