using Plots
using DifferentialEquations

N = 1224
n0 = 14

function ode_fn(du, u, p, t)
  (n) = u
  du[1] = (0.000073 + 0.73*u[1])*(N - u[1])
end

v0 = [n0]
tspan = (0.0, 0.1)
prob = ODEProblem(ode_fn, v0, tspan)
sol = solve(prob)
n = [u[1] for u in sol.u]
T = [t for t in sol.t]

max_dn = 0;
max_dn_t = 0;
max_dn_n = 0;
for (i, t) in enumerate(T)
  if sol(t, Val{1})[1] > max_dn
    global max_dn = sol(t, Val{1})[1]
    global max_dn_t = t
    global max_dn_n = n[i]
  end
end

plt = plot(dpi = 300, title = "Эффективность рекламы", legend = false)
plot!(plt, T, n, color = :blue)
plot!(plt, [max_dn_t], [max_dn_n], seriestype = :scatter, color = :red)

savefig(plt, "model_2.png")