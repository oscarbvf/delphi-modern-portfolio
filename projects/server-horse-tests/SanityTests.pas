unit SanityTests;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TSanityTests = class
  public
    [Test]
    procedure BasicTest;
  end;

implementation

procedure TSanityTests.BasicTest;
begin
  Assert.AreEqual(4, 2 + 2);
end;

initialization
  TDUnitX.RegisterTestFixture(TSanityTests);

end.

