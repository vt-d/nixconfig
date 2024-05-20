const network = await Service.import('network')

const Network = () => Widget.Box({
  spacing: 12,
  children: [
    Widget.Label({
      label: '',
      css: 'font-size: 12; color: @base0A;'
    }),
    Widget.Label({
      label: network.wifi.bind('ssid')
        .as(ssid => ssid || 'Unknown'),
    }),
  ],
  className: 'card outline',
})

export default Network;
