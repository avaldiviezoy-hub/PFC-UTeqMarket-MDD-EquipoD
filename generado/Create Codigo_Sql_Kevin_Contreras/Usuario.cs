// File:    Usuario.cs
// Author:  Game over
// Created: domingo, 19 de julio de 2026 1:08:54
// Purpose: Definition of Class Usuario

using System;

public class Usuario
{
   private long idUsuario;
   private string nombreUsuario;
   private string correoUsuario;
   private string contrasenaHashUsuario;
   private string rolUsuario;
   private bool activoUsuario;
   private string telefonoUsuario;
   private bool correoConfirmacion;
   private string tokenVerificacionUsuario;
   private DateTime expiracionTokenUsuario;
   private DateTime fechaRegistroUsuario;

   public Usuario registrarUsuario()
   {
      throw new NotImplementedException();
   }

   public bool verificarCorreoUsuario()
   {
      throw new NotImplementedException();
   }

   public bool iniciarSesionUsuario()
   {
      throw new NotImplementedException();
   }

   public void cerrarSesionUsuario()
   {
      throw new NotImplementedException();
   }

   public bool validarClaveUsuario()
   {
      throw new NotImplementedException();
   }

   public bool actualizarPerfilUsuario()
   {
      throw new NotImplementedException();
   }

}
