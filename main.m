%% MAIN START HEADER

global Blues Yellows Balls Rules FieldInfo RefState RefCommandForTeam RefPartOfFieldLeft RP PAR Modul activeAlgorithm obstacles gameStatus

if isempty(RP)
    addpath tools RPtools MODUL
end
%

mainHeader();
%MAP();

if (RP.Pause) 
    return;
end

zMain_End=RP.zMain_End;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% CONTRIL BLOCK

%disp('hello');
%
global oldBall1Pos;
global pos;
global t;

if isempty(oldBall1Pos)
    oldBall1Pos = RP.Ball.z;
end

if (RP.Ball.I)
    oldBall1Pos = RP.Ball.z;
else
    RP.Ball.z = oldBall1Pos;
end

% % ball = getPosBalls(RP.Balls,oldBall1Pos);
% % b = find(ball(:,1));
% % RP.Ball.x=ball(b,2);
% % RP.Ball.y=ball(b,3);
% % RP.Ball.z=ball(b,2:3);
% % if (Dmin > 500) 
% %     ball(b,2:3) = oldBall1Pos;
% % else
% %     oldBallPos = ball(b,2:3);
% % end
%RP.Blue(3).I

% aaa = 1;
kickPoint1 = [0, 0];
kickPoint2 = [-4500, 0];
tst1 = [0, -2000];
tst2 = [-4500, -2000];
p = 1;
% if(aaa == 1)
%     target = [-3500, -1500];
% else
%     target = [-300, 2000];
% end
% RP.Blue(1).rul.EnableSpinner = true;
% RP.Blue(1).rul.SpinnerSpeed = 200;

  %RP.Blue(3).rul = Vratar2(RP.Blue(3), RP.Ball.z, 0);
  %RP.Blue(1).rul = GK(RP.Blue(1), RP.Ball.z, 21, 30, 2, 1, 2.3); 
  %rul1 = stayOnKickAngle(RP.Blue(3), RP.Ball.z, [0, 0], 21);
  %SpeedR = rul1.SpeedR;
  
  %RP.Blue(3).rul = Crul(0, 0, 0, SpeedR, 0);
  %RP.Blue(3).z + 90 * [cos(RP.Blue(3).ang), sin(RP.Blue(3).ang)]
 
%   disp('gggggggggggggggggggggggggg');
%   disp(RP.Blue(2).rul);
%   disp(RP.Blue(3).rul);
%   disp('ffffffffffffffffffffffffff');
% %RP.Blue(4).rul = GK2(RP.Blue(4), RP.Ball.z, 21, 70);
% %RP.Blue(3).rul = rotateAndGo(RP.Blue(3), target, 2, 1, 2.3, 21);
% %RP.Blue(3).rul = obezd(RP.Blue(3), RP.Ball.z, 20, 150, 1, 0.25, 0.5, 2.3);
%goToPointToo(RP.Blue(1), target, smoothlyMoving(RP.Blue(1), target, 2, 1, 2.3))

%disp(RP.Blue(3).z);
    RP.Blue(1).rul = defender(RP.Blue(1), RP.Ball.z, RP.Blue(4), kickPoint1, 500, 20, 2, 1, 1.3);
    RP.Blue(4).rul = kickBallToPoint(RP.Blue(4), RP.Blue(4), RP.Ball.z, kickPoint1, 150, 30, 1.5, 1, 1.3);
%     if isempty(pos) || isempty(t) 
%         pos = R   P.Blue(4).z;
%         t = cputime();
%     end
%     
%     RP.Blue(4).rul = goToPointToo(RP.Blue(4), tst1, 50);
%     curt = cputime();
%     
%     if(curt-t > 0.1 && RP.Blue(4).I)
%        disp([norm(pos -  RP.Blue(4).z) / (curt-t), RP.Blue(4).x, RP.Blue(4).y, curt-t]);
%        pos = RP.Blue(4).z;
%        t = curt;
%        
%     end
    
    
%RP.Blue(4).rul = GK(RP.Blue(4), RP.Ball.z, 20, 10, 2, 1, k)

%GoPoint = [-4200, 0];
%RotatePoint = [0, 0];
%disp(norm(RP.Blue(2).z - RP.Ball.z) > norm(RP.Blue(3).z - RP.Ball.z));
%RP.Blue(3).rul = GoToPoint(RP.Blue(3), GoPoint, 15);

%[RP.Blue(2).rul, RP.Blue(3).rul] = PassBetween(RP.Blue(2), RP.Blue(3), 21);

%RP.Blue(3).rul = GK(RP.Blue(3), RP.Ball.z, 21, 70, 1, 0.5, 2.3);

% for k = 1: 4
%     disp(RP.Blue(k).rul);
%     goalSpeed = [RP.Blue(k).rul.SpeedX, RP.Blue(k).rul.SpeedY, RP.Blue(k).rul.SpeedR];
%     disp(goalSpeed);
%     newSpeed = changeSpeed(k, goalSpeed);
%     RP.Blue(k).rul.SpeedX = newSpeed(1);
%     RP.Blue(k).rul.SpeedY = newSpeed(2);
%     RP.Blue(k).rul.SpeedR = newSpeed(3);
% end

%% END CONTRIL BLOCK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MAIN END

%Rules

zMain_End = mainEnd();