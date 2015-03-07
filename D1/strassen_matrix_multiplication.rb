def matrix_multiplication matrix1, matrix2
  size = matrix1.row_size
  if(size == 1)
    return
  end
  mid = size/2
  a = matrix1.minor(0...mid, 0..mid)
  b = matrix1.minor(0...mid, mid...size)
  c = matrix1.minor(mid...size, 0..mid)
  d = matrix1.minor(mid...size, mid...size)

  e = matrix2.minor(0...mid, 0..mid)
  f = matrix2.minor(0...mid, mid...size)
  g = matrix2.minor(mid...size, 0..mid)
  h = matrix2.minor(mid...size, mid...size)

  p1 = matrix_multiplication a, f-h
  p2 = matrix_multiplication a + b, h
  p3 = matrix_multiplication c + d, e
  p4 = matrix_multiplication d, g - e
  p5 = matrix_multiplication a + d, h
  p6 = matrix_multiplication b - d, g + h
  p7 = matrix_multiplication a - c, e + f

  top_left = p5 + p4 - p2 + p6
  top_right = p1 + p2
  bottom_left = p3 + p4
  bottom_right = p1 + p5 - p3 - p7

  return 
end
