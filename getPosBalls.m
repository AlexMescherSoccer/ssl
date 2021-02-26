function [ball] = getPosBalls(Balls,oldBallPos)

    ballFindingZone = 500;
    ball = [0,0,0;0,0,0;0,0,0;0,0,0];
    Dmin = [111488,222228,331337,404404];
    x = [0 0];
    y = [0 0];
    for k = 1:numel(Balls)/3
        dist = norm(oldBallPos - Balls(k,2:3));
           
        if Balls(k,1) ~= 0 && Dmin(Balls(k,1)) >= dist && ballFindingZone > dist  
            Dmin(Balls(k,1)) = dist;
            ball(Balls(k,1),:) =  Balls(k,1:3);
        end
    end
    if numel(find(ball(:,1))) == 0
        i = 1;
        for k = 1 :  numel(Balls)/3
            if Balls(k,1) ~= 0
                x(i) = Balls(k,2);
                y(i) = Balls(k,3);
                i = i + 1; 
            end                  
        end
        i = i - 1;
        xAvg = 0;
        yAvg = 0;
        for k = 1 :  i
          xAvg = xAvg + x(i);
          yAvg = yAvg + y(i);
        end
        xAvg = xAvg / i;
        yAvg = yAvg / i;
        avg = [xAvg yAvg];
%         disp('0000000000');
%         disp( xAvg );
%         disp( yAvg );
        for k = 1 :  numel(Balls)/3
            dist = norm(avg - Balls(k,2:3));
            if Balls(k,1) ~= 0 && Dmin(Balls(k,1)) >= dist && ballFindingZone / 2 > dist  
                Dmin(Balls(k,1)) = dist;
                ball(Balls(k,1),:) =  Balls(k,1:3);
            end                  
        end
    end 
    if numel(find(ball(:,1))) == 0
          ball(1,1:3) =[1 avg];
    end 
end