// Query 1 - Courses in each study programme
MATCH (p:StudyProgram)-[:HAS_COURSE]->(c:StudyCourse)
RETURN
    p.title AS Programme,
    c.title AS Course,
    c.credit_points AS Credits
ORDER BY Programme, Course;

// Query 2 - Number of courses per programme
MATCH (p:StudyProgram)-[:HAS_COURSE]->(c:StudyCourse)
RETURN
    p.title AS Programme,
    count(c) AS NumberOfCourses
ORDER BY NumberOfCourses DESC;

// Query 3 - Topics of Knowledge Management Systems
MATCH (c:StudyCourse)-[:HAS_TOPIC]->(t:CourseTopic)
WHERE c.title = 'Knowledge Management Systems'
RETURN
    c.title AS Course,
    t.ordinal AS TopicNumber,
    t.title AS Topic
ORDER BY t.ordinal;

// Query 4 - Learning outcomes
MATCH (c:StudyCourse)-[:HAS_OUTCOME]->(o:LearningOutcome)
RETURN
    c.title AS Course,
    o.ordinal AS OutcomeNumber,
    o.text AS LearningOutcome
ORDER BY Course, OutcomeNumber
LIMIT 30;

// Query 5 - Courses with the most topics
MATCH (c:StudyCourse)-[:HAS_TOPIC]->(t:CourseTopic)
RETURN
    c.title AS Course,
    count(t) AS NumberOfTopics
ORDER BY NumberOfTopics DESC
LIMIT 10;
