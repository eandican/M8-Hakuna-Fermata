"""
Author: Emre Andican
Class: CSCI 3725
Project Name: Bowdoin Sampling Maschine
Description: Hypnotic, dreamy, and chill songs that allow
you to dance, study, and relax to! First song is more upbeat
and had more of a happier feel. Second song utilizes a sample
I found on looperman.com and slices + chooses slices randomly.
Third song is my attempt at creating a more melodic, deep house
song. Enjoy!
"""

# song 1

use_bpm 125

# Metronome
live_loop :met1 do
  current_tick = tick
  set :global_tick, current_tick
  sleep 1
end

#################### Song One #####################

################### Melody Used ###################

live_loop :melody1, sync: :met1 do
  current_tick = get(:global_tick)
  use_synth :rhodey
  if current_tick < 160 || current_tick >= 192
    with_fx :reverb, room: 0.9 do
      3.times do
        sleep 1
        play chord(:c, :major7), amp: 0.5
        sleep 1
        play chord(:e, :minor7), amp: 0.5
        sleep 2
      end
      
      sleep 1
      play chord(:f, :major7), amp: 0.5
      sleep 1
      play chord(:d, :minor7), amp: 0.5
      sleep 2
    end
  else
    sleep 1
  end
end

live_loop :melody2, sync: :met1 do
  current_tick = get(:global_tick)
  if current_tick >= 128
    use_synth :dpulse
    with_fx :reverb, room: 0.5 do
      3.times do
        play chord(:c, :major7), amp: 0.5
        sleep 0.5
        play chord(:d, :major7), attack: 0.25, amp: 1.5
        sleep 0.5
        play chord(:d, :major7), amp: 0.5
        sleep 2
        play chord(:c, :major7), amp: 0.5
        sleep 0.25
        play chord(:e, :minor7), amp: 0.5
        sleep 0.75
      end
      
      play chord(:e, :minor7), amp: 0.5
      sleep 0.5
      play chord(:d, :major7), attack: 0.25, amp: 0.75
      sleep 0.5
      play chord(:d, :major7), amp: 0.5
      sleep 2
      play chord(:e, :minor7), amp: 0.5
      sleep 0.25
      play chord(:e, :minor7), amp: 0.5
      sleep 0.75
    end
  else
    sleep 1
  end
end

################### Melody Used ###################

###################### Drums ######################

# Kick
live_loop :kickdrum, sync: :met1 do
  current_tick = get(:global_tick)
  if current_tick >= 32
    sample :bd_tek
  end
  sleep 1
end

# Open Hi-Hat
live_loop :hatopen, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 0.5
  if current_tick >= 64
    sample :hat_zan, amp: 1.25
  end
  sleep 0.5
end

# Closed Hi-hat
live_loop :hatclosed, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 0.25
  if current_tick >= 96
    sample :hat_zap, amp: 0.5
  end
  sleep 0.75
end

# House Clap/Snare/Snap
live_loop :clap, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 1
  if current_tick >= 64
    sample :perc_snap, amp: 1.5
  end
  sleep 1
end

# Perc that just fits
live_loop :random_perc, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 2
  if current_tick >= 96
    sample :perc_swoosh, amp: 1.5
  end
  sleep 2
end

# Another sound that just fits
live_loop :crow, sync: :met1 do
  current_tick = get(:global_tick)
  sleep 2
  if current_tick >= 128
    sample :misc_crow, amp: 0.5
  end
  sleep 2
end

# Bassline
live_loop :bass, sync: :met1 do
  current_tick = get(:global_tick)
  if current_tick >= 96
    use_synth :sine
    15.times do
      play :c2, release: 0.8, amp: 1.5
      sleep 1
    end
    play :f2, release: 0.8, amp: 1.5
    sleep 1
  else
    sleep 1
  end
end


###################### Drums ######################

#################### Song One #####################



