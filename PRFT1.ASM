data segment
;DATA SEGMENT is the starting point of the Data Segment
;in a Program and ;DATA is the name given to this segment and
;SEGMENT is the keyword for defining ;Segments, Where we can declare
;our variables.
a db 6,3,2
b db 3 dup(0)
c db 0
k db 0
data ends

code segment
assume cs:code, ds:data
start: mov ax,data
mov ds,ax
lea si,a  ;load si with offset of 'a' in 'ds'
lea di,b  ;load di with offset of 'b' in 'ds'
mov cl,3
mov bh,c
mov bl,k

do: add bh,01
mov al,[si];   [si] contains the offset of a
mov ch,[si]
mov ah,0
jmp factorcheck ;factorcheck block checks if the number is
;divisible by any number smaller than itself

factorcheck:
mov dl,bh
div dl; it will divide the word pointed to by the offset in ax by byte in dl

cmp ah,0
;since quotient of the previous division statement
;is stored in al and remainder in ah we compare
;with ah to find if the number is factor or not

je ifperfect
;if the remainder equals 0 then we add the
;divisor with the previous divisor

ifnotperfect:
add bh,01
;this block increments the value of c stored in bh if
;the number is not a factor

cmp bh,ch
;if the number that is to be checked is greater than
;bh the CF will be set to 1

jc factorcheck
;if the carry flag is 1 it will jump to factor check.
;CF will be 1 when bh is less than ch

jmp compare
;if the carry flag is not 1 we will go to compare
;block to find if the sum of factors is equal to the number or not

ifperfect:
add bl,bh
;adding the previous factor found to the present factor
;of the number and storing it in bl

add bh,01
cmp bh,ch
jc factorcheck
jmp compare

perfectarray:
sub bh,bh
;resetting bh to 0 for checking of the next number in the array

sub bl,bl
;resetting bl to 0 to add the factors of the next number in the array afresh

inc si; to point to next index in the array

mov [di],ch
;moving the perfect number in the new array at the index pointed by di
inc di
;so that next perfect number is stored in the next location of the new array
dec cl
jnz do; so that we check all the number, we keep repeating the
;steps until cl is 0
jmp endpart
;after cl is 0, the entire array is checked and we proceed to end the code

compare:
cmp bl,ch
;to find if the sum of factors is equal to the number or not

je perfectarray;if equal, control goes to the perfectarray block

jmp nextnumber;nextnumber block is when the number is not perfect
;and we just want to increment the pointer to the next number
;in the given array

nextnumber: sub bh,bh
;resetting bh to 0 for checking of the next number in the array
sub bl,bl
;resetting bl to 0 to add the factors of the next number in the array afresh
inc si;to point to next index in the array
dec cl
jnz do
;so that we check all the number, we keep repeating the steps
;until cl is 0

jmp endpart
;after cl is 0, the entire array is checked and
;we proceed to end the code

endpart: mov ah,4ch
int 21h
code ends
end start








FIRST

“Perfect" numbers do not interact much with other parts of number theory. Some of these very old, elementary, very ad-hoc definitions of special classes of integers have proven (and will prove) to interact interestingly with other ideas, but some seem not to. It's not easy for a beginner to guess the significance or subtlety of one of these classes of integers from the innocuous elementary-sounding definitions, usually. But tradition itself lends some significance to such notions. And there is always the possibility that the future discloses some surprising connections. And sometimes the sheer long-standing irresolution of a question gives it considerable cachet, even without profound consequences.
Arithematically, even perfect numbers give a good number theory example to the general idea of classification, i.e. all even perfects have a specific form.
Nicomachus goes on to describe certain results concerning perfect numbers. All of these are given without any attempt at a proof.
 Let us state them in modern notation.
(1) The nth perfect number has n digits.
(2) All perfect numbers are even.
(3) All perfect numbers end in 6 and 8 alternately.
(4) Euclid's algorithm to generate perfect numbers will give all perfect numbers i.e. every perfect number is of the form 2k-1(2k - 1), for some k > 1, where 2k - 1 is prime.
(5) There are infinitely many perfect numbers.
There exists an elegant and sure method of generating these numbers, which does not leave out any perfect numbers and which does not include any that are not; and which is done in the following way. First set out in order the powers of two in a line, starting from unity, and proceeding as far as you wish: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096; and then they must be totalled each time there is a new term, and at each totalling examine the result, if you find that it is prime and non-composite, you must multiply it by the quantity of the last term that you added to the line, and the product will always be perfect. If, otherwise, it is composite and not prime, do not multiply it, but add on the next term, and again examine the result, and if it is composite leave it aside, without multiplying it, and add on the next term. If, on the other hand, it is prime, and non-composite, you must multiply it by the last term taken for its composition, and the number that results will be perfect, and so on as far as infinity.


SECOND

Fields like paleontology, paleo-zoology, and geology (amongst others) are at-best - a guess and estimation of when things happened. Along with that, they say that out Universe is about 13.8 billion years old. If time is calculated in ratio form, then divide 137,438,691,328 by 10.
This leaves 13.743691328 billion - close enough to stretch our best guess at the age of our observed universe.
They also say that our Solar System is about 4.5 billion years old.
subtract 4.5B from 13.8B = 9.3b years went by before the Solar System was born. This is only (in geologic time) about 700 million years off from the 8.589869056b years off from a perfect number.
33,550,336 is an interesting number when looking into the evolution of humans. The earliest Hominids are said to have evolved about 33.5M years ago - the distinctive first step leading to our consciousness as homosapiens.
This is where more specific time comes into play:
Pope Gregory XIII in 1582AD implemented the Gregorian Calendar (still predominately used today).
This is only about 546 years off from when a major transition in humanity's accepted time-tables changed with the acceptance of the Gregorian Calendar.
Now, please understand that this part is subjective and is in no way an attempt to predict anything for the human civilization's future... but going down the line of perfect numbers:
take-
1582AD + 496 = 2078AD then
2078AD +28 = 2106AD and finally
2106AD + 6 = 2112AD (a palindrome)
To those who would question the proper use of 1582AD as a hinging point for the smaller perfect numbers:
Time is relative and is specifically created by mankind to interpret our environment as it has been proven to change around us. This is subjective, but must be considered when placing a marker on the time-line of human evolution. The end result of adding the last 3 perfect numbers calculate to a unique concept that bridges all forms of any known language - the palindrome.
This is the plug and play approach to perfect numbers.
 
THIRD

The Mersenne Twister is a good pseudorandom number generator based on a Mersenne prime. Apparently other systems exist using Mersenne primes for pseudorandom number generation as well.
In communication complexity, Mersenne primes enabled a major advance in private information retrieval schemes, with an asymptotic result dependent on their infinitude.
The number-theoretic transform, an alternative approach to fast Fourier transforms using modular arithmetic rather than floating-point numbers, is most efficient when using GF(p) where p is a Mersenne prime.
The EFF is offering prizes for discovering large primes, and Mersenne primes have won the first two. They are also the likeliest candidate for the remaining two awards since they're easier to prove prime than other numbers of similar size.
The GIMPS software is often used to stress-test new computer configurations. In this capacity it uncovered a bug in the Skylake family of Intel processors.
GPUs are similarly tested with Mersenne-prime methods.
Solinas showed how to use numbers near Mersenne primes to perform high-speed modular reductions, suitable for a fast cryptosystem. Granger & Moss show an alternate generalization that enhances these benefits, especially for modular multiplication.
Harvey, van der Hoeven, & Lecerf give a multiplication algorithm (an extension of Fürer's algorithm) which is the fastest known, and show that it can be further improved given "a slight weakening of the Lenstra-Pomerance-Wagstaff conjecture" on Mersenne prime distribution. Probably the algorithm is not practical for the sizes of numbers typically used but advances in multiplication are very important as they underlie many modern algorithms.




