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

if(~RP.Ball.I)
    RP.Ball.x = oldBallPos(1);
    RP.Ball.y = oldBallPos(2);
end


%RP.Blue(3).I

aaa = 0;
if(aaa == 1)
    target = [-3500, -1500];
else
    target = [-300, 2000];
end

%RP.Blue(3).rul = kickBallToPoint(RP.Blue(3), RP.Blue(3), RP.Ball.z, [-3500, -1500], 15, 30, 0.7, 50, 0.25, 0.5, 2.3);
%RP.Blue(3).rul = rotateAndGo(RP.Blue(3), RP.Ball.z, 2, 1, 2.3, 21);
RP.Blue(3).rul = obezd(RP.Blue(3), RP.Ball.z, 20, 150, 1, 0.25, 0.5, 2.3);
oldBallPos = RP.Ball.z;


%disp(RP.Blue(3).z);


%GoPoint = [0, 0];
%RotatePoint = [0, 0];

%RP.Blue(3).rul = GoToPoint(RP.Blue(3), GoPoint, 15);
%RP.Blue(3).rul = RotateToPoint(RP.Blue(3), RotatePoint, 15);

%% END CONTRIL BLOCK

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MAIN END

%Rules

zMain_End = mainEnd();