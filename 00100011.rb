f="D:/Sonic Pi samples"

use_bpm 60

live_loop :Roy do
  stop
  use_random_seed 352
  16.times do
    with_fx :lpf, cutoff: 95 do
      sample f, 1, onset: pick, amp: 0.8, release: 0.2
    end
    sleep 0.125
  end
end


live_loop :Pris, sync: :Roy do
  stop
  ch=[:d3,:c3,:cs2,:e3].ring.tick
  puts ch
  use_random_seed 2502
  with_fx :flanger, mix: 0 do
    with_fx :bitcrusher, mix: 0 do
      use_transpose 0
      32.times do
        n=(chord :c, :i7, num_octaves: 3).choose
        unless one_in(6)
          with_fx :lpf, cutoff: 80 do
            synth :tech_saws, note: n-24, cutoff: rrand(70,120), amp: 2, release: 0.2
          end
          with_fx :hpf, cutoff: 100 do
            synth :chipbass, note: n-36, amp: 1.5, cutoff: rrand(70,90), release: 0.5
          end
        end
        sleep 0.125
      end
    end
  end
end


live_loop :Zhora, sync: :Pris do
  stop
  with_fx :echo, phase: 0.125 do
    sample :bd_zum, amp: 2
  end
  sleep 0.5
  with_fx :reverb, room: 1 do
    sample :elec_fuzz_tom, amp: 2
  end
  sleep 0.5
end

live_loop :Leon do
  stop
  #use_random_seed 0
  i=rand_i 1000
  puts i
  #with_fx :whammy do
  sample f+"/frases/", i, amp: 5
  #end
  sleep sample_duration f+"/frases/", i
  sleep [4,6,8].choose
end

live_loop :Rick do
  stop
  use_random_seed Random.rand(5000)
  puts current_random_seed
  sync :Roy
  case["Honda","Ryu","Blanka","Zangief","Chun-Li"].choose
  when "Honda"
    with_fx :whammy, mix: 0.5, reps: [2,4,8].choose do
      synth :tb303, note: (chord :c, :minor).ring.tick, release: 0.1, amp: 1, cutoff: 90
      sleep 0.125
    end
  when "Ryu"
    with_fx :bitcrusher, mix: 0.9 do
      with_fx :octaver, reps: [2,4,8,12].choose  do
        synth :tri, note: (chord :d, :major, num_octs: 3).choose, release: 0.2, amp: 1, cutoff: 90 unless one_in(3)
        sleep 0.125
      end
    end
  when "Blanka"
    with_fx :flanger, feedback: 0.7 do
      with_fx :distortion, mix: 1 do
        with_fx :ixi_techno, phase_offset: rand do
          synth :mod_saw, sustain: 2, mod_phase: 0.25
        end
      end
    end
    sleep 1
    control mod_phase: 0.125
    sleep 1
    control amp: 0
  when "Zangief"
    k=[5,6,7,8,9,10].choose
    with_fx :krush, mix: 0.6, cutoff: 90 do
      16.times do
        if spread(k,16).tick
          sample :tabla_tun1, amp: 3
        else
          sample :tabla_ghe2
        end
        sleep 0.125
      end
    end
  when "Chun-Li"
    use_synth :sine
    with_fx :panslicer do
      12.times do
        play (octs :d3, 3).tick , release: 0.2, amp: 4
        sleep 0.25
      end
    end
  end
  sleep [0,2,4].choose
end



