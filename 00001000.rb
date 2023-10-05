use_transpose 5
use_random_seed 12
notes=[]
times=[]
t=0.1
i=0

24.times do
  notes << ((chord :c2, :minor).choose)
  times << ([0.25,0.125].choose)
  t+=times[i]
  i+=1
end

##| notes=[(chord :c2, :minor).choose,
##|        (chord :c2, :minor).choose,
##|        (chord :c2, :minor).choose,
##|        (chord :c2, :minor).choose]


#times=[[0.5,0.25,0.125].choose,[0.5,0.25,0.125].choose,[0.5,0.25,0.125].choose]

live_loop :autoRiff do
  #use_transpose 6
  use_synth :pluck
  play_pattern_timed notes, times, release: 0.2
end

live_loop :cow do
  #sync :autoRiff
  sample :drum_cowbell, rate: 0.5, amp: 0.2
  sleep 0.25
  2.times do
    sample :drum_cymbal_closed, amp: 0.5
    sleep 0.125
  end
end

live_loop :bass do
  use_synth :chipbass
  play (chord :C2, :major).choose, release: 0.125, cutoff: rrand(60, 110), amp: 0.7
  sleep 0.125
end

