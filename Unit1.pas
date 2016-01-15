unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Sockets, StdCtrls, ScktComp;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ListBox1: TListBox;
    ClientSocket1: TClientSocket;
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure ClientSocket1Connecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ClientSocket1.Active then
  begin
  ClientSocket1.Close;
  Exit;
  end;
  try
  ClientSocket1.Host:=Edit1.Text;
  ClientSocket1.Port:=StrToInt(Edit2.Text);
  ClientSocket1.Open;
  except
  end;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  showmessage('���������� �����������');
  ListBox1.Items.Add('>Hello, i want to play with you in the game');
  Socket.SendText('Hello, i want to play with you in the game');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ClientSocket1.Socket.SendText(Edit3.Text);
  ListBox1.Items.Add('>'+Edit3.Text);
end;

procedure TForm1.ClientSocket1Connecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  showmessage('�������� ����������');
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  showmessage('���������� ���������');
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ListBox1.Items.Add('<'+Socket.ReceiveText);
end;

end.
