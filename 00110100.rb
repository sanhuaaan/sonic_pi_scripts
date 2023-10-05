live_loop :Roy do
  use_synth :tech_saws
  use_synth_defaults release: 0.3, cutoff: 95
  n=(octs :c, 3)
  with_fx :reverb, room: 1 do
    15.times do
      play n.tick
      sleep 0.125
    end
    play n[1]
    sleep 0.125
  end
end

s="D:/Sonic Pi samples/hits/K01Hit-Kick02.wav"

live_loop :Pris, sync: :Roy do
  10.times do
    sample s if spread(6,10).tick(:a)
    sleep 0.125
  end
  6.times do
    sample s if spread(5,6).tick(:b)
    sleep 0.125
  end
end

