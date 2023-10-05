# 808 # 808bd # 808cy # 808hc # 808ht # 808lc # 808lt # 808mc # 808mt # 808oh # 808sd
# 909
# ab # ades2 # ades3 # ades4 # amencutup # arpy # auto
# bass # bass0 # bass1 # bass2 # bass3 # bassdm # bassfoo # bd # bend # bin # bleep # blip # bottle
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

load'D:\Sonic Pi samples\petal-master\petal.rb'
use_fx_with_petal false
bpm(60)

d1 ''

#hush

##############################################

chords_r1=[:D,:A,:B,:G].ring
chords_r2=[:Fs,:D,:A,:E].ring
chords_r3=[:A,:F,:C,:G].ring

agogo='D:\Sonic Pi samples\MPCVB\agogo' # 4
bd='D:\Sonic Pi samples\MPCVB\bd' # 13
clap='D:\Sonic Pi samples\MPCVB\clap' # 5
clave='D:\Sonic Pi samples\MPCVB\clave' # 5
hh='D:\Sonic Pi samples\MPCVB\hh' # 4
sd='D:\Sonic Pi samples\MPCVB\sd' # 16
tom='D:\Sonic Pi samples\MPCVB\tom' # 24


s_slice='D:\Sonic Pi samples\slices' # 18

s_onset='D:\Sonic Pi samples\onsets' # 16

##############################################

bpm = 60

live_loop :ringo do
  sync :d0
  cue :bpm
end


