function [p] = ballZ(ball,CrossZone,QCZ)
CamAndBall = find(ball(:,1));
if norm(ball(CamAndBall(1),2:3) - [ball(CamAndBall(1),2),CrossZone]) > 0 
end