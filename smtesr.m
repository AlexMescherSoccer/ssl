target = [0, 0];
agent = zeros(12, 100);
agent.z = [5000, 0];


f = smoothlyMoving(agent , target, 2, 1, 2.3);
disp(f);
%plot(f);