function closestPairs(points){
  pY = points.sort(function (point1, point2) {
    return point1[0] <=> point2[0];
  });

  pX = points.sort(function (point1, point2) {
    return point1[1] <=> point2[1];
  });

  findClosestPairs(pX, pY);
};


function findClosestPairs(pX, pY) {
  switch(pX.length){
    case(3)
    break;

    case(2)
    break;

    case(0)
    break;
  }

  findClosestPairs()
};
