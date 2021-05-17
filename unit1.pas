unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, base64;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    function Crypt(const aText: string): string;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  s: string;
begin
  memo1.Lines.Clear;
  s := 'abracadabra';
  memo1.Lines.add(s);

  s := Crypt(s);
  s:= encodestringbase64(s);
  memo1.Lines.add(s);
  s:= decodestringbase64(s);
  s := Crypt(s); // abracadabra
  memo1.Lines.add(s);

end;

function TForms1.Crypt(const aText: string): string;
const
  PWD = 'http://forum.lazarus.freepascal.org/index.php/topic,33013.msg213192.html#msg213192';
var
  i, len: integer;
begin
  len := Length(aText);
  if len > Length(PWD) then
    len := Length(PWD);
  SetLength(Result, len);
  for i := 1 to len do
    Result[i] := Chr(Ord(aText[i]) xor Ord(PWD[i]));
end;


end.

