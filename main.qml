import QtQuick 2.3
import QtQuick.Window 2.2

import Pairs 1.0

Window {
    id: window
    visible: true
    width: 800
    height: 600
    minimumHeight: 400
    minimumWidth: 400

    Field {
        id: field
    }

    Rectangle {
        id: board
        color: "lightgray"
        anchors.fill: parent
        anchors.margins: 10

        Grid {
            id: grid
            rows: field.width
            columns: field.height
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 4

            Repeater {
                model: field.width * field.height

                Rectangle {
                    id: cellItem
                    width: window.width/field.width - grid.spacing*1.5
                    height: window.height/field.height - grid.spacing*1.5
                    property Cell cell: field.cellAt(index % field.width, index / field.width)

                    Image {
                        anchors.fill:parent
                        source: "qrc:images/img/"+cell.key+".png"
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
