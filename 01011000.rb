# 808 # 808bd # 808cy # 808hc # 808ht # 808lc # 808lt # 808mc # 808mt # 808oh # 808sd
# 909 # ab # ade # ades2 # ades3 # ades4 # alex # alphabet # amencutup # armora # arp
# arpy # auto # baa # baa2 # bass # bass0 # bass1 # bass2 # bass3 # bassdm # bassfoo
# battles # bd # bend # bev # bin # birds # birds3 # bleep # blip # blue # bottle
# breaks125 # breaks152 # breaks157 # breaks165 # breath # bubble # can # casio
# cb # cc # chin # chink # circus # clak # click # clubkick # co # control # cosmicg
# cp # cr # crow # d # db # diphone # diphone2 # dist # dork2 # dorkbot # dr # dr_few
# dr2 # dr55 # drum # drumtraks # e # east # electro1 # erk # f # feel # feelfx
# fest # fire # flick # fm # foo # future # gab # gabba # gabbaloud # gabbalouder
# glasstap # glitch # glitch2 # gretsch # h # hand # hardcore # hardkick # haw # hc
# hh # hh27 # hit # hmm # ho # hoover # house # ht # if # ifdrums # incoming
# industrial # insect # invaders # jazz # jungbass # jungle # jvbass # kicklinn # koy
# kurt # latibro # led # less # lighter # linnhats # lt # made # made2 # mash # mash2
# metal # miniyeah # moan # monsterb # moog # mouth # mp3 # msg # mt # mute # newnotes
# noise # noise2 # notes # numbers # oc # odx # off # outdoor # pad # padlong # pebbles
# perc # peri # pluck # popkick # print # proc # procshort # psr # rave # rave2 # ravemono
# realclaps # reverbkick # rm # rs # sax # sd # seawolf # sequential # sf # sheffield # short
# sid # sine # sitar # sn # space # speakspell # speech # speechless # speedupdown # stab
# stomp # subroc3d # sugar # sundance # tabla # tabla2 # tablex # tacscan # tech # techno
# tink # tok # toys # trump # ul # ulgab # uxay # v # voodoo # wind # wobble # world
# xmas # yeah

load'D:\Sonic Pi samples\petal-master\petal.rb'
use_fx_with_petal false
bpm(60)

d1 ''

#hush

##############################################

chords_r1=[:D,:A,:B,:G].ring
chords_r2=[:Fs,:D,:A,:E].ring
chords_r3=[:A,:F,:C,:G].ring

po12bd='D:\Sonic Pi samples\PO-12 Samples\bass_drum' # 9
po12bt='D:\Sonic Pi samples\PO-12 Samples\bass_tone' # 12
po12blip='D:\Sonic Pi samples\PO-12 Samples\blip' # 10
po12clap='D:\Sonic Pi samples\PO-12 Samples\clap' # 10
po12click='D:\Sonic Pi samples\PO-12 Samples\click' # 11
po12chh='D:\Sonic Pi samples\PO-12 Samples\closed_hh' # 14
po12cbll='D:\Sonic Pi samples\PO-12 Samples\cowbell' # 13
po12cy='D:\Sonic Pi samples\PO-12 Samples\cymbal' # 15
po12ht='D:\Sonic Pi samples\PO-12 Samples\hi_tom' # 12
po12lt='D:\Sonic Pi samples\PO-12 Samples\low_tom' # 10
po12noise='D:\Sonic Pi samples\PO-12 Samples\noise' # 8
po12sn='D:\Sonic Pi samples\PO-12 Samples\snare' # 9
po12st='D:\Sonic Pi samples\PO-12 Samples\sticks' # 9
po12ss='D:\Sonic Pi samples\PO-12 Samples\synth_snare' # 9
po12tone='D:\Sonic Pi samples\PO-12 Samples\tone' # 11

kastle='D:\Sonic Pi samples\Kastle Live Drum Pack' #50

s_slice='D:\Sonic Pi samples\slices' # 18

s_onset='D:\Sonic Pi samples\onsets' # 16

##############################################

bpm = 60

live_loop :ringo do
  sync :d0
  cue :bpm
end
