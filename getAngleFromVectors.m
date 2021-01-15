function [ a ] = getAngleFromVectors(u, v)

  sin = cosSimMult(u, v);
  cos = scalarMult(u, v);
  a = atan2(sin, cos) * 57.3;

end