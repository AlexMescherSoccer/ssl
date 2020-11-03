function [ rul ] = kickBallToPoint(agent, gk, target, Point, R, p, kP, speed, A, vMax, k)

    if(gk.y > 0)
        Point(2) = Point(2) - 200;
    else
        Point(2) = Point(2) + 200;
    end

    a = (Point(1) - agent.x)  * (Point(2) - target(2)) - (Point(2) - agent.y) * (Point(1) - target(1));
    rul1 = obezd(agent, target, speed, R, a, A, vMax, k);

    SpeedX = rul1.SpeedX;
    SpeedY = rul1.SpeedY;

    rul2 = rotateToAngle(agent, target, p);
    SpeedR = rul2.SpeedR;


    if(abs(a/(norm(Point-agent.z)*norm(Point-target))) < 0.015 && scalarMult(Point-agent.z, Point-target) > 0)

        rul2 = rotateToAngle(agent, Point, p);
        SpeedR = rul2.SpeedR;

        if(agent.isBallInside)
          rul = Crul(speed, 0, 1, SpeedR, 0);
        else
          rul = Crul(speed, 0, 0, SpeedR, 0);
        end
          %rul = Crul(0, 0, 0, 0, 0);
    else
        
      if(((target(2) < 1000 && target(2) > -1000) && (target(1) < -4000 || target(1) > -500)) || (target(2) > 2500 || target(2) < -2500 || target(1) < -4500 || target(1) > 0))
          SpeedX = 0;
          SpeedY = 0;
          SpeedR = 0;
      end

      rul = Crul(SpeedX, SpeedY, 0, SpeedR, 0);

    end
end