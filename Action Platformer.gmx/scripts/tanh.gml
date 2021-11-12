#define tanh
///tanh(x)
return sinh(argument[0]) / cosh(argument[0]);

#define sinh
///sinh(x)
return (exp(1)^argument[0] - exp(1)^-argument[0])

#define cosh
///cosh(x)
return (exp(1)^argument[0] + exp(1)^-argument[0])