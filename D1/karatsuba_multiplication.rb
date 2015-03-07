def karatsuba_multiplication int1, int2
  n = [int1.to_s.size, int2.to_s.size].max

  if int1 < 10 || int2 < 10
    return int1 * int2
  end

  a = int1 / 10 ** (n/2)
  b = int1 % 10 ** (n/2)
  c = int2 / 10 ** (n/2)
  d = int2 % 10 ** (n/2)

  ac = karatsuba_multiplication(a, c)
  bd = karatsuba_multiplication(b, d)
  third = karatsuba_multiplication(a + b, c + d)

  return 10 ** (n/2 * 2) * ac + 10 ** (n/2) * (third - ac - bd)  + bd
end
