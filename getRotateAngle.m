function [ angle ] = getRotateAngle( u, v )
  
  angle = atan2( cosSimMult( u, v ), scalarMult(u, v ) );
  
end

