defonce :k do
  {
    1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0, 10 => 0, 11 => 0, 12 => 0, 13 => 0, 14 => 0, 15 => 0, 16 => 0
  }
end
#[1,2,3,4,5][(k[16]*4).round]
live_loop :knob_control do
  use_real_time
  n, val = sync "/midi/launch_control/0/14/control_change"
  knob_map = (n<29) ? 20 : 32
  k[n - knob_map] = (val/128.0).round(2)
end

defonce :loops do
  set :ll_1, 1
  set :ll_2, 0
  set :ll_3, 0
  set :ll_4, 0
  set :pl_1, 1
  set :pl_2, 0
  set :pl_3, 0
  set :pl_4, 0
end

defonce :ini_light do
  i=0
  [:ll_1,:ll_2,:ll_3,:ll_4,:pl_1,:pl_2,:pl_3,:pl_4].each do |ll|
    midi_note_on [9,10,11,12,25,26,27,28][i], 3+(123*get[ll]), port: "launch_control" #if get[ll] == 0
    i=i+1
  end
end

live_loop :loop_control do
  use_real_time
  pad_num, velocity = sync "/midi/launch_control/0/14/note_on"
  case pad_num
  when 9
    n = get[:ll_1]
    set :ll_1, n == 1 ? 0 : 1
    midi_note_on 9, 3+(107*get[:ll_1]), port: "launch_control"
  when 10
    n = get[:ll_2]
    set :ll_2, n == 1 ? 0 : 1
    midi_note_on 10, 3+(107*get[:ll_2]), port: "launch_control"
  when 11
    n = get[:ll_3]
    set :ll_3, n == 1 ? 0 : 1
    midi_note_on 11, 3+(107*get[:ll_3]), port: "launch_control"
  when 12
    n = get[:ll_4]
    set :ll_4, n == 1 ? 0 : 1
    midi_note_on 12, 3+(107*get[:ll_4]), port: "launch_control"
  when 25
    n = get[:pl_1]
    set :pl_1, n == 1 ? 0 : 1
    midi_note_on 25, 3+(107*get[:pl_1]), port: "launch_control"
  when 26
    n = get[:pl_2]
    set :pl_2, n == 1 ? 0 : 1
    midi_note_on 26, 3+(107*get[:pl_2]), port: "launch_control"
  when 27
    n = get[:pl_3]
    set :pl_3, n == 1 ? 0 : 1
    midi_note_on 27, 3+(107*get[:pl_3]), port: "launch_control"
  when 28
    n = get[:pl_4]
    set :pl_4, n == 1 ? 0 : 1
    midi_note_on 28, 3+(107*get[:pl_4]), port: "launch_control"
  end
end

# 808 # 808bd # 808cy # 808hc # 808ht # 808lc # 808lt # 808mc # 808mt # 808oh # 808sd
# 909
# ab # ades2 # ades3 # ades4 # amencutup # arpy # auto
# bass # bass0 # bass1 # bass2 # bass3 # bassdm # bassfoo # bd # bend # bin # bleep # blip
# bottle
# can # casio # cb # cc # chin # clak # click # clubkick # co # cp # cr
# d # db # dr # dr_few # dr2 # dr55 # drum # drumtraks
# e # east # electro1
# future
# gab # gabba # gabbaloud # gabbalouder # glasstap # glitch # glitch2 # gretsch
# hand # hardcore # hardkick # haw # hc # hh # hh27 # hit # ho # hoover # house # ht
# insect # invaders
# jazz # jungbass # jungle # jvbass
# kicklinn
# lighter # linnhats # lt
# made # mash # mash2 # metal # miniyeah # moan # monsterb # mouth # msg # mt
# newnotes # noise # noise2 # notes
# oc # odx # off
# perc # peri # pluck # popkick # print # procshort
# realclaps # reverbkick # rm # rs
# sd # sequential # sf # short # sid # sn # space # speakspell # stab # stomp # sundance
# tabla # tabla2 # tech # techno # tink # tok
# ul # ulgab # uxay
# v # voodoo
# wind # world
# yeah
# po12bd # po12bt # po12blip # po12chh # po12clap # po12click # po12cow # po12cy # po12ht
# po12lt # po12noise # po12sn # po12ss # po12st # po12tone

load'D:\Sonic Pi samples\petal-master\petal.rb'
use_fx_with_petal false
bpm(60)

with_fx :reverb do
  d1 'tabla(3,8)'
  d2 'yeah'
  d3 'wind'
  d4 'ul'
end

##| hush

##############################################

chords_r1=[:D,:A,:B,:G].ring
chords_r2=[:Fs,:D,:A,:E].ring
chords_r3=[:A,:F,:C,:G].ring

s_slice='D:\Sonic Pi samples\slices' # 18
s_onset='D:\Sonic Pi samples\onsets' # 16

##############################################

bpm = 60

live_loop :ringo do
  if get[:pl_1] == 0 then d1 :silence else midi_note_on 25, 124, port: "launch_control" end
  if get[:pl_2] == 0 then d2 :silence else midi_note_on 26, 124, port: "launch_control" end
  if get[:pl_3] == 0 then d3 :silence else midi_note_on 27, 124, port: "launch_control" end
  if get[:pl_4] == 0 then d4 :silence else midi_note_on 28, 124, port: "launch_control" end
  sync :d0
  cue :bpm
end

live_loop :blinky, sync: :ringo do
  if get[:ll_1] == 0 then stop else midi_note_on 9, 124, port: "launch_control" end
  sync :bpm if current_bpm != bpm
  use_bpm bpm
  16.times do
    play 60
    sleep 0.125
  end
end

live_loop :pinky, sync: :ringo do
  if get[:ll_2] == 0 then stop else midi_note_on 10, 124, port: "launch_control" end
  sync :bpm if current_bpm != bpm
  use_bpm bpm
  16.times do
    
    sleep 0.125
  end
end

live_loop :inky, sync: :ringo do
  if get[:ll_3] == 0 then stop else midi_note_on 11, 124, port: "launch_control" end
  sync :bpm if current_bpm != bpm
  use_bpm bpm
  16.times do
    
    sleep 0.25
  end
end

live_loop :clyde, sync: :ringo do
  if get[:ll_4] == 0 then stop else midi_note_on 12, 124, port: "launch_control" end
  sync :bpm if current_bpm != bpm
  use_bpm bpm
  16.times do
    
    sleep 0.25
  end
end
