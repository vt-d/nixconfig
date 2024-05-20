const audio = await Service.import('audio');

const Volume = () => {
  return Widget.Box({
    className: 'card outline',
    child: Widget.Button({
      onClicked: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
      onScrollUp: () => (audio.speaker.volume = audio.speaker.volume + 1 / 100),
      onScrollDown: () => (audio.speaker.volume = audio.speaker.volume - 1 / 100),
      child: Widget.Box({
        spacing: 12,
        children: [
          Widget.Label({
            css: 'font-size: 12px; color: @base09;'
          }).hook(audio.speaker, (self) => {
            if (audio.speaker.is_muted || audio.speaker.stream?.is_muted) {
              self.label = '';
              return;
            }

            self.label = '';
          }),


          Widget.Label({ css: 'padding-right: 4px' })
            .bind('label', audio.speaker, 'volume', (v) => `${Math.trunc(v * 100)}%`)
        ],
      }),
    })
  });
};

export default Volume;
