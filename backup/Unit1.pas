unit Unit1;

interface

uses
  SysUtils, Variants, Classes, Graphics, strutils,
  Controls, Forms, Dialogs, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    ListBox2: TListBox;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Button1: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
    function ReRandom():integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function Tform1.ReRandom():integer;
begin
  Sleep(50);
  Randomize;
  Result := SpinEdit1.Value + Random(SpinEdit2.Value-spinedit1.Value);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  i2: integer;
  i3: integer;
  fi: integer;
  mult: TStringList;
  fis: TStringList;
begin

ListBox2.Items.Clear;
i:=0; i2:=0; i3:=0;

if ( Pos(',', Memo1.Text) <> 0 )
then
begin

// Creating array of exluded
mult:= TStringList.Create();

// Splitt exluded list and writ to array
mult.Delimiter:=',';
mult.DelimitedText:=memo1.Text;

// Clear values in array
for I := 0 to mult.Count-1 do
 Begin
   mult[I]:=ReplaceStr(TRim(mult[I]), ',', '');
 end;

// Start to searching for numbers
 for I := 1 to SpinEdit3.Value do
  Begin
    repeat
        fi := ReRandom();
        i2 := mult.IndexOf( IntToStr(fi) );
        i3 := fis.IndexOf( IntToStr(fi) );
        fis.Add(IntToStr(fi));
    until ( i2 = -1 ) and ( i3 = -1 );
    ListBox2.Items.Add(IntToStr( fi ));
  End;

end else begin
  // if no commas in left windows then just randomize
  for I := 1 to SpinEdit3.Value do
  Begin
    fi := ReRandom();
    ListBox2.Items.Add(IntToStr( fi ));
  End;
  end

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if OpenDialog1.Execute then memo1.Lines.LoadFromFile(OpenDialog1.FileName);

end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
case Key of
'0'..'9',',',#8,#13:;
else Key:= Char(0);
end;
end;

end.
