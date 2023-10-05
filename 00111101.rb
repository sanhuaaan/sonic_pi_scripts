live_loop :sliced_amen do
  n = 8
  s =  line(0, 1, steps: n).choose
  f = s + (1.0 / n)
  sample :loop_amen, beat_stretch: 1.5, start: s, finish: f
  sleep 1.5  / n
end

