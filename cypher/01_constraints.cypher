// Constraints for the Knowledge Graph

CREATE CONSTRAINT study_field_id IF NOT EXISTS
FOR (n:StudyField)
REQUIRE n.study_field_id IS UNIQUE;

CREATE CONSTRAINT study_program_id IF NOT EXISTS
FOR (n:StudyProgram)
REQUIRE n.program_id IS UNIQUE;

CREATE CONSTRAINT study_course_id IF NOT EXISTS
FOR (n:StudyCourse)
REQUIRE n.course_id IS UNIQUE;

CREATE CONSTRAINT course_topic_id IF NOT EXISTS
FOR (n:CourseTopic)
REQUIRE n.topic_id IS UNIQUE;

CREATE CONSTRAINT learning_outcome_id IF NOT EXISTS
FOR (n:LearningOutcome)
REQUIRE n.outcome_id IS UNIQUE;
