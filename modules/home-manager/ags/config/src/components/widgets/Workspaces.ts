const hyprland = await Service.import('hyprland')

const dispatch = (ws: number | string) => hyprland.messageAsync(`dispatch workspace ${ws}`);

const Workspaces = () => Widget.EventBox({
  onScrollUp: () => dispatch('+1'),
  onScrollDown: () => dispatch('-1'),
  child: Widget.Box({
    children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
      attribute: i,
      onClicked: () => dispatch(i),
      className: 'workspace',
      vpack: 'center'
    }).hook(hyprland, (self => {
      self.toggleClassName('has-app', hyprland.workspaces.some((w) => w.id === (self.attribute) && (hyprland.active.workspace.id !== self.attribute)));
      self.toggleClassName('active', hyprland.active.workspace.id === self.attribute);
    }))),
    className: 'card lg outline',
    spacing: 8,
    vertical: false,
  }),
})

export default Workspaces
