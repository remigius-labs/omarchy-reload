import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

Panel {
  id: root
  moduleName: "remi.reload"
  ipcTarget: "remi.reload"

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  function reload() {
    // Detached so the restart survives this very shell going down.
    Quickshell.execDetached(["omarchy", "restart", "shell"])
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰑓"
    tooltipText: "Reload the shell · right-click to remove"
    onPressed: function(b) {
      if (b === Qt.RightButton)
        Quickshell.execDetached(["omarchy", "plugin", "disable", "remi.reload"])
      else
        root.reload()
    }
  }
}
