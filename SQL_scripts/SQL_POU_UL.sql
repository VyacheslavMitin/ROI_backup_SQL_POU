/*
СКРИПТ БЕКАПА

Надо разобраться как это подключается к правильному серверу,
скорее всего локалхост по умолчанию и без паролей,
но это слишком дыряво для майкрософта
*/

DECLARE @pathName NVARCHAR(512)
SET @pathName = 'C:\BACKUP\POU-SQL\+TEMP\POU_UL_' + Convert(varchar(8), GETDATE(), 112) + '.bak'
BACKUP DATABASE [POU-UL] TO  DISK = @pathName WITH NOFORMAT, INIT,  NAME = N'POU-UL-Полная База данных Резервное копирование', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
