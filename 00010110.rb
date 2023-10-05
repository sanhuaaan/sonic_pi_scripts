BRriff = [60,60,62,63].ring

live_loop :Roy do
  use_synth :fm
  4.times do
    with_fx :octaver, mix: 0.7 do
      play BRriff.tick, release: 0.2
      sleep 0.125
    end
  end
end

live_loop :Pris, sync: :Roy do
  sample :drum_snare_soft, amp: 1.5 if spread(3,8).tick
  sample :drum_cymbal_soft if spread(9,16).look
  sleep 0.125
end

live_loop :Leon, sync: :Roy do
  use_synth :prophet
  with_fx :distortion, mix: 0.9 do
    sample :bass_hard_c, release: 1.5, amp: 0.6
  end
  with_fx :slicer, mix: 0.9, phase_slide: 2 do |f|
    p = play 60, release: 15, cutoff: 130, cutoff_slide: 2
    control f, phase: 0.06
    control cutoff: 60
    sleep 2
    control f, phase: 0.25
    control cutoff: 130
    sleep 6
  end
end

riff = [72,:r,:r,72,72,:r,:r,72,72,72,:r,72,:r,:r,76,73].ring
live_loop :Zhora, sync: :Roy do
  #use_transpose 0
  use_synth :chiplead
  with_fx :distortion, mix: 0.9, distort: 0.8 do
    with_fx :bitcrusher, mix: 0.4 do
      with_fx :ixi_techno, phase: 2.33, phase_offset: rrand(0,1) do
        riff.length.times do
          tick
          play riff.look-12, release: 0.15, amp: 0.2
          sleep 0.125
        end
      end
    end
  end
end
