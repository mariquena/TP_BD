BEGIN TRANSACTION
	DECLARE @EmpleadoID int
BEGIN TRY
	--Insertamos el Empleado.
	INSERT INTO [dbo].[Empleado]
           ([nombreEmpleado]
           ,[apellidoEmpleado]
           ,[funcionEmpleado]
           ,[contrasena]
           ,[huellaDactilar])
     VALUES ('nombreEmpleado','apellidoEmpleado','funcionEmpleado','contrasena','huellaDactilar');

	 SET @EmpleadoID = SCOPE_IDENTITY();

	 -- Insertamos como profesional.
	INSERT INTO [dbo].[EmpleadoProfesional]
           ([numeroEmpleado]
           ,[contratacionProfesional]
           ,[numeroEspecialidad])
     VALUES(@EmpleadoID,'contratacionProfesional','numeroEspecialidad');

	--Insertamos como contratado.
	INSERT INTO [dbo].[EmpleadoContratado]
           ([numeroEmpleado])
    VALUES(@EmpleadoID);

	-- Se le asigna un area donde trabajar�
	INSERT INTO [dbo].[DondeTrabajaC]
           ([numeroEmpleado]
           ,[fechaInicioTrabajo]
           ,[fechaFinTrabajo]
           ,[numeroArea]
           ,[descripcionTrabajo])
     VALUES
           (@EmpleadoID,'fechaInicioTrabajo','fechaFinTrabajo','numeroArea','descripcionTrabajo')

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
    ROLLBACK TRANSACTION;
	DECLARE @MsjError VARCHAR(200);
	SET @MsjError = ERROR_MESSAGE();
    RAISERROR(@MsjError,18,1);
END CATCH
