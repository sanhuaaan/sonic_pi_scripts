f="D:/Sonic Pi samples"
s=f + "/CHIPSHOP_Loop120_008.wav"
s2=f + "/BassA_80D-03.wav"

live_loop :Roy do
  use_random_seed 48
  24.times do
    sample s, lpf: 80, onset: lambda{|x| puts x.size ; x.choose} if dice(6)<5
    sleep 0.125
  end
end

live_loop :Pris, sync: :Roy do
  sample :tabla_tun1, lpf: 60, amp: 0.7 if spread(5,12).tick
  sleep 0.125
end

live_loop :Zhora, sync: :Roy do
  use_random_seed 50
  use_synth :chipbass
  12.times do
    play (chord :c2, :minor, num_octaves: 1).choose, release: 0.2
    sleep 0.125
  end
end