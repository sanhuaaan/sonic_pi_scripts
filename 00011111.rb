samps = "D:/Sonic Pi/1740-CHIPSHOP_by_midierror/CHIPSHOP_LOOPS/120_BPM"

live_loop :Roy do
  with_fx :slicer, phase: 0.125 do
    sample samps, "CHIPSHOP_Loop120", 6, beat_stretch: 6
    sleep 6
  end
end

n = (scale :c1, :major_pentatonic)
live_loop :Pris, sync: :Roy do
  use_synth :chipbass
  use_random_seed 15
  with_fx :hpf, mix: 0.7 do
    6.times do |i|
      play n.choose, release: 0.2, amp: 0.7
      sample "D:/Sonic Pi/1740-CHIPSHOP_by_midierror/CHIPSHOP_HITS/GAMEBOY/GB_PERC/GB_Chop002.wav" if i==4
      sleep 0.25
    end
  end
end

chordZhora=(chord :c, :minor, num_octaves: 2)
live_loop :Zhora, sync: :Roy do
  use_synth :chiplead
  use_random_seed 25
  with_fx :bitcrusher, mix: 0.4 do
    with_fx :distortion, mix: 0.8 do
      with_fx :ixi_techno do
        24.times do
          play chordZhora.choose, release: rrand(0.2,0.5), amp: 0.1 unless one_in(3)
          sleep 0.125
        end
      end
    end
  end
end



