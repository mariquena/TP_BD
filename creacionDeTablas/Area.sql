CREATE TABLE Area(
	numeroArea int PRIMARY KEY identity NOT NULL,
	nombreArea nvarchar(30) UNIQUE NOT NULL,
	numeroNivel int NOT NULL,
	CONSTRAINT fk_nroNivel FOREIGN KEY(numeroNivel) REFERENCES NivelSeguridad(numeroNivel),
	CONSTRAINT nombreAreaVacio CHECK (nombreArea != '')
)