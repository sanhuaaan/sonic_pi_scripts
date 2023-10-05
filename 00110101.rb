live_loop :asd do
  tick
  density 1 do
    if (x=(ring *%w{ 1 1 ~ 1
                     ~ ~ ~ 0
                     0 ~ 0 ~
                     7 0 ~ ~
                     }).look) != '~'
      synth :chipbass, note: 40+x.to_i, release: 0.3, amp: 1
      synth :tech_saws, note: 52+x.to_i, release: 0.5, amp: 0.8
    end
    sleep 0.125
  end
end

live_loop :lkj, sync: :asd do
  with_fx :rhpf, cutoff: 120 do
    synth :pnoise, note: 40, release: 0.125 if spread(5,8).tick
  end
  sleep 0.125
end

live_loop :qwe, sync: :asd do
  n=(octs :c, 3)
  sample :guit_e_slide, rate: rrand(0.7,1.4)
  with_fx :rbpf do
    use_synth_defaults release: 0.2, amp: 1.2
    12.times do
      synth :fm, note: n.tick
      sleep 0.125
    end
    2.times do
      play_pattern_timed([n[0],n[1]],0.125)
    end
  end
end

live_loop :assf, sync: :qwe do
  density [1,4].ring.tick do
    sample :bd_haus
    sleep 0.5
  end
  sample :elec_twip, hpf: 80
end

live_loop :qwere, sync: :assf do
  with_fx :reverb, mix: 0.7 do
    with_fx :bitcrusher, mix: 0.7 do
      sample :drum_cymbal_closed if spread(5,16).tick
      sleep 0.25
    end
  end
end

live_loop :njk, sync: :assf do
  use_random_seed Random.new.rand(5000)
  sleep [4, 8, 2].choose
  if(rand>0.5)
    with_fx :ixi_techno, phase: [0.125,0.25,0.5].choose, mix: 0.4, phase_offset: rand do
      with_fx :wobble, phase_offset: rand do
        use_synth :chiplead
        play (chord :c3, '+5', num_octaves: 2), amp: 1.5, release: 2#, attack: 0.5
      end
    end
  else
    [5,7,9].choose.times do
      sample 'D:/Sonic Pi samples/hits/K01Hit-Kick02.wav'
      sleep 0.125
    end
  end
end
