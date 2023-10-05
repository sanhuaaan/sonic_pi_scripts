with_fx :reverb, room: 1 do
  live_loop :dougie_coop do
    use_bpm 80
    n=[3,5,7,9,11].choose
    with_fx :bitcrusher do |b|
      20.times do
        control b, mix: [0,1].choose, bits: 4
        sample :elec_beep, rate: 4 if spread(n,20).tick
        sample :elec_chime, rate: 4 if spread(6,20).look
        sample :elec_plip, rate: [2,3,4].choose if spread(9,20).look
        sample :elec_tick, rate: [2,3,4,1].choose
        sleep 0.125
      end
    end
    with_fx :ixi_techno, phase_offset: rand do
      [0,10,20].choose.times do
        sample "C:/Users/jsanjuan/Desktop/Beat22.wav", onset: pick unless one_in(4)
        sample "C:/Users/jsanjuan/Desktop/BonusBeat31(130BPM).wav", onset: pick unless one_in(3)
        sleep 0.125
      end
    end
  end
  
  live_loop :bad_coop, syn: :dougie_coop do
    use_bpm 80
    ##| use_random_seed 88
    5.times do
      synth :tb303, cutoff_attack: 0.05, cutoff: rrand(60,120),
        note: (chord :d2,:minor).choose,
        release: 0.1, amp: 0.2 unless one_in(6)
      sleep 0.125
    end
  end
  
  live_loop :dale_cooper, syn: :dougie_coop do
    use_bpm 80
    ##| use_random_seed 66
    with_fx :lpf, cutoff: 65 do
      with_fx :octaver do
        4.times do
          synth :tech_saws,
            note: (chord :d4, :major, num_octaves: 2).choose,
            release: 8, attack: 1
          sleep 5
        end
      end
    end
  end
  
  
  
  
end

