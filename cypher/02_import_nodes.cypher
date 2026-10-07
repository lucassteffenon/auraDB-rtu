// Import Study Fields
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/nodes/nodes_study_fields.csv'
AS row
MERGE (f:StudyField {study_field_id: row.study_field_id})
SET f.name = row.name;

// Import Study Programs
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/nodes/nodes_study_programs.csv'
AS row
MERGE (p:StudyProgram {program_id: row.program_id})
SET
    p.title = row.title,
    p.education_classification_code = row.education_classification_code,
    p.level_and_type = row.level_and_type,
    p.study_mode = row.study_mode,
    p.languages = row.languages,
    p.accreditation = row.accreditation,
    p.credit_points = toFloat(row.credit_points),
    p.duration = row.duration,
    p.abstract = row.abstract,
    p.aims = row.aims,
    p.tasks = row.tasks,
    p.prerequisites = row.prerequisites,
    p.future_employment = row.future_employment,
    p.continue_studies = row.continue_studies,
    p.source_url = row.source_url;

// Import Study Courses
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/nodes/nodes_study_courses.csv'
AS row
MERGE (c:StudyCourse {course_id: row.course_id})
SET
    c.title = row.title,
    c.status_in_programme = row.status_in_programme,
    c.credit_points = toFloat(row.credit_points),
    c.languages = row.languages,
    c.abstract = row.abstract,
    c.aims = row.aims,
    c.independent_study = row.independent_study,
    c.recommended_literature = row.recommended_literature,
    c.prerequisites = row.prerequisites,
    c.detail_status = row.detail_status,
    c.source_url = row.source_url;

// Import Course Topics
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/nodes/nodes_course_topics.csv'
AS row
MERGE (t:CourseTopic {topic_id: row.topic_id})
SET
    t.title = row.title,
    t.ordinal = toInteger(row.ordinal),
    t.intramural_contact_hours = toInteger(row.intramural_contact_hours),
    t.intramural_independent_hours = toInteger(row.intramural_independent_hours),
    t.extramural_contact_hours = toInteger(row.extramural_contact_hours),
    t.extramural_independent_hours = toInteger(row.extramural_independent_hours);

// Import Learning Outcomes
LOAD CSV WITH HEADERS FROM
'https://raw.githubusercontent.com/ArithaRTU/KMS_Dataset/main/nodes/nodes_learning_outcomes.csv'
AS row
MERGE (o:LearningOutcome {outcome_id: row.outcome_id})
SET
    o.text = row.text,
    o.scope = row.scope,
    o.owner_id = row.owner_id,
    o.ordinal = toInteger(row.ordinal);
