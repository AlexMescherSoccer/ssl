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

global oldBallPos oldTime;
curTime = cputime();
if isempty(oldTime)
    oldTime = curTime;
end
if isempty(oldBallPos) || curTime - oldTime > 5
    startTime = curTime;
    oldBallPos = [-2250 0];
end
oldTime = curTime;

[RP.Ball.z, oldBallPos] = getBall(Balls, oldBallPos);

 
kickPoint1 = [0, 0];
kickPoint2 = [-4500, 0];
tst1 = [0, -2000];
tst2 = [-4500, -2000];
p = 1;

  %RP.Blue(3).rul = Vratar2(RP.Blue(3), RP.Ball.z, 0);
  RP.Blue(1).rul = GK(RP.Blue(1), RP.Ball.z, 21, 30, 3, 1.3, 0.65); 
  %rul1 = stayOnKickAngle(RP.Blue(3), RP.Ball.z, [0, 0], 21);
  
  %RP.Blue(6).rul = Crul(0, 0, 0, 30, 0);
  %RP.Blue(3).z + 90 * [cos(RP.Blue(3).ang), sin(RP.Blue(3).ang)]
 

   
     %RP.Blue(1).rul = defender(RP.Blue(1), RP.Ball.z, RP.Blue(2), kickPoint1, kickPoint2, 500, 30, 2, 1, 1.3);
     RP.Blue(2).rul = kickBallToPoint(RP.Blue(2), RP.Blue(1), RP.Ball.z, kickPoint1, 150, 30, 2, 1, 0.7);


% RP.Blue(1).rul = stayOnKickAngle(RP.Blue(1), RP.Ball.z, kickPoint1, 30);
% RP.Blue(2).rul = kickBallToPoint(RP.Blue(2), RP.Blue(2), RP.Ball.z, RP.Blue(1).z + 100 * [cos(RP.Blue(1).ang), sin(RP.Blue(1).ang)], 150, 30, 1.5, 1, 1.3);

%% END CONTRIL BLOCK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MAIN END

%Rules

zMain_End = mainEnd();