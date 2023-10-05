live_loop :Roy do
  stop
  with_fx :reverb, room: 1 do
    with_fx :echo, mix: 0.2 do
      if spread(8,15).tick
        sample :drum_bass_soft, pan: -1
      else
        sample :drum_bass_hard, pan: 1
      end
    end
  end
  sleep 0.2
end

live_loop :Pris, sync: :Roy do
  d=[1,1,2,4].ring
  tick(:d) if factor? tick(:play), 2
  use_synth :chipbass
  with_fx :bitcrusher do
    range(-2,2,inclusive: false).each do |i|
      play (chord_degree d.look(:d), :c4, :major, 4, invert: i).look(:play), amp: 0.4
      sleep 0.2
    end
  end
end

live_loop :Leon, sync: :Roy do
  use_synth :pretty_bell
  use_random_seed 500
  with_fx :octaver do
    16.times do
      play (chord :c4, '+5', num_octaves: 2).choose, release: 1, amp: 0.7
      sleep 0.8
    end
  end
end

live_loop :Zhora, sync: :Roy do
  density [1,1,1,4].choose do
    sample :drum_cymbal_soft if spread(6,8).tick
    sleep 0.8
  end
end
