import math

def SLog3_to_lin(input_value):
    if input_value >= 171.2102946929 / 1023.0:
        out = math.pow(10.0, (input_value * 1023.0 - 420.0) / 261.5) * (0.18 + 0.01) - 0.01
    else:
        out = (input_value * 1023.0 - 95.0) * 0.01125000 / (171.2102946929 - 95.0)
    return out


input_value = .41
output_value = SLog3_to_lin(input_value)
print(output_value)
