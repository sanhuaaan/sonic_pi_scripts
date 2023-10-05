s=0.4
f=0.75
b=3
live_loop :sf do
  sample :loop_amen, start: s, finish: f, beat_stretch: b
  sleep (f-s).abs * b
end
