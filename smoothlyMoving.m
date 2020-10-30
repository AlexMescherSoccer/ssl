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
        targetold = [0, 0];
    end
    if(isempty(vI))
        vI = 0;
    end
    if(isempty(v0))
        v0 = 0;
    end
    
    if(abs(targetold - target) > 50)
      v0 = vI;
      t(agent.id) = cputime();    
      S(agent.id) = norm(agent.z - target) / 1000;
    end
    targetold = target;
    T = cputime() - t(agent.id);
    vLim = sqrt(S(agent.id) * a);
    if (vLim < vMax)
        vMax = vLim;
    end
    t0 = vMax/a;
    t1 = S(agent.id)/vMax;
    tfin = t0+t1;
    if(T <= t0)
      vI = v0 + a * T;
      xI = v0 * T + (a * T * T) / 2;
    elseif(T <= t1)
      vI = vMax;
      xI = v0 * t0 + vMax * (T-t0) + (a * t0 ^ 2) / 2;
    elseif(T <= tfin)
      vI = v0 + vMax - a * (T - t1); 
      xI = v0 * t0 + v0 * t1 + vMax * (t1-t0) + (a * t0 ^ 2) / 2 - (a * (T - t1) ^ 2) / 2;   
    else
      vI = 0;
      xI = S(agent.id);
    end
    
    
    %disp([vI, xI, S(agent.id) - norm(agent.z - target)*0.001]);
    u = (vI + k * (xI - S(agent.id) + norm(agent.z - target)*0.001)) / c;
    %disp(u);
end