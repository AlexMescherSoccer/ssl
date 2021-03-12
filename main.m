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



%% CONTROL BLOCK
global oldBallPos oldTime oldBotPos BotHist;
curTime = cputime();
if isempty(oldTime)
    oldTime = curTime;
end
if isempty(oldBallPos) || curTime - oldTime > 5
    startTime = curTime;
    oldBallPos = [-2250 0];
end
if isempty(BotHist) || curTime - oldTime > 5
  BotHist = [RP.Blue(1).x; RP.Blue(1).y];
end
if isempty(oldBotPos) || curTime - oldTime > 5
    oldBotPos = zeros(8,3);
    oldBotPos(1,2:3) = RP.Blue(1).z;
    oldBotPos(2,2:3) = RP.Blue(2).z;
    oldBotPos(3,2:3) = RP.Blue(3).z;
    oldBotPos(4,2:3) = RP.Blue(4).z;
    oldBotPos(5,2:3) = RP.Blue(5).z;
    oldBotPos(6,2:3) = RP.Blue(6).z;
    oldBotPos(7,2:3) = RP.Blue(7).z;
    oldBotPos(8,2:3) = RP.Blue(8).z;
end
% if isempty(oldBotPos)
%    oldBotPos = RP.Blue(3).z;
% end
oldTime = curTime;
 [RP.Ball.z, oldBallPos] = getPoint(Balls, oldBallPos);
 for i = 1 : 6 
   [RP.Blue(i).z,oldBotPos(i,2:3)] = getPoint(BlueHeap(find(BlueHeap(:,5) == i ), 1 : 3),oldBotPos(i,2:3));
   RP.Blue(i).x = RP.Blue(i).z(1);
   RP.Blue(i).y = RP.Blue(i).z(2);
 end
    BotHist = [BotHist, [RP.Blue(1).x; RP.Blue(1).y]];
    
% %     plot(BotHist);
 
 
 
disp(RP.Blue(3).z);
%disp(BlueHeap(find(BlueHeap(:, 5) == 3), 1)');
disp(RP.Ball.z);
goal1 = [0 0];

goal2 = [-4500 0];
gkGoal1 = [-300 0];
gkGoal2 = [-4300 0];
tst1 = [0 -2000];
tst2 = [-4500 -2000];
p = 1;

  %RP.Blue(3).rul = Vratar2(RP.Blue(3), RP.Ball.z, 0);
  % RP.Blue(4).rul = GK(RP.Blue(4), RP.Ball.z, gkGoal1, 21, 50, 2, 1, 0.65, 0); 
%   RP.Blue(1).rul = kickBallToPoint(RP.Blue(1), RP.Blue(2), RP.Blue(3).z,
%   RP.Ball.z, goal2, 150, 30, 2, 1, 0.7); 
%   RP.Blue(2).rul = stayOnKickAngle(RP.Blue(2), RP.Ball.z, goal1, 21, 2, 1, 0.7);
  %RP.Blue(1).rul = GK(RP.Blue(1), RP.Ball.z, gkGoal1, 21, 50, 3, 1.5, 0.7); 
%   RP.Blue(1).rul = kickBallToPoint(RP.Blue(1), RP.Blue(2), RP.Blue(3).z, RP.Ball.z, RP.Blue(2).z + 25 * [cos(RP.Blue(2).ang), sin(RP.Blue(2).ang)], 150, 30, 2, 1, 0.7);

  % %   oldBotPos = RP.Blue(3).z;
  %RP.Blue(1).z + 125 * [cos(RP.Blue(1).ang), sin(RP.Blue(1).ang);
  if(norm(RP.Blue(1).z - RP.Ball.z) < norm(RP.Blue(3).z - RP.Ball.z))
    %нападающая команда 1
    RP.Blue(1).rul = kickBallToPoint(RP.Blue(1), RP.Blue(4), RP.Blue(3).z, RP.Ball.z, goal1, 150, 30, 2, 1, 0.7);
    RP.Blue(3).rul = defender(RP.Blue(3), RP.Ball.z, RP.Blue(1), goal2, goal1, 500, 30, 2, 1, 1.3);
  else
    %нападающая команда 2
    
  end
   
     %RP.Blue(1).rul = defender(RP.Blue(1), RP.Ball.z, RP.Blue(2), kickPoint1, kickPoint2, 500, 30, 2, 1, 1.3);


% RP.Blue(1).rul = stayOnKickAngle(RP.Blue(1), RP.Ball.z, kickPoint1, 30);
% RP.Blue(2).rul = kickBallToPoint(RP.Blue(2), RP.Blue(2), RP.Ball.z, RP.Blue(1).z + 100 * [cos(RP.Blue(1).ang), sin(RP.Blue(1).ang)], 150, 30, 1.5, 1, 1.3);

%% END CONTRIL BLOCK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MAIN END

%Rules

zMain_End = mainEnd();