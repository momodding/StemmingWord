program stemming;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  fpcgi, sysutils, fastplaz_handler, common, main, routes, stemtest_controller;

{$R *.res}

begin
  Application.Title:='Stemming';
  Application.Email := string( Config.GetValue(_SYSTEM_WEBMASTER_EMAIL,'webmaster@' + GetEnvironmentVariable('SERVER_NAME')));
  Application.DefaultModuleName := string( Config.GetValue(_SYSTEM_MODULE_DEFAULT, 'main'));
  Application.ModuleVariable := string( Config.GetValue(_SYSTEM_MODULE_VARIABLE, 'mod'));
  Application.AllowDefaultModule := True;
  Application.RedirectOnErrorURL := string( Config.GetValue(_SYSTEM_ERROR_URL, '/'));
  Application.RedirectOnError:= Config.GetValue( _SYSTEM_ERROR_REDIRECT, false);

  Application.OnGetModule := @FastPlasAppandler.OnGetModule;
  Application.PreferModuleName := True;

  Application.Initialize;
  Application.Run;
end.
