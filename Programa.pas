unit Programa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var acha2, acha1: string;
  var arq1, arq2 : string;
  var Dir_orig, Dir_dest: String;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Dir_orig:= 'C:\Arquivos\bravos\xml\1.1\';
  ForceDirectories(Dir_orig);
  arq1 := (edit1.Text+'-nfe.xml');
  arq2 := (edit1.Text+'-can.xml');
  acha1 := FileSearch(arq1 , Dir_orig);
  acha2 := FileSearch(arq2 , Dir_orig);
  if edit1.Text = '' Then Label2.Caption := 'Nome do arquivo em branco.'
  else If acha1 = '' Then Label2.Caption := 'Arquivo n�o encontrado.'
  Else Label2.Caption := 'Arquivo encontrado!';
  label3.Caption := acha1;
  label4.Caption := acha2;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Dir_dest:= 'C:\XML\';
  if CopyFile(Pchar(Dir_orig + arq1),
    PChar(Dir_dest + arq1), True) then
     ShowMessage('1� Arquivo copiado com sucesso')
  else
     ShowMessage('#Aten��o# - Problema ao copiar o arquivo.');
  if label4.Caption <> '' then
  begin
    if CopyFile(Pchar(Dir_orig + arq2),
    PChar(Dir_dest + arq2), True)
     then
     ShowMessage('2� Arquivo copiado com sucesso')
    else
     ShowMessage('#Aten��o# - Problema ao copiar o arquivo.');
  end
  else
end;

end.


