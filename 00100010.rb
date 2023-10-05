f="D:/Sonic Pi samples"
s=f + "/BassA_80D-03.wav"

use_bpm 60

live_loop :sf do
  #stop
  lololo
  ch=[:d3,:c3,:cs3,:e3].choose
  puts ch
  #use_random_seed 253
  with_fx :flanger, mix: 0.8 do
    use_transpose 0
    32.times do
      n=(chord ch, :minor, num_octaves: 4).choose
      synth :prophet, note: n, cutoff: rrand(70,120), release: 0.2 unless one_in(3)
      with_fx :slicer, phase: 0.125, probability: 1 do
        synth :chiplead, note: n-12, cutoff: rrand(70,90), release: 0.5 unless one_in(2)
      end
      sleep 0.125
    end
  end
end

live_loop :lkj, sync: :sf do
  stop
  use_random_seed 900
  with_fx :distortion, mix: 1, distort: 0.9 do
    32.times do
      sample s, onset: pick, rate: 1 unless one_in(3)
      sleep 0.125
    end
  end
end

live_loop :qwe, sync: :sf do
  #stop
  with_fx :echo, phase: 0.125 do
    sample :bd_zum
  end
  sleep 0.5
  sample :elec_fuzz_tom
  sleep 0.5
end

define :lololo do
  in_thread do
    synth :mod_fm, note: (scale :c, :bartok).choose, release: 4, cutoff: 70, cutoff_slide: 4, mod_phase_slide: 1
    control cutoff: 120, mod_phase: 0.125
  end
end
