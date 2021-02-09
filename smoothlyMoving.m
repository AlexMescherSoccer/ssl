function u = smoothlyMoving(agent, target, a, vMax, k)
    persistent t;
    persistent S;
    persistent targetold;
    persistent vI;
    persistent v0;
    c = 0.01;
    if(isempty(t))
        t = zeros(1, 12);
    end
    if (t(agent.id) == 0)
        t(agent.id) = cputime();
    end
    if(isempty(S))
        S = zeros(1, 12);
    end
    if (S(agent.id) == 0)
        S(agent.id) = norm(agent.z - target) / 1000;
    end
    if(isempty(targetold))
        targetold = zeros(12, 2);
    end
    if(isempty(vI))
        vI = zeros(1, 12);
    end
    if(isempty(v0))
        v0 = zeros(1, 12);
    end
    
    if(norm(targetold(agent.id, :) - target) > 100)
      v0(agent.id) = vI(agent.id);
      t(agent.id) = cputime();    
      S(agent.id) = norm(agent.z - target) / 1000;
    end
    targetold(agent.id, :) = target;
    T = cputime() - t(agent.id);
    vLim = sqrt(S(agent.id) * a) + v0(agent.id);
    if (vLim < vMax)
        vMax = vLim;
    end
    t0 = (vMax - v0(agent.id)) / a;
    t1 = (S(agent.id) * 2 * a - v0(agent.id) ^ 2 - v0(agent.id) * 2 * vMax) / vMax;
    tfin = t0 + t1;
    if(T <= t0) %разгон
      vI(agent.id) = v0(agent.id) + a * T;
      xI = v0(agent.id) * T + (a * T ^ 2) / 2;
    elseif(T <= t1) %на макс скорости
      vI(agent.id) = vMax;
      xI = v0(agent.id) * t0 + (a * t0 ^ 2) / 2 + vMax * (T-t0);
    elseif(T <= tfin) %замедление
      vI(agent.id) = vMax - a * (T - t1); 
      xI = (agent.id) * t0 + (a * t0 ^ 2) / 2 + vMax * (t1-t0) - (a * (T - t1) ^ 2) / 2;   
    else
      vI(agent.id) = 0;
      xI = S(agent.id);
    end
 
    u = (vI(agent.id) + k * (xI - S(agent.id) + norm(agent.z - target)*0.001)) / c;
    %u=30;
end