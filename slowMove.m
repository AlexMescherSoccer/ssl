function u = slowMove(agent, target, Vmax, a, k)
    persistent tz;
    if isempty(tz)
        tz = cputime();
    end
    t = cputime() - tz;
    C = 0.01;
    t0 = Vmax / a;
    t1 = norm(agent.z - target)/Vmax - t0;
    %SrAs = Vmax * t0; 
    T = t0 + t1;
    if t <= t0
       speed = a*t;
       x = a*t^2/2;
    elseif t <= T
       speed = Vmax;
       x = Vmax*t + a*t^2/2;
    else 
       speed = Vmax - a*(t-T);
       x = (Vmax*t - a((t - T)^2 + t0^2)/2);
    end
     u = (speed + k(x-norm(agent.z - target)))/(C*1000);
end