#####################################################
# User and login creation script. 
# dmmaxwell - June 2014
#
# My first attempt at using variables in PowerShell.
#####################################################

#Set the variables that will be edited before running.
$uname = "pstestlogin"
$db = "tempdb"
$server = "oemis5wk112"
$pw = "PSTest123."

#Create the T-SQL command required.
$query = "
CREATE LOGIN [$uname] WITH 
    PASSWORD = '$pw', 
    CHECK_EXPIRATION = OFF, 
    CHECK_POLICY = ON,
    DEFAULT_DATABASE = [$db]
GO

USE [$db];
GO

CREATE USER [$user]
FOR LOGIN [$user];
GO

"
#Then, run the command.
Invoke-Sqlcmd -ServerInstance $server -Query $query