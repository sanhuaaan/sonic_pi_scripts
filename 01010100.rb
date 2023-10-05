live_loop :fdfdf do
  stop
  use_bpm 60
  sample 'D:\Sonic Pi samples\CHIPSHOP_Loop175_002.wav',
    num_slices: 8,
    beat_stretch: 4,
    slice: pick unless one_in(4)
  sleep 0.25
end

live_loop :wefr do
  use_random_seed [220,Random.new.rand(1000)].ring.tick
  with_fx :reverb do
    16.times do
      sample 'D:\Sonic Pi samples\BassB_120A-03.wav',
        onset: pick,
        rpitch: [0,3,6,1.5,4.5].choose,
        amp: 3 unless one_in(4)
      sleep 0.125
    end
  end
end


live_loop :dfdf do
  ##| stop
  tick(:b) if spread(6,8).tick(:main)
  sample :drum_cymbal_closed, rate: [2,5].ring.look(:b) + [1,0].choose unless one_in(5)
  sleep 0.125
end

live_loop :fdfd do
  sample :bd_tek
  sleep 0.5
end

live_loop :jjh do
  stop
  puts chord_names.length
  k=chord_names[rand_i(63)]
  4.times do
    3.times do |i|
      puts (chord :c, k).length
      play (chord :c, k)[i], release: [0.2,0.2,0.2,0.5,0.5,1].choose
      sleep 0.125
    end
  end
end


######################################################33333
######################################################33333
######################################################33333

live_loop :sdf do
  use_bpm 75
  with_fx :whammy, grainsize: 10, mix: 0 do
    16.times do
      with_fx :bitcrusher, bits: [4,8,12].choose do
        sample :loop_amen, num_slices: 8, slice: pick, beat_stretch: 2
        sleep 0.25
      end
    end
  end
end

live_loop :dfdf, sync: :sdf do
  use_bpm 75
  ##| stop
  ##| use_random_seed 709
  with_fx :wobble, phase: rand,mix: [1,0].choose do
    with_fx :flanger, feedback: rrand(0,1), mix: [1,1,0].choose do |a|
      16.times do
        control a, feedback: rrand(0,1.5)
        synth :blade, note: (chord :c4, '+5', num_octaves: 2).choose, release: 0.2 unless one_in(3)
        sleep 0.125
      end
    end
  end
end

live_loop :dfdddf, sync: :sdf do
  use_bpm 75
  ##| stop
  n=[2,4,6].choose
  with_fx :distortion, distort: 0.5 do |d|
    8.times do
      density [1,1,0.5].choose do
        control d, distort: rrand(0,0.9)
        sample :drum_snare_soft, rpitch: [0,3,6,12].choose unless spread(n,8).tick
        sleep 0.125
      end
    end
  end
end

######################################################33333
######################################################33333
######################################################33333

live_loop :dfdf do
  use_random_seed 60
  16.times do
    sample "C:/Users/jsanjuan/Desktop/rrrr.wav", onset: [tick,2].choose
    sleep 0.125
  end
end

######################################################33333
######################################################33333
######################################################33333

live_loop :kjkj do
  ##| stop
  n=[1,1,0,1,0,0,1].ring.tick
  sample :elec_blip, on: n
  time_warp -0.125 do
    sample :elec_blip2, on: n != 1
  end
  sleep 0.25
end