function [ball,oldPointPos] = getPoint(Points,oldPointPos)
    CrossZone = 250;
    one = 0;
    two = 0;
    three = 0;
    four = 0;
    ball = [0 0];
    nonEmptyPoints = find(Points(:,1));
% %     for k = 1:(numel(nonEmptyPoints) + 1) 
% %        if Points(k,1) == 1
% %            one = one + 1;
% %        end
% %        if Points(k,1) == 2
% %            two = two + 1;
% %        end
% %        if Points(k,1) == 3
% %            three = three + 1;
% %        end
% %        if Points(k,1) == 4
% %            four = four + 1;
% %        end
% %     end
    if numel(nonEmptyPoints) == 0
            %disp(1);
            ball = oldPointPos;
% % % % %     elseif one < 2 && two < 2 && three < 2 && four < 2  && Points(nonEmptyPoints(1)) - Points(nonEmptyPoints(2)) < CrossZone 
% % % % %         disp('33333333333333333333333333333333333333');
% % % % %         Points = getPosPoints(Points(nonEmptyPoints, 1:3),Points(nonEmptyPoints(1)));
% % % % %         ball = avgBall(Points,CrossZone);
% % % % %         ff = find(Points(:,1));
% % % % %         if numel(ff) == 1
% % % % %             ball = Points(ff,2:3);
% % % % %         end
    elseif  numel(nonEmptyPoints) == 1
           % disp(2);
            ball = Points(nonEmptyPoints, 2:3);
    else
           % disp(3);
            Points = getPosPoints(Points(nonEmptyPoints, 1:3),oldPointPos);
            %disp(Points);
            ball = avgPoint(Points,CrossZone);
    
    end
    oldPointPos = ball;
end