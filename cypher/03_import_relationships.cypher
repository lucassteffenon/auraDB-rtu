// Study Program -> Study Field
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/edges/program+study_field.csv'
AS row
MATCH (p:StudyProgram {program_id: row.program_id})
MATCH (f:StudyField {study_field_id: row.study_field_id})
MERGE (p)-[:BELONGS_TO_FIELD]->(f);

// Study Program -> Study Course
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/edges/program+course.csv'
AS row
MATCH (p:StudyProgram {program_id: row.program_id})
MATCH (c:StudyCourse {course_id: row.course_id})
MERGE (p)-[r:HAS_COURSE]->(c)
SET
    r.credit_points = toFloat(row.credit_points),
    r.section_code = row.section_code,
    r.section_name = row.section_name,
    r.subsection_name = row.subsection_name;

// Study Course -> Course Topic
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/edges/course+topic.csv'
AS row
MATCH (c:StudyCourse {course_id: row.course_id})
MATCH (t:CourseTopic {topic_id: row.topic_id})
MERGE (c)-[:HAS_TOPIC]->(t);

// Study Course -> Learning Outcome
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/edges/course+learning_outcome.csv'
AS row
MATCH (c:StudyCourse {course_id: row.course_id})
MATCH (o:LearningOutcome {outcome_id: row.outcome_id})
MERGE (c)-[:HAS_OUTCOME]->(o);
