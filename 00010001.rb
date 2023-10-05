#HAPPY 2017

bpm = 120

transpRing = [0,0,3,1,0].ring
transpInd = 0

live_loop :txan do
  use_bpm bpm
  use_transpose transpRing[transpInd]
  4.times do |i|
    use_synth :saw
    play chord(:c3, :major, num_octaves: 3), release: 0.5
    if transpRing[transpInd]==0 and i==3
      sleep 0.375
      play chord(:d2, :major, num_octaves: 3), release: 0.5
      sleep 0.375
    else
      sleep 0.75
    end
  end
  transpInd+=1
end

live_loop :bum do
  use_bpm bpm
  #sync :txan
  2.times do
    sample :drum_heavy_kick
    sleep 0.75/2
  end
  sample :drum_tom_hi_hard
  sleep 0.75/2
  sample :drum_heavy_kick
  sleep 0.75/2
end

live_loop :woaoao do
  #sync :txan
  use_synth :square
  use_transpose transpRing[transpInd]
  with_fx :echo, mix: 0.8 do    
    play chord(:c3, :major, num_octaves: 3).choose, release: 0.4
    sleep 0.75/2
  end
end
