unit ClienteServiceValidationTests;

interface

uses
  DUnitX.TestFramework,
  uClienteService,
  uClienteModel, System.SysUtils;

type
  [TestFixture]
  TClienteServiceValidationTests = class
  private
    FService: TClienteService;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure Should_Not_Raise_Exception_For_Valid_Client;

    [Test]
    procedure Should_Raise_Exception_When_Name_Is_Empty;

    [Test]
    procedure Should_Raise_Exception_When_Email_Is_Invalid;
  end;

implementation

procedure TClienteServiceValidationTests.Setup;
begin
  FService := TClienteService.Create;
end;

procedure TClienteServiceValidationTests.TearDown;
begin
  FService.Free;
end;

procedure TClienteServiceValidationTests.Should_Not_Raise_Exception_For_Valid_Client;
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  try
    Cliente.Nome := 'Oscar';
    Cliente.Email := 'oscar@email.com';

    Assert.WillNotRaiseAny(
      procedure
      begin
        FService.ValidateCliente(Cliente);
      end
    );
  finally
    Cliente.Free;
  end;
end;

procedure TClienteServiceValidationTests.Should_Raise_Exception_When_Name_Is_Empty;
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  try
    Cliente.Nome := '';
    Cliente.Email := 'oscar@email.com';

    Assert.WillRaise(
      procedure
      begin
        FService.ValidateCliente(Cliente);
      end,
      Exception
    );
  finally
    Cliente.Free;
  end;
end;

procedure TClienteServiceValidationTests.Should_Raise_Exception_When_Email_Is_Invalid;
var
  Cliente: TCliente;
begin
  Cliente := TCliente.Create;
  try
    Cliente.Nome := 'Oscar';
    Cliente.Email := 'invalid-email';

    Assert.WillRaise(
      procedure
      begin
        FService.ValidateCliente(Cliente);
      end,
      Exception
    );
  finally
    Cliente.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TClienteServiceValidationTests);

end.

