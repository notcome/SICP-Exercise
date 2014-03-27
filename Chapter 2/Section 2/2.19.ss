#|
Exercise 2.19: Change-counting with List

The three procedures first-denomination, except-first-denomination and no-more?
are simply car, cdr and null? respectively.

The order of the list coin-values doesn't affect anything. The algorithm guesses
the number of each coin value: it will try the possible numbers of a certain
value and pass each possible leftover to itself with a smaller coin-value list.
For example, I would like to get 10 with 2 and 4:

10 = 2 * 5 + 4 * 0;
10 = 2 * 4 + 4 * 0 + 2 (abandoned)
10 = 2 * 3 + 4 * 1
10 = 2 * 2 + 4 * 1 + 2 (abandoned)
10 = 2 * 1 + 4 * 2
10 = 2 * 0 + 4 * 2 + 2 (abandoned)

What about with 4 and 2?

10 = 4 * 2 + 2 * 1
10 = 4 * 1 + 2 * 3
10 = 4 * 0 + 2 * 5

As shown above, the only affect of changing order is different intermediate
representing of the result (2 first or 4 first). However, always passing a
descending list helps to avoid most abandonded cases in the first example, which
is caused by there is no room for the next coin value, though not all of them:
Get 7 with 5, 3, 1:
7 = 5 * 1 + 3 * 1 (abandonded)
7 = 5 * 1 + 3 * 0 + 1 * 2
|#

(define no-more? null?)
(define except-first-denomination cdr)
(define first-denomination car)

(define (cc amount coin-values)
  (cond ((= amount 0)
         1)
        ((or (< amount 0)
             (no-more? coin-values))
         0)
        (else
         (+ (cc
             amount
             (except-first-denomination
              coin-values))
            (cc
             (- amount
                (first-denomination
                 coin-values))
             coin-values)))))
