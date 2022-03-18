import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

ApplicationWindow{
    id: window
    width: 1024
    height: 640
    visible: true
    title: qsTr("Notes")
    color: Qt.rgba(0.5,0.5,0.5,0.9)
    flags:  Qt.WA_TranslucentBackground

    Rectangle {
           id: toolbar
           height: parent.height/18
           anchors.top: parent.top
           anchors.left: parent.left
           anchors.right: parent.right
           color: Qt.rgba(1,1,1,0.5)
           RowLayout {
               id: toolbarLayout
               anchors.topMargin: 5
               anchors.fill: parent
               spacing: 10
               Rectangle {
                   id: backButton
                   height: toolbar.height-10
                   width: height*2
                   color: Qt.rgba(0.3,0.3,0.3,0.6)
                   radius: 3
                   anchors.left: parent.left
                   anchors.leftMargin: 10
                   Image {
                       height: parent.height
                       width: height
                       x: parent.width/4
                       source: "qrc:/resources/back.svg"
                   }
               }
               Rectangle {
                   id: writeButton
                   height: toolbar.height-10
                   width: height*2
                   color: Qt.rgba(0.3,0.3,0.3,0.6)
                   radius: 3
                   anchors.left: backButton.right
                   anchors.leftMargin: 10
                   Image {
                       height: parent.height
                       width: height
                       x: parent.width/4
                       source: "qrc:/resources/write.svg"
                   }
               }
               ComboBox {
                   id: fontselect
                   height:toolbar.height-10
                   width: height*4
                   model: [ "Arial", "Apple", "Coconut" ]
                   anchors.left: writeButton.right
                   anchors.leftMargin: 10
                   flat: true
                   background: Rectangle {
                           implicitWidth: parent.width
                           implicitHeight: parent.height

                           radius: 3
                           color: Qt.rgba(0.3,0.3,0.3,0.6)
                           border.color: control.palette.highlight
                           border.width: !control.editable && control.visualFocus ? 2 : 0
                           visible: !control.flat || control.down
                       }
               }
               ComboBox {
                   id: fontsizeselect
                   height:toolbar.height-10
                   width: 50
                   model: [ "22", "25", "26" ]
                   anchors.left: fontselect.right
                   anchors.leftMargin: 10
                   flat: true
                   background: Rectangle {
                           implicitWidth: parent.width
                           implicitHeight: parent.height

                           radius: 3
                           color: Qt.rgba(0.3,0.3,0.3,0.6)
                           border.color: control.palette.highlight
                           border.width: !control.editable && control.visualFocus ? 2 : 0
                           visible: !control.flat || control.down
                       }
               }
               Rectangle {
                   id: fontStyleSwitch
                   height: toolbar.height-10
                   width: height*4
                   color: Qt.rgba(0.3,0.3,0.3,0.6)
                   radius: 3
                   anchors.left: fontsizeselect.right
                   anchors.leftMargin: 10
                   Image {
                       id: boldimage
                       height: parent.height
                       width: height
                       source: "qrc:/resources/bold.svg"
                   }
                   Image {
                       id: italicimage
                       anchors.left: boldimage.right
                       height: parent.height
                       width: height
                       source: "qrc:/resources/italic.svg"
                       anchors.leftMargin: (parent.width-height*3)/2
                   }
                   Image {
                       id: underlineimage
                       anchors.left: italicimage.right
                       height: parent.height
                       width: height
                       source: "qrc:/resources/underline.svg"
                       anchors.leftMargin: (parent.width-height*3)/2
                   }
               }
               Rectangle {
                   id: tickButton
                   height: toolbar.height-10
                   width: height*2
                   color: Qt.rgba(0.3,0.3,0.3,0.6)
                   radius: 3
                   anchors.left: fontStyleSwitch.right
                   anchors.leftMargin: 10
                   Image {
                       height: parent.height
                       width: height
                       x: parent.width/4
                       source: "qrc:/resources/tick.svg"
                   }
               }
               Rectangle {
                   id: ableButton
                   height: toolbar.height-10
                   width: height*2
                   color: Qt.rgba(0.3,0.3,0.3,0.6)
                   radius: 3
                   anchors.left: tickButton.right
                   anchors.leftMargin: 10
                   Image {
                       height: parent.height
                       width: height
                       x: parent.width/4
                       source: "qrc:/resources/table.svg"
                   }
               }
           }
        }
    Flickable {
           id: flickable
           flickableDirection: Flickable.VerticalFlick
           anchors.topMargin: parent.height/18
           anchors.fill: parent
           anchors.top: toolbar.bottom
           width: parent.width
           height: parent.height - parent.height/18
           TextArea.flickable: TextArea {
               id: textArea
               textFormat: Qt.RichText
               wrapMode: TextArea.Wrap
               focus: true
               selectByMouse: true
               persistentSelection: true
               anchors.fill: parent
               anchors.top: toolbar.bottom
               leftPadding: 6
               rightPadding: 6
               topPadding: 0
               bottomPadding: 0
               background: null

               MouseArea {
                   acceptedButtons: Qt.RightButton
                   anchors.fill: parent
                   onClicked: contextMenu.open()
               }

               onLinkActivated: Qt.openUrlExternally(link)
           }

           ScrollBar.vertical: ScrollBar {}
       }

}
