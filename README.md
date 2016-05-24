# Fast-Learn
NIIT MMS Qtr 6 Project(An E-Learn Solution)


Fast Learn Inc. is a distance-learning institute that was founded by Samuel Rogers 10 years ago. Fast Learn is one of the most established distance-learning institutes in the United States with its head office located in New York and several branches located around the world.
The annual turnover of the institute is over $3 million. Fast Learn is known for its excellence in education, attracting thousands of student from various countries. 


DATABASE NAME:  FastLearnDb

NUMBER OF TABLES: 9

TABLE NAMES:  
⦁	Courses
⦁	Faculty
⦁	FacultyCourse
⦁	StudentCourse
⦁	Student
⦁	Message
⦁	Query
⦁	Feedback
⦁	Materials

This project is an E-Learn Website, with all features working perfectly. 
To make it work, you would have to edit the connection string in the web-config file, and attach the db to your sql server:


<!--connection strings-->
   <connectionStrings>
    <remove name="LocalSqlServer"></remove>
    <add name="FastLearnCon" connectionString="Data Source=yourservername; Initial Catalog=FastLearnDb;Integrated Security = true;" />
    <add name="LocalSqlServer" connectionString="Data Source=yourservername; Initial Catalog=FastLearnDb;Integrated Security = SSPI;"/>
  </connectionStrings>
  
