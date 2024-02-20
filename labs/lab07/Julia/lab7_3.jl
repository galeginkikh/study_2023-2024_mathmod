using Plots
using DifferentialEquations

N = 1224 
n0 = 14

function ode_fn(du, u, p, t)
  (n) = u
  du[1] = (0.7*t + 0.6*cos(t)*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob, dtmax = 0.05)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

plt = plot(dpi = 300, title = "Эффективность рекламы ", legend = false)
plot!(plt, T, n, color = :blue)

savefig(plt, "model_3.png")