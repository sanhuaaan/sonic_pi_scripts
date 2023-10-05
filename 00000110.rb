live_loop :bass do
  use_synth :prophet
  #play 60
  #sleep 0.25
  play 60, attack: 0.7
  sleep 2.25
  play 70, attack: 0, release: 0.2
  sleep 0.75
  play 77
  sleep 1
end

live_loop :drum do
  sample :drum_bass_hard
  sleep 0.35
  sample :drum_cymbal_pedal
  sleep 0.15
end

live_loop :lead do
  use_synth :zawa
  if one_in(6)
    use_transpose 2
  else
    use_transpose 0
  end
  play_pattern_timed [:c2, :d2, :e2, :d2], [0.5, 0.25, 0.75, 0.5], attack: 0, release: 0.2
end
