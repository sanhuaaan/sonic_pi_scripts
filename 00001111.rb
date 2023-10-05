transpV = [0,0,0,0,3,5].ring
transp = 0

live_loop :brrrrr do
  with_fx :reverb, room: 0.9, mix: 0.8 do
    sample :ambi_dark_woosh, amp: 1
    sleep sample_duration :ambi_dark_woosh
  end
  use_transpose transpV[transp]
  transp +=1
  use_synth :tech_saws
  with_fx :flanger, phase: 0.15, depth: 9 do
    play (chord :C, :minor7), release: 6
  end
end

live_loop :brl do
  with_fx :slicer, phase: 0.125 do
    sample :ambi_glass_rub, rate: rrand(-1,-0.5), amp: 0.4
  end
  sleep sample_duration :ambi_glass_rub
end

live_loop :tsk do
  with_fx :vowel, mix: 0.7 do
    sample :drum_cymbal_closed, amp: 0.4, rate: 0.3, attack: 0.1, release: 0.5
  end
  sleep (sample_duration :ambi_dark_woosh) / 4
end

live_loop :tin do
  use_transpose transpV[transp]
  use_synth :dark_ambience
  play (chord :c, :minor7).choose, amp: 5
  sleep (sample_duration :ambi_dark_woosh) / 16
end
