# Shift-and-Add-Multiplier

This type of multiplier is very similar to the algorithm we use on sheet when we want to perform the product of 2 numbers.

In case of binary multiplication, we only have 2 digits: `0` and `1`. So, the steps of multiplying should be easier. We should perform this multiplication from right to left (LSB->MSB on multiplier). If current bit is `1` we should send a copy of multiplicand on the corresponding position. If the bit is `0`, a number of `n` bits (n -> length of multiplicand), each bit having value `0`, is copied to the corresponding position.

This is the scheme of the multiplier that was implemented:

<p align = "center"><br><br>
<img src ="https://github.com/RaresMihalache/Shift-and-Add-Multiplier/blob/master/images/scheme.png"><br><br>
</p>

Following steps happen whenever we start the algorithm:

1. There is an `init` signal, which MUST have value `1` at the beginning. This is an initializer for other signals: `B` (multiplicand, extended on `2*n` bits), `A` (partial result, viewed as a register on `2*n` bits) and `Q` (multiplier, `n` bits).

2. After step 1, `init` will be put manually on value `0`. Further, all simulation steps will perform with `init` on `0`. For this value, shift control bits will be `1`. This will have the following effect: `B` (multiplicand) shifts 1 position to left, doubling its value and `Q` (multiplier) shifts 1 position to right, halving its value.

3. At the end, when `Q(0)` is `1`, partial result is sent to `A`. Finally, result will be written in `rez` signal.

In the image below, a simulation for input numbers: `10` and `3` is represented. The result will be kept in `rez` signal:

<p align = "center"><br><br>
<img src = "https://github.com/RaresMihalache/Shift-and-Add-Multiplier/blob/master/images/simulation.png">
</p>
