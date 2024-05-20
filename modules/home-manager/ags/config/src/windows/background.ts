import Cava from "src/components/widgets/Cava";

export const windowName = 'ags-window';

export const background = () => {
  return Widget.Window({
    name: 'ags-window',
    layer: 'background',

    child: Widget.Box({
      vertical: true,
      vexpand: true,
      hexpand: true,
      children: [
        Cava({ barsNumber: 26, spacing: 2 })
      ],
    }),
  });
};

export default background;
