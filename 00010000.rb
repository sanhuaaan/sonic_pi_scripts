transpV = [0,0,0,0,3,5].ring
transp = 0

live_loop :brrrrr do
  ##| with_fx :reverb, room: 0.9, mix: 0.8 do
  ##| sample :ambi_dark_woosh, amp: 1
  
  ##| end
  transp +=1
  use_transpose transpV[transp]
  use_synth :beep
  ##| with_fx :flanger, phase: 0.15, depth: 9 do
  play (chord :C, :minor7), release: 6
  ##| end
  sleep (sample_duration :ambi_dark_woosh) / 4 * 3
  4.times do
    use_synth :blade
    play chord(:C, :major).tick , release: 3
    sleep (sample_duration :ambi_dark_woosh) / 16
  end
  sleep (sample_duration :ambi_dark_woosh)
end

live_loop :brl do
  ##|   sample :ambi_glass_rub, rate: 0.4, amp: 0.7
  sleep (sample_duration :ambi_dark_woosh)
end

live_loop :tsk do
  #sync :brrrrr
  sample :drum_cymbal_closed, amp: 0.4, rate: 1
  sleep (sample_duration :ambi_dark_woosh) / 4
end

live_loop :tin do
  #sync :brrrrr
  use_transpose transpV[transp]
  use_synth :dark_ambience
  play (chord :c, :minor7).choose, amp: 5
  sleep (sample_duration :ambi_dark_woosh) / 16
end
