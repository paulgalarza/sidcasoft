use laravel

DELIMITER $$
CREATE TRIGGER TR_AsignaProyecto AFTER INSERT ON proyecto FOR EACH ROW
begin
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioRAP;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioRCP;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioAnalista;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioArquitecto;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioDesarrollador;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioTester;
end$$

DELIMITER $$
CREATE TRIGGER TR_AsignaProyecto_Actualiza AFTER UPDATE ON proyecto FOR EACH ROW
begin
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioRAP;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioRCP;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioAnalista;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioArquitecto;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioDesarrollador;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioTester;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioRAP;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioRCP;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioAnalista;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioArquitecto;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioDesarrollador;
    Update usuarios set ProyectoAsignado = NEW.idProyecto where idUsuario = NEW.usuarioTester;
end

DELIMITER $$
CREATE TRIGGER TR_AsignaProyecto_Elimina AFTER DELETE ON proyecto FOR EACH ROW
begin
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioRAP;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioRCP;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioAnalista;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioArquitecto;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioDesarrollador;
    Update usuarios set ProyectoAsignado = NULL where idUsuario = OLD.usuarioTester;
end