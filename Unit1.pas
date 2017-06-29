unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

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
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
    procedure ReRandom();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fi: integer;

implementation

{$R *.dfm}

procedure Tform1.ReRandom();
begin
  Randomize;
  fi := SpinEdit1.Value + Random(SpinEdit2.Value-spinedit1.Value);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
  i2: integer;
  i3: integer;
  i4: integer;
  mult: TArray<string>;
begin
ListBox2.Items.Clear;
i:=0; i2:=0; i3:=0; i4:=0;

 for I := 1 to SpinEdit3.Value do
  Begin
    ReRandom();
    for I2 := 0 to memo1.Lines.Count-1 do
      begin
      if checkbox1.Checked then
      begin
       mult:=memo1.Lines[i2].Split([',']);
       //showmessage(inttostr(length(mult)));
       for I4 := 0 to length(mult) do
       begin
         try
         if strtoint(mult[i4])=fi
         then ReRandom();
         except
           // error in mult
         end;
       end;
      end else begin
        try
        if strtoint(memo1.Lines[i2])=fi
        then ReRandom();
        except
        //error
        end;
      end;
      end;
      for I3 := 0 to ListBox2.items.Count-1 do
      begin
        if strtoint(ListBox2.items[i3])=fi
        then ReRandom();
      end;
    ListBox2.Items.Add(IntToStr( fi ));
  End;
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
