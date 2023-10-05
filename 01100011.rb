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
  {
    '9' => 1, '10' => 0, '11' => 0, '12' => 0,
    '25' => 1, '26' => 0, '27' => 0, '28' => 0
  }
end

defonce :ini_light do
  [9,10,11,12,25,26,27,28].each do |i|
    midi_note_on i, 3+(123*loops[i.to_s]), port: "launch_control" if loops[i.to_s] == 0
  end
end

live_loop :loop_control do
  use_real_time
  pad_num, velocity = sync "/midi/launch_control/0/14/note_on"
  loops[pad_num.to_s] = loops[pad_num.to_s] == 1 ? 0 : 1
  midi_note_on pad_num, 3+(107*loops[pad_num.to_s]), port: "launch_control"
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
bpm(70)

with_fx :reverb do
  d1 'short(7,8)', n:'irand 0 7'
  d2 'jazz(9,16)', n: 'irand 0 3'
  d3 'hh*16', amp: 'irand 0 2'
  d4 ''
end

if loops['25'] == 0 then d1 :silence else midi_note_on 25, 124, port: "launch_control" end
if loops['26'] == 0 then d2 :silence else midi_note_on 26, 124, port: "launch_control" end
if loops['27'] == 0 then d3 :silence else midi_note_on 27, 124, port: "launch_control" end
if loops['28'] == 0 then d4 :silence else midi_note_on 28, 124, port: "launch_control" end
##| hush

##############################################
#Volca Beats
agogo='D:\Sonic Pi samples\MPCVB\agogo'
bd='D:\Sonic Pi samples\MPCVB\bd'
clap='D:\Sonic Pi samples\MPCVB\clap'
clave='D:\Sonic Pi samples\MPCVB\clave'
hh='D:\Sonic Pi samples\MPCVB\hh'
sd='D:\Sonic Pi samples\MPCVB\sd'
tom_fat='D:\Sonic Pi samples\MPCVB\tom_fat'
tom_fatsat='D:\Sonic Pi samples\MPCVB\tom_fatsat'
#Elektron Analog Rytm
rytm_bd='D:\Sonic Pi samples\ElektronAnalogRytm-samples\bd'
rytm_cy='D:\Sonic Pi samples\ElektronAnalogRytm-samples\cy'
rytm_misc='D:\Sonic Pi samples\ElektronAnalogRytm-samples\misc'
rytm_sd='D:\Sonic Pi samples\ElektronAnalogRytm-samples\sd'
rytm_xtcl='D:\Sonic Pi samples\ElektronAnalogRytm-samples\xtcl'

s_slice='D:\Sonic Pi samples\slices'
s_onset='D:\Sonic Pi samples\onsets'

##############################################

bpm = 70

live_loop :ringo do
  sync :d0
  cue :bpm
end

live_loop :picoloop, sync: :ringo do
  sync :bpm if current_bpm != bpm
  use_bpm bpm
  4.times do
    time_warp -0.175 do
      midi_clock_beat
    end
    sleep 0.5
  end
end

with_fx :reverb do
  live_loop :blinky, sync: :ringo do
    loop_n=9
    if loops[loop_n.to_s] == 0 then midi_note_on loop_n, 3, port: "launch_control"; stop else midi_note_on loop_n, 124, port: "launch_control" end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    ##| use_random_seed 665
    with_fx :bitcrusher do |b|
      with_fx :krush do |o|
        8.times do
          control b, mix: k[4]
          control o, mix: k[2], res: k[3]
          density [1,1,0.5].choose do
            synth :chiplead, env_curve: 6, width: 2,
              note: (octs (stretch :e2,16,:e4,16).tick(:a), 4).reverse.tick(:b),
              release: k[1],
              amp: k[5], note_resolution: k[9]*2
            sleep 0.125
          end
        end
      end
    end
  end
  
  live_loop :pinky, sync: :ringo do
    loop_n=10
    if loops[loop_n.to_s] == 0 then midi_note_on loop_n, 3, port: "launch_control"; stop else midi_note_on loop_n, 124, port: "launch_control" end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    ##| use_random_seed 22
    ##| with_fx :echo do |e|
    density [2].choose do
      ##| control e, mix: [0,1].choose
      sample :loop_breakbeat, slice: pick, num_slices: 8, beat_stretch: 4, rpitch: [0,3,6].choose, amp: 2
      sleep 0.25
    end
    ##| end
  end
  
  live_loop :inky, sync: :ringo do
    loop_n=11
    if loops[loop_n.to_s] == 0 then midi_note_on loop_n, 3, port: "launch_control"; stop else midi_note_on loop_n, 124, port: "launch_control" end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    ##| use_random_seed 88
    16.times do
      sample s_onset, onset: pick, rate: [2,1,0.5,0.25].choose unless one_in(3)
      sleep 0.125
    end
  end
  
  live_loop :clyde, sync: :ringo do
    loop_n=12
    if loops[loop_n.to_s] == 0 then midi_note_on loop_n, 3, port: "launch_control"; stop else midi_note_on loop_n, 124, port: "launch_control" end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    16.times do
      
      sleep 0.25
    end
  end
end
