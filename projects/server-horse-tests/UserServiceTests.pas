unit UserServiceTests;

interface

uses
  DUnitX.TestFramework,
  uClienteService;

type
  [TestFixture]
  TUserServiceTests = class
  public
    [Test]
    procedure Should_Create_Service_Instance;
  end;

implementation

procedure TUserServiceTests.Should_Create_Service_Instance;
var
  Service: TClienteService;
begin
  Service := TClienteService.Create;
  try
    Assert.IsNotNull(Service);
  finally
    Service.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TUserServiceTests);

end.

