interface CavaWidgetParams {
  spacing: number;
  barsNumber: number;
}

const Cava = (params: CavaWidgetParams) => {
  const bars = Variable<number[]>([], {
    listen: [[
      'bash',
      '-c',
      `printf "[general]\n \
        bars = ${params.barsNumber}\n \
        [output]\n \
        method = raw\n \
        raw_target = /dev/stdout\n \
        data_format = ascii\n \
        ascii_max_range = 1080" | \
        cava -p /dev/stdin`
    ], (o) => o.split(';').map(o => Number(o))]
  });


  const widget = Widget.Box({
    setup: (self) => self.on('destroy', () => bars.dispose()),

    css: `min-height: 1080px;`,
    spacing: params.spacing,
    hexpand: true,
    vexpand: true,
  });

  widget.children = [...Array(params.barsNumber).keys()].map((k) => Widget.Box({
    className: 'card cava-bar',
    css: `min-width: 50px;`,
    hexpand: true,
    vexpand: true,
    vpack: 'end',
    heightRequest: bars.bind().as((b) => b[k]),
  }))

  return widget;
};

export default Cava;
