// 1
MATCH (f:Fighter)-[:beats]->(t:Fighter) WHERE f.weight in [155, 170, 185] RETURN collect(f.name), f.weight

// 2
MATCH(p1:Fighter)-[:beats]->(p2:Fighter)-[:beats]->(p1:Fighter) RETURN p1.name, p2.name

// 3
MATCH(p1:Fighter)-[:beats]-(c) RETURN p1.name, count(c) AS win ORDER BY win DESC

// 4
MATCH (p1:Fighter)
  WHERE NOT EXISTS {
    MATCH (p1)<-[:beats]-(:Fighter)
    MATCH (p1)-[:beats]->(:Fighter)
  }
  RETURN distinct(p1.name)
