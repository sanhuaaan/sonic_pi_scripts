live_loop :coppery_shine do
  n=(octs :c, 3)
  r=(line 0.07,0.7,steps: 30).mirror
  synth :dtri, note: n.tick(:nt), release: r.look(:nt), amp: 0.5 if spread(6,9).tick(:sprd)
  with_fx :echo, mix: 0.2 do
    sample :elec_plip if spread(7,9).look(:sprd)
  end
  sample :elec_triangle, rate: rrand(0.7,1.4), amp: 0.4 if one_in(3)
  sample :elec_ping, rate: rrand(0.5,1.6), amp: 0.6 if one_in(4)
  with_fx :vowel, vowel_sound: 2, voice: 4 do
    with_fx :echo do
      with_fx (rand<0.5 ? :gverb : :slicer), damp: 1, phase: 0.125, mix: 0.8 do
        sample :elec_cymbal, rate: 0.7, amp: 0.6 if factor?(look(:sprd),18)
      end
    end
  end
  sleep 0.125
end
