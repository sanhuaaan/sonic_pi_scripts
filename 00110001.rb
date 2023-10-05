#use_debug false
live_loop :Pris do
  use_synth :beep
  use_random_seed [1,50,800,152].ring.tick
  2.times do
    puts "seed #{current_random_seed}"
    s=0
    8.times do
      unless one_in(5)
        play (chord :c, :dim7, num_octaves: 4).choose, release: 0.1, cutoff: 80, amp: 0.7
        s+=1
      end
      puts s
      sleep 0.125
    end
    reseed(8+s)
  end
end

define :reseed do |i|
  use_random_seed current_random_seed - i
end

live_loop :Roy, sync: :Pris do
  sample :tabla_ghe3 if factor?(tick, [2,4,8,5,12,1].ring.look)
  sleep 0.125
end
