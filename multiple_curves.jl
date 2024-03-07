using Plots  
using Roots

# Define the quasi-arithmetic mean function
function ee(x1, x2, f, inv_f)
    return inv_f(f(x1)/2 + f(x2)/2)
end

### Inputs from user
start_same_inc = 1000

# Defining ranges for plots based on inputs
x1_range = x2_range = range(0.01, stop=start_same_inc, length=100)

# Plotting level curves

## I. Plot: f(x) = x 

### Define the generator function and the inverse
f1(x) = x
inv_f1(x) = x

### Generate data for plotting level curve
z1 = [ee(x1, x2, f1, inv_f1) for x1 in x1_range, x2 in x2_range]

### Plotting level curve
plot(x1_range, x2_range, z1, xlabel="x1", ylabel="x2", title="f(x) = x")

## II. Plot: f(x) = -e^(-ax)

### Define the generator function and the inverse
f2(x, a) = -exp(-a * x)
inv_f2(y, a) = find_zero(x -> f2(x, a) - y, 0.0)

### Inputs from user
start_same_inc = 1000
inc_protect_x1 = 800

### Generate data for plotting level curve based on inputs
x1_range = x2_range = range(0.01, stop=start_same_inc, length=100)
z2(a) = [ee(x1, x2, x -> f2(x, a), x -> inv_f2(x, a)) for x1 in x1_range, x2 in x2_range]

### Plotting level curve
a = log(2) / (start_same_inc - inc_protect_x1)
plot(x1_range, x2_range, z2(a), title="f(x) = -e^(-ax)")

## III. Plot: f(x) = ln(x)

### Define the generator function and the inverse
f3(x) = log(x)
inv_f3(y) = exp(y)

### Inputs from user
start_same_inc = 1000

### Generate data for plotting level curve based on inputs
x1_range = x2_range = range(0.01, stop=start_same_inc, length=100)
z3 = [ee(x1, x2, f3, inv_f3) for x1 in x1_range, x2 in x2_range]

### Plotting level curve
plot(x1_range, x2_range, z3, title="f(x) = log(x)")

## IV. Plot: f(x) = x^(1 - gamma) / (1 - gamma)

### Define the generator function and the inverse
f4(x, gamma) = x^(1 - gamma) / (1 - gamma)
inv_f4(x, gamma) = ((1-a)*x)^(1/(1-a))

### Inputs from user
start_same_inc = 1000
inc_protect_x1 = 800

### Generate data for plotting level curve based on inputs
x1_range = x2_range = range(0.01, stop=start_same_inc, length=100)
z4(gamma) = [ee(x1, x2, x -> f4(x, gamma), x -> inv_f4(x, gamma)) for x1 in x1_range, x2 in x2_range]

### Plotting level curve
k = inc_protect_x1/start_same_inc
gamma = 1 - 1/log(k, 1/2)
plot(x1_range, x2_range, z4(gamma), title="f(x) = x^(1 - gamma) / (1 - gamma)")

# label the individual level curves better
# slider for protected income and starting income
# change gamma so viewer sees the frac (k) and slider for frac (k)
# cages.jl and franklin
# make single curves based on sliders
 