##| You could either use the bools ring generator:

##| bassline_rhythm = (bools 0, 1, 0, 0, 0, 0, 1, 0)

##| which will give you a ring of true/false values

##| Or, you could keep with using 0 and 1 numeric values in your ring and use on instead of if:

bassline_rhythm = (ring 0, 1, 0, 0, 0, 0, 1, 0)
live_loop :kick do
  on bassline_rhythm.tick do
    sample :bd_tek
  end
  sleep 0.25
end