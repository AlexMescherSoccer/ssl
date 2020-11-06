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
global oldBallPos;

if isempty(oldBallPos)
    oldBallPos = RP.Ball.z;
end

if(~RP.Ball.I)
    RP.Ball.x = oldBallPos(1);
    RP.Ball.y = oldBallPos(2);
    RP.Ball.z = oldBallPos;
end


%RP.Blue(3).I

% aaa = 1;
% if(aaa == 1)
%     target = [-3500, -1500];
% else
%     target = [-300, 2000];
% end
% RP.Blue(1).rul.EnableSpinner = true;
% RP.Blue(1).rul.SpinnerSpeed = 200;



% RP.Blue(1).rul = GK(RP.Blue(1), RP.Ball.z, 21, 30);
% %RP.Blue(3).rul = kickBallToPoint(RP.Blue(3), RP.Blue(1), RP.Ball.z, [-4500, 0], 150, 30, 0.7, 21, 2, 1, 2.3);
% %RP.Blue(4).rul = GK2(RP.Blue(4), RP.Ball.z, 21, 70);
% %RP.Blue(3).rul = rotateAndGo(RP.Blue(3), target, 2, 1, 2.3, 21);
% %RP.Blue(3).rul = obezd(RP.Blue(3), RP.Ball.z, 20, 150, 1, 0.25, 0.5, 2.3);
%goToPointToo(RP.Blue(1), target, smoothlyMoving(RP.Blue(1), target, 2, 1, 2.3))

%disp(RP.Blue(3).z);


%GoPoint = [-4200, 0];
%RotatePoint = [0, 0];

%RP.Blue(3).rul = GoToPoint(RP.Blue(3), GoPoint, 15);
RP.Blue(2).rul = kickBallToPoint(RP.Blue(2), RP.Blue(3), RP.Ball.z, [0, 0], 150, 30, 20, 2, 1, 2.3);
RP.Blue(3).rul = GK(RP.Blue(3), RP.Ball.z, 21, 40, 1, 0.5, 2.3);

if RP.Ball.I
    oldBallPos = RP.Ball.z;
end

%% END CONTRIL BLOCK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MAIN END

%Rules

zMain_End = mainEnd();