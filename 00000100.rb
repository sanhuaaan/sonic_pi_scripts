# Welcome to Sonic Pi v2.10

t=1

live_loop :bat do
  if (t==3)
    sample :drum_tom_lo_hard
    t=0
  else
    sample :drum_bass_hard
    t+=1
  end
  sleep 0.204
end

live_loop :bass do
  sync :bat
  use_synth :blade
  play 50, release: 0.175
  sleep 0.204
end
