defonce :loops do
  {
    '2' => 1, '3' => 0, '4' => 0, '5' => 0,
    '6' => 1, '7' => 0, '8' => 0, '9' => 0
  }
end

defonce :k do
  {
    1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0
  }
end

defonce :ini_light do
  (2..9).each do |i|
    midi_cc i, 3+(123*loops[i.to_s]) if loops[i.to_s] == 0
  end
end

#[1,2,3,4,5][(k[16]*4).round]
live_loop :loop_knob_helm_control do
  use_real_time
  n, val = sync "/midi/launch_control/0/1/control_change"
  if n < 10
    loops[n.to_s] = loops[n.to_s] == 1 ? 0 : 1
    midi_cc n, 3+(107*loops[n.to_s])
  elsif n>39 and n<49
    midi_cc n, val, port: 'loopmidi_port', channel: 1
  else
    knob_map = (n<29) ? 20 : 32
    k[n - knob_map] = (val/128.0).round(2)
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
  d1 ''
  d2 ''
  d3 ''
  d4 ''
end

if loops['6'] == 0 then d1 :silence else midi_cc 6, 124 end
if loops['7'] == 0 then d2 :silence else midi_cc 7, 124 end
if loops['8'] == 0 then d3 :silence else midi_cc 8, 124 end
if loops['9'] == 0 then d4 :silence else midi_cc 9, 124 end
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
s_onset_misc='D:\Sonic Pi samples\onsets\misc'
s_onset_sub='D:\Sonic Pi samples\onsets\sub'
s_onset_tonic='D:\Sonic Pi samples\onsets\tonic'

##############################################

bpm = 60

live_loop :ringo do
  sync :d0
  cue :bpm
end

live_loop :picoloop, sync: :ringo do
  sync :bpm if current_bpm != bpm
  use_bpm bpm
  4.times do
    ##| time_warp -0.125 do
    midi_clock_beat
    ##| end
    sleep 0.5
  end
end

with_fx :reverb do
  live_loop :blinky, sync: :ringo do
    loop_n=2
    if loops[loop_n.to_s] == 0 then midi_cc loop_n, 3; stop else midi_cc loop_n, 124 end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    16.times do
      
      sleep 0.25
    end
  end
  
  live_loop :pinky, sync: :ringo do
    loop_n=3
    if loops[loop_n.to_s] == 0 then midi_cc loop_n, 3; stop else midi_cc loop_n, 124 end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    16.times do
      
      sleep 0.25
    end
  end
  
  live_loop :inky, sync: :ringo do
    loop_n=4
    if loops[loop_n.to_s] == 0 then midi_cc loop_n, 3; stop else midi_cc loop_n, 124 end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    16.times do
      
      sleep 0.25
    end
  end
  
  live_loop :clyde, sync: :ringo do
    loop_n=5
    if loops[loop_n.to_s] == 0 then midi_cc loop_n, 3; stop else midi_cc loop_n, 124 end
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    16.times do
      
      sleep 0.25
    end
  end
end
