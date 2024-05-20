export const timePoll = Utils.derive([Variable<Date>(new Date(), {
  poll: [1000, 'date +%s', (o) => new Date(Number(o) * 1000)]
})], (o) => o
  .toLocaleTimeString(undefined, {
    hour: '2-digit',
    minute: '2-digit',
    hour12: false
  }));

const Time = () => Widget.Box({
  className: 'card outline',
  child: Widget.Box({
    spacing: 10,
    children: [
      Widget.Label({ label: '󰥔', css: 'color: @base08' }),
      Widget.Label({
        label: timePoll.bind(),
      }),
    ]
  })
});

export default Time;
