f="D:/Sonic Pi samples"
live_loop :Roy do
  use_random_seed 200
  with_fx :slicer, phase: 0.2 do
    sample :elec_cymbal, release: 4, beat_stretch: 3
  end
  40.times do
    with_fx :lpf, cutoff: 110 do
      sample f, 3, onset: pick, amp: 0.5, release: 0.2 unless one_in(2)
      sleep 0.1
    end
    sample f, 0, onset: pick, amp: 0.5, release: 0.2 if spread(6,10).tick
  end
end

live_loop :Pris, sync: :Roy do
  use_random_seed 2500
  use_transpose [1,3,5,2].ring.tick
  with_fx :lpf, cutoff: 95 do
    40.times do
      synth :chiplead, note: (chord :c, '+5', num_octaves: 2).choose, amp: 0.8, release: 0.1 if dice(5) < 4
      sleep 0.1
    end
  end
end

live_loop :Leon, sync: :Pris do
  with_fx :lpf, cutoff: (line 80, 130, steps: 10, inclusive: true).reflect.tick(:ctff) do
    [1,3,2,4].each do |i|
      3.times do
        synth :chipbass, release: 0.2, attack: 0.1, note: (chord_degree i, :c2, :major, 3).tick(:note), amp: 1
        sleep 0.2
      end
    end
  end
end

live_loop :Zhora, sync: :Pris do
  density 2 do
    sample :tabla_te1 if spread(5,8).tick
    sample :tabla_te_ne if spread(10,15).look
    sleep 0.2
  end
end