using Plots
using DifferentialEquations

w = 30.0
g = 1.0
x₀ = 0.7
y₀ = 1.5


function ode_fn(du, u, p, t)
  x, y = u
  du[1] = u[2]
  du[2] = -w*u[1] - g*u[2] + sin(0.6*t)
end

v₀ = [x₀, y₀]
tspan = (0.0, 57.0)
prob = ODEProblem(ode_fn, v₀, tspan)
sol = solve(prob, dtmax=0.05)

X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]

plt = plot(layout=(1,2), dpi=300, legend=false)

plot!(plt[1], T, X, title="Решение уравнения", color=:blue)

plot!(plt[2], X, Y, title="Фазовый портрет", color=:blue)

savefig(plt, "model_3_jl.png")