import Workspaces from "src/components/widgets/Workspaces";
import Spacing from "src/components/widgets/Spacing"
import Time from "src/components/widgets/Time";
import Systray from "src/components/widgets/Systray";
import Volume from "src/components/widgets/Volume";
import Network from "src/components/widgets/Network";
import BarIcon from "src/components/widgets/BarIcon";


const windowName = "ags-bar";

const bar = () => Widget.Window({
  name: windowName,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  margins: [4, 4, 4, 4],
  monitor: 0,
  child: Widget.Box({
    spacing: 4,
    vertical: false,
    children: [
      Widget.Box({
        children: [
          Workspaces(),
          Spacing(),
          Time(),
          Volume(),
          Network(),
          Systray(),
          BarIcon(),
        ],
        vertical: false,
        spacing: 4,
        className: 'bar'
      })
    ]
  })
})

export default bar();
