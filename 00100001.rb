f="D:/Sonic Pi samples"
s=f + "/CHIPSHOP_Loop120_008.wav"
s2=f + "/BassA_80D-03.wav"

live_loop :Roy do
  use_random_seed 666
  use_bpm 60
  24.times do
    sample s, lpf: 120, onset: lambda{|x| puts x.size ; x.choose} if dice(6)<5
    sleep 0.125
  end
end

live_loop :Pris, sync: :Roy do
  #with_fx :bitcrusher, bits: rrand(4,8) do
  sample :bd_haus, lpf: 70, amp: 2.7, rate: 1 if spread(9,12).tick
  #end
  sleep 0.125
end


zhoraPitch=[-2,-2,-3,-3].ring

live_loop :Zhora, sync: :Roy do
  use_bpm 30
  #stop
  use_random_seed 50
  use_synth :pretty_bell
  with_fx :reverb, room: 1 do
    with_fx :distortion, mix: 0.8 do
      zhoraPitch.tick
      24.times do
        n=(chord :d, :M7, num_octaves: 2).choose
        synth :pretty_bell, note: n, release: 0.1, amp: 0.2, release: 0.5, pitch: zhoraPitch.look
        #synth :blade, note: n-24, release: 1, amp: 0.2 if one_in(3)
        sleep 0.125
      end
    end
  end
end

live_loop :Leon, sync: :Roy do
  with_fx :ixi_techno do
    with_fx :slicer, phase: 0.25 do
      synth :subpulse, note: 60, release: 4, amp: 1.7
    end
  end
  sleep 4
end

live_loop :Rick, sync: :Roy do
  stop
  with_fx :flanger, feedback: 1 do
    sample :bd_zum
  end
  sleep 1
end
