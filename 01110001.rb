with_fx :reverb, room: 1 do
  
  bpm=73
  
  live_loop :ringo do
    sync :d0
    cue :bpm
  end
  
  live_loop :volca, sync: :ringo do
    sync :bpm if current_bpm != bpm
    use_bpm bpm
    4.times do
      time_warp -0.0 do
        midi_clock_beat
      end
      sleep 1
    end
  end
  with_fx :level, amp: 5 do
    live_audio :volca_bass
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
  use_fx_with_petal true
  bpm(bpm)
  d1 ''
  
  
  ##################################################
  
  live_loop :eee, sync: :ringo do
    sync :bpm if current_bpm != bpm
    ##| stop
    use_bpm bpm
    
    sleep 0.25
  end
  
  
  
  
  
end