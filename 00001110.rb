bpm = 40
live_loop :amen_break do
  use_bpm bpm
  sample :loop_amen, beat_stretch: 2, rate: -1
  sleep 2
end

live_loop :fwfw do
  use_bpm bpm
  sleep 1
  play rrand(60,90)
  sleep 1
end

