/*
GRANT ROLE:

1. Create a new database role, call it something like db_view_schema.

2. Add the users/groups into this role.

3. Grant VIEW DEFINITION to the desired schema's contained in the database to this role.

The users in this role will have the ability to see the schema of tables, functions, and so forth as well with this method.

You can alternately grant VIEW DEFINITION to each procedure individually, but that can become a bit cumbersome.

*/  

/*First method*/
EXEC sp_helptext 'dbo.ekesbe'; 


/*Second method*/
SELECT OBJECT_DEFINITION (OBJECT_ID('dbo.ekesbe')) AS ObjectDefinition;


/*Third method*/
SELECT OBJECT_NAME(referencing_id) AS referencing_entity_name,   
    o.type_desc AS referencing_desciption,   
    COALESCE(COL_NAME(referencing_id, referencing_minor_id), '(n/a)') AS referencing_minor_id,   
    referencing_class_desc, referenced_class_desc,  
    referenced_server_name, referenced_database_name, referenced_schema_name,  
    referenced_entity_name,   
    COALESCE(COL_NAME(referenced_id, referenced_minor_id), '(n/a)') AS referenced_column_name,  
    is_caller_dependent, is_ambiguous  
FROM sys.sql_expression_dependencies AS sed  
INNER JOIN sys.objects AS o ON sed.referencing_id = o.object_id  
WHERE referencing_id = OBJECT_ID(N'dbo.ekesbe');  


/*Fourth method*/
SELECT definition, uses_ansi_nulls, uses_quoted_identifier, is_schema_bound  
FROM sys.sql_modules  
WHERE object_id = OBJECT_ID('dbo.ekesbe');   
GO