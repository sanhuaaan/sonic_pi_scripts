f="D:/Sonic Pi samples/Dirt-Samples-master/"

live_loop :roy do
  use_random_seed 500
  with_fx :slicer, phase: 0.125 do
    sample :bass_drop_c, rate: -1
  end
  with_fx :ixi_techno do
    32.times do |i|
      sample f+'dr', rand_i(41) unless one_in(4)
      sleep 0.125
      #gaff if i==13
    end
  end
end

define :gaff do
  in_thread do
    use_random_seed Random.new.rand(2000)
    with_fx :bitcrusher do
      8.times do
        synth :saw, note: (scale :c3, :aeolian).choose, release: 0.7
        sleep 0.125
      end
    end
  end
end

live_loop :pris, sync: :roy do
  tick
  density [1,1,0.5].choose do
    sample :drum_tom_lo_hard, amp: 0.5 if spread(10,16).look
    sleep 0.125
  end
end

live_loop :zhora, sync: :roy do
  density [1,1,1,1,8].choose do
    sample :bd_zum
    sleep 1
  end
end

live_loop :leon, sync: :roy do
  stop
  with_fx :distortion, mix: 0.9, distort: 0.9 do
    with_fx :krush, cutoff: rrand(60,130) do
      synth :chiplead, note: (chord :c3, :madd11, num_octaves:2).choose, release: 0.3, amp: 0.02
      sleep 0.125
    end
  end
end

live_loop :rick, sync: :roy do
  sample :ambi_lunar_land, beat_stretch: 4
  sleep 4
end
