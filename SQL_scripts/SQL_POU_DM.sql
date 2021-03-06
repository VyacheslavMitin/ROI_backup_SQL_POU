/*
СКРИПТ БЕКАПА
BACKUP DATABASE [uchastok] TO  DISK = @pathName WITH NOFORMAT, INIT,  NAME = N'uchastok-Полная База данных Резервное копирование', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
Надо разобраться как это подключается к правильному серверу,
скорее всего локалхост по умолчанию и без паролей,
но это слишком дыряво для майкрософта
*/
/*
BACKUP DATABASE [kxc] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Backup\KXC_UL_15.05.2017.bak' WITH NOFORMAT, INIT,  NAME = N'kxc-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'kxc' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'kxc' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''kxc'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Backup\KXC_UL_15.05.2017.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO
*/

/*
BACKUP DATABASE [uchastok] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Backup\POU_DM_01.06.2017.bak' WITH NOFORMAT, NOINIT,  NAME = N'uchastok-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

*/

DECLARE @pathName NVARCHAR(512)
SET @pathName = 'C:\POU_SQL_Backup\+TEMP\POU_DM_' + Convert(varchar(8), GETDATE(), 112) + '.bak'
BACKUP DATABASE [uchastok] TO  DISK = @pathName WITH NOFORMAT, INIT,  NAME = N'uchastok-Полная База данных Резервное копирование', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO