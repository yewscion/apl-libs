#!/gnu/store/zxc8jfy32vl4q3rrcypg3di77jzkad5j-gnu-apl-1.8-r1587/bin/apl --script
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝                                                                    ⍝
⍝ Comparison                           2022-12-07  16:47:50 (GMT-5)  ⍝
⍝                                                                    ⍝
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇Z← A ⍵
 Z←1000 × (⍵ * 2)
∇

∇Z ← B ⍵
 Z ← (2 * ⍵)
∇

∇Z ← Threshold NarrowGuess Guess;Drift;LastGuess;LastDrift;Step
 LastGuess ← 0
 Step ← Threshold ÷ 10000
 Drift ← CalculateDrift Guess
 →(Threshold≥Drift)/FINISH
 AGAIN:
 LastDrift ← Drift
 LastGuess ← Guess
 Guess ← Guess - Step
 Drift ← CalculateDrift Guess
 →(LastDrift<Drift)/GIVEUP
 →(Threshold<Drift)/AGAIN
 →(Threshold≥Drift)/FINISH
 GIVEUP:
 ⎕←"Stopping, as continuing would increase the drift."
 FINISH:
 Z ← LastGuess
∇

∇Z ← CalculateDrift ⍵;Aresult;Bresult
 Aresult ← A ⍵
 Bresult ← B ⍵
 Z ← |(Aresult - Bresult)
∇

FirstPointGuess←¯0.02

SecondPointGuess←0.04

ThirdPointGuess←18.37

ThresholdLimit←0.001

⎕CT←1E¯13

⎕FC←(,⎕UCS 46 44 8902 48 95 175)

⎕IO←1

⎕L←0

⎕LX←' ' ⍝ proto 1
  ⎕LX←0⍴⎕LX ⍝ proto 2

⎕PP←10

⎕PR←' '

⎕PS←0 0

⎕PW←80

⎕R←0

⎕RL←16807

⎕TZ←¯5

⎕X←0

⍝ Active Program Start
⎕←"First guess: 0.0000"⍕FirstPointGuess
⎕←"Second guess: 0.0000"⍕SecondPointGuess
⎕←"Third guess: 00.0000"⍕ThirdPointGuess
⎕←"Threshold: 0.0000"⍕ThresholdLimit
⎕←"\n\n"
⎕←"\nNarrowing First Guess...\n"
⎕← ThresholdLimit NarrowGuess FirstPointGuess
⎕←"\nNarrowing Second Guess...\n"
⎕← ThresholdLimit NarrowGuess SecondPointGuess
⎕←"\nNarrowing Third Guess...\n"
⎕← ThresholdLimit NarrowGuess ThirdPointGuess

