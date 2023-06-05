#!/gnu/store/xkhg3vpjmrwwpdpn6078hzl2iz8vls3g-gnu-apl-1.8-r1587/bin/apl --script
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝                                                                    ⍝
⍝ Utils                                2023-06-05  12:46:26 (GMT-4)  ⍝
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
 ⍝ This is a CALCULATION.
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

∇Z←FIX_GRADE_LETTER ⍵
 ⍝ Ensure Single-Letter Grades have a ' ' appended.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <string>: The grade to consider.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ None.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <string>: Either the original string, or the first character thereof
 ⍝ followed by a ' '.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 ⍝ If the string is already 2 characters long, assume it is good.
 →(2=⍴⍵)/GOOD
 ⍝ Otherwise, take the first character and add a ' '.
 ⍵←1 0\⍵
 GOOD:
 ⍝ Return that string.
 Z←⍵
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

∇Z←⍺ RemoveDiscount ⍵
 ⍝ Remove an already-applied discount, to reveal the original price.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍺ <number>: The decimal representation of a discount; 10% would be 0.1.
 ⍝ ⍵ <number>: The final price, after the discount is applied.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <number>: The original price, before the discount was applied.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 Z ← ⍵ + (⍵ × (⍺ ÷ ((¯1 × ⍺) + 1)))
∇

∇Z←TO_GRADE_POINT ⍵;A;B
 ⍝ Convert a letter grade ('B+') to a Grade Point (3.3).
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <string>: The letter grade, should be length 2 (If the grade doesn't have
 ⍝ a modifier, then the second character should be ' '.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ A <number>: The integer part of the grade point.
 ⍝ B <number>: The fractional part of the grade point.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <number>: The grade point associated with the grade given in ⍵.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 ⍝ If the letter isn't recognizable as a grade, go to ERROR.
 →(~⍵[1]∊↑ALIST_LETTERS[1])/ERROR
 ⍝ Otherwise, look up the two parts of the grade based on standards.
 A←⍵[1] assoc ALIST_LETTERS
 B←⍵[2] assoc ALIST_MODS
 ⍝ Adding them together gives the grade point, which we should return.
 Z←A+B
 →0
 ERROR:
 ⍝ If we don't recognize the letter, assume the grade is present but worth
 ⍝ 0.
 Z←0
∇

∇Z←UnweightedGPA ⍵;Count;Sum
 ⍝ Calculate the unweighted GPA for a given list of grades.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <array of character arrays>: each grade should be in its own array, as it
 ⍝ is a length two character array itself. An array of those is
 ⍝ expected. Specifying them as 'A' 'B+' 'C' works fine.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ Count <number>: The number of grades given.
 ⍝ Sum <number>: The total of grade points earned.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <number>: The unweighted GPA calculated from the grades given.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 ⍝ Get a count first, as we need that for later.
 Count←≢⍵
 ⍝ If we have any single-letter grades, we need to fix them. If not, skip to
 ⍝ GOOD.
 ⍝→{~0<+/1=⍴¨⍵}/GOOD
 ⍝ Fix them using a dedicated procedure.
 ⍵←FIX_GRADE_LETTER¨⍵
 GOOD:
 ⍝ Sum all of the grade points together.
 Sum←+/ TO_GRADE_POINT¨⍵
 ⍝ Divide that sum by the count from earlier and return it.
 Z←∊Sum÷Count
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

∇Z←⍺ assoc ⍵
 ⍝ Find the value in ⍵ for the key ⍺.
 ⍝
 ⍝ This is a CALCULATION.
 ⍝
 ⍝ Arguments
 ⍝ =========
 ⍝ ⍵ <array of arrays>: An APL-style A-list ((foo bar baz) (foo bar baz)) in
 ⍝ which to look.
 ⍝ ⍺ <string> or <number>: The key to look for in the first part of the A-List
 ⍝ ⍵.
 ⍝
 ⍝ Local Variables
 ⍝ ===============
 ⍝ None.
 ⍝
 ⍝ Returns
 ⍝ =======
 ⍝ Z <string or number>: The value associated with ⍺ in ⍵. Without a match, an
 ⍝ empty (rank 0) array.
 ⍝
 ⍝ Impurities
 ⍝ ==========
 ⍝ None.
 ⍝
 Z←(⍺⍷↑⍵[1])/↑⍵[2]
∇

ALIST_LETTERS←00 00
    ((⎕IO+0)⊃ALIST_LETTERS)←'ABCDF'
    ((⎕IO+1)⊃ALIST_LETTERS)←4 3 2 1 0

ALIST_MODS←00 00
    ((⎕IO+0)⊃ALIST_MODS)←'- +'
    ((⎕IO+1)⊃ALIST_MODS)←⊂3⍴0 ⍝ prolog ≡2
    (⊃((⎕IO+1)⊃ALIST_MODS))[⍳3]←¯0.30000000000000004 0 0.30000000000000004

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

