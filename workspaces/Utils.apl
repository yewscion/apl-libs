#!/gnu/store/7zlgpa87r2rfcw1d63r2wbblavamaf2v-gnu-apl-1.8-r1587/bin/apl --script
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝                                                                    ⍝
⍝ Utils                                2022-09-05  21:33:34 (GMT-4)  ⍝
⍝                                                                    ⍝
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇Z←⍺ COUNTCHAR ⍵;A
 ⍝ Count the number of times ⍺ appears in ⍵.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍺ <character>: The character to search for in ⍵.
 ⍝ ⍵ <array>: The array in which to look for ⍺.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ A <boolean array>: Denotes whether ⍺ is at the same index in ⍵.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <number>: The number of times ⍺ appears in ⍵.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 
 ⍝ First we find each occurance of ⍺ in ⍵, creating the boolean mask.
 A←⍺⍷⍵
 ⍝ Then we do a plus-reduce (summation) on A, returning the result.
 Z←+/A
∇

∇Z←COUNTVOWELS ⍵;A;E;I;O;U;Y;Total
 ⍝ Count each vowel (A E I O U Y) in ⍵, as well as the total length of ⍵.
 ⍝
 ⍝ This is a Calculation.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <string>: The array of characters in which to count.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ A <number>: The number of times A appears in ⍵, case-insensitive.
 ⍝ E <number>: The number of times E appears in ⍵, case-insensitive.
 ⍝ I <number>: The number of times I appears in ⍵, case-insensitive.
 ⍝ O <number>: The number of times O appears in ⍵, case-insensitive.
 ⍝ U <number>: The number of times U appears in ⍵, case-insensitive.
 ⍝ Y <number>: The number of times Y appears in ⍵, case-insensitive.
 ⍝ Total <number>: The number of characters in ⍵.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <numeric array>: The above counts (in that order).
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 ⍝ Count each letter, not respecting case.
 A←('A' COUNTCHAR ⍵) + ('a' COUNTCHAR ⍵)
 E←('E' COUNTCHAR ⍵) + ('e' COUNTCHAR ⍵)
 I←('I' COUNTCHAR ⍵) + ('i' COUNTCHAR ⍵)
 O←('O' COUNTCHAR ⍵) + ('o' COUNTCHAR ⍵)
 U←('U' COUNTCHAR ⍵) + ('u' COUNTCHAR ⍵)
 Y←('Y' COUNTCHAR ⍵) + ('y' COUNTCHAR ⍵)
 ⍝ Count the total number of characters.
 Total←≢⍵
 ⍝ Return the array.
 Z←A E I O U Y Total
∇

∇Z←FORMATVOWELS ⍵;A;E;I;O;U;Y;Total;Counts
 ⍝ Build a report on the vowel composition of ⍵.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <string>: The array of characters in which to work.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ A <number>: The number of times A appears in ⍵, case-insensitive.
 ⍝ E <number>: The number of times E appears in ⍵, case-insensitive.
 ⍝ I <number>: The number of times I appears in ⍵, case-insensitive.
 ⍝ O <number>: The number of times O appears in ⍵, case-insensitive.
 ⍝ U <number>: The number of times U appears in ⍵, case-insensitive.
 ⍝ Y <number>: The number of times Y appears in ⍵, case-insensitive.
 ⍝ Total <number>: The number of characters in ⍵.
 ⍝ Counts <numeric array>: The above counts (in that order).
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <string array>: The vowel composition report broken up into individual
 ⍝ strings, meant to be viewed as a table.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 ⍝ First, call COUNTVOWELS on the array to populate the Counts array.
 Counts←COUNTVOWELS ⍵
 ⍝ Extract each count from Counts so it is easier to understand what
 ⍝ follows.
 A←↑0⌽Counts
 E←↑1⌽Counts
 I←↑2⌽Counts
 O←↑3⌽Counts
 U←↑4⌽Counts
 Y←↑5⌽Counts
 Total←↑6⌽Counts
 ⍝ Build our string, starting with a header row and formatting the numbers
 ⍝ appropriately.
 Z←"  NUMBER PERCENT"
 Z←Z,"\nA  " (5 0⍕A)  (7 2⍕100×A÷Total)
 Z←Z,"\nE  " (5 0⍕E)  (7 2⍕100×E÷Total)
 Z←Z,"\nI  " (5 0⍕I)  (7 2⍕100×I÷Total)
 Z←Z,"\nO  " (5 0⍕O)  (7 2⍕100×O÷Total)
 Z←Z,"\nU  " (5 0⍕U)  (7 2⍕100×U÷Total)
 Z←Z,"\nY  " (5 0⍕Y)  (7 2⍕100×Y÷Total)
∇

∇VowelReport ⍵;PW
 ⍝ Build and Display a vowel composition report of ⍵.
 ⍝
 ⍝ This is an ACTION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <string>: The array of characters in which to work.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ PW <number>: A holder for the prior value of ⎕PW, as we need to change it
 ⍝ below.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Nothing.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ Changes System Values and Prints to the Screen.
 ⍝
 ⍝ First, there is an issue with displaying the array of strings where it
 ⍝ will wrap randomly. In my experimentation, a ⎕PW value of 10000 made it
 ⍝ work as expected.
 ⍝
 ⍝ So, swap whatever value is in ⎕PW for 10000.
 PW←⎕PW
 ⎕PW←10000
 ⍝ Now, call FORMATVOWELS and print the result to screen.
 ⎕←FORMATVOWELS ⍵
 ⍝ And restore the original value of ⎕PW.
 ⎕PW←PW
∇

∇Z←WithTax ⍵;Rate;A;B;Cost
 ⍝ Calculate the price of an item including a 7% sales tax.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <number>: The price (in dollars) of the item before tax.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ Rate <number>: A decimal representation of the sales tax rate.
 ⍝ Cost <number>: The cost of the item without tax, in cents.
 ⍝ A <number>: The exact cost with tax, in cents.
 ⍝ B <number>: The price with tax in cents, rounded up to the nearest cent.
 ⍝ Returns
 ⍝ =======
 ⍝ Z <string>: The full price of the item with tax, in dollars.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 ⍝ Assume a 7% Sales Tax.
 Rate←0.07
 ⍝ Convert the cost to cents for precision.
 Cost←⍵×100
 ⍝ The Main Calculation: Add the Amount to 7% of the Amount.
 A←Cost + Cost × Rate
 ⍝ Round up to the nearest cent.
 B←⌈A
 ⍝ Present the result in dollars.
 Z←10 2⍕(B÷100)
∇

⎕CT←1E¯13

⎕FC←(,⎕UCS 46 44 8902 48 95 175)

⎕IO←1

⎕L←0

⎕LX←' ' ⍝ proto 1
  ⎕LX←0⍴⎕LX ⍝ proto 2

⎕PP←10

⎕PR←' '

⎕PS←0 0

⎕PW←10000

⎕R←0

⎕RL←16807

⎕TZ←¯4

⎕X←0

