import QtQuick 2.11
import QtQuick.Controls 2.4


Item {

    Loader {
        id: _loader
        anchors.fill: parent
        sourceComponent: _elementcomponent
    }
    MoreButton {
        z: _loader.z + 1
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 50


    }
    Component {
        id: _elementcomponent
        MyList {
            anchors.fill: parent
            model: _workdb.list_ProjectTableModel
            onOpenTable: {
                _workdb.updateTableModel(String(table))
                _loader.sourceComponent = _tablecomponent
            }
        }
    }
    Component {
        id: _tablecomponent
        ElementList {
            state: "project"
            anchors.fill: parent
            onBack: {
                _loader.sourceComponent = _elementcomponent
            }
        }

    }

}
