// RUN: stablehlo-translate --interpret -split-input-file %s

func.func @dynamic_pad() {
  %operand = stablehlo.constant dense<[[0, 0, 0, 0],
                                       [0, 1, 2, 0],
                                       [0, 3, 4, 0],
                                       [0, 5, 6, 0],
                                       [0, 0, 0, 0]]> : tensor<5x4xi64>
  %padding_value = stablehlo.constant dense<-1> : tensor<i64>
  %low = stablehlo.constant dense<[1, -1]> : tensor<2xi64>
  %high = stablehlo.constant dense<[1, -1]> : tensor<2xi64>
  %interior = stablehlo.constant dense<[0, 1]> : tensor<2xi64>
  %result = stablehlo.dynamic_pad %operand, %padding_value, %low, %high, %interior
    : (tensor<5x4xi64>, tensor<i64>, tensor<2xi64>, tensor<2xi64>, tensor<2xi64>) -> tensor<7x5xi64>
  check.expect_eq_const %result, dense<[
    [-1, -1, -1, -1, -1],
    [-1,  0, -1,  0, -1],
    [-1,  1, -1,  2, -1],
    [-1,  3, -1,  4, -1],
    [-1,  5, -1,  6, -1],
    [-1,  0, -1,  0, -1],
    [-1, -1, -1, -1, -1]]> : tensor<7x5xi64>
  func.return
}
