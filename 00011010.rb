bpm = 60

live_loop :Gaff do
  #stop
  use_bpm bpm
  tr = sync :tyrell
  use_transpose tr[:transpose]
  use_random_seed 18
  use_synth :fm
  with_fx :bitcrusher, mix: 0.8 do
    32.times do
      play 60, release: 0.2 if dice(6)<5
      sleep 0.125
    end
  end
end

live_loop :Roy, sync: :Gaff do
  stop
  use_bpm bpm
  with_fx :whammy, mix: 0.7 do
    sample :tabla_te_ne, amp: 0.7 if spread(9,16).tick
  end
  sleep 0.125
end

live_loop :Pris, sync: :Gaff do
  stop
  use_bpm bpm
  with_fx :slicer, phase: 0.125 do |i|
    sample :bass_thick_c, amp: 2, beat_stretch: 4
  end
  sleep 4
end

riffZhora=[60,63,60,57].ring
live_loop :Zhora, sync: :Gaff do
  stop
  use_bpm bpm
  use_synth :zawa
  use_random_seed 7
  tr = sync :tyrell
  use_transpose tr[:transpose]
  32.times do
    with_fx :mono, mix: 0.8 do
      play riffZhora.tick - 12, release: 0.3, amp: 1.5, cutoff: 80 unless one_in(0)
    end
    sleep 0.125
  end
end

rpitchLeon=[0,0,3,2].ring
live_loop :Leon, sync: :Gaff do
  #stop
  use_bpm bpm
  cue :tyrell, transpose: rpitchLeon.tick
  with_fx :distortion, mix: 0.8 do
    sample :bass_trance_c, amp: 6, rpitch: rpitchLeon.look, release: 5
  end
  sleep 4
end

live_loop :Rachel, sync: :Gaff do
  stop
  use_bpm bpm
  with_fx :bitcrusher, mix: 0.8 do
    with_fx :gverb, mix: 0.9 do
      sample :ambi_lunar_land
    end
  end
  sleep 8
end

live_loop :Rick, sync: :Gaff do
  stop
  use_bpm bpm
  with_fx :reverb, mix: 0.5, room: 1 do
    sample :bd_haus, amp: 4
  end
  sleep 0.5
end
