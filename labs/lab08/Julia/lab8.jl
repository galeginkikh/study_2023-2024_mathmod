using Plots
using DifferentialEquations

p_cr = 11.4
tau1 = 14
p1 = 6.6 
tau2 = 22
p2 = 4.5 
N = 26 
q = 1 

a1 = p_cr / (tau1 * tau1 * p1 * p1 * N * q)
a2 = p_cr / (tau2 * tau2 * p2 * p2 * N *q)
b = p_cr / (tau1 * tau1 * tau2 * tau2 * p1 * p1 * p2 * p2 * N * q)
c1 = (p_cr - p1) / (tau1 * p1)
c2 = (p_cr - p2) / (tau2 * p2)


function ode_fn(du, u, p, t)
  M1, M2 = u
  du[1] = u[1] - b / c1*u[1] * u[2] - a1 / c1*u[1] * u[1]
  du[2] = c2 / c1*u[2] - b / c1*u[1] * u[2] - a2 / c1*u[2] * u[2]
end

v0 = [4.2, 3.8]
tspan = (0.0, 30.0)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
M1 = [u[1] for u in sol.u]
M2 = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 300, legend = true)

plot!(plt, T, M1, label = "Оборотные средства фирмы 1", color = :blue)

plot!(plt, T, M2, label = "Оборотные средства фирмы 2", color = :green)

savefig(plt, "model_1.png")