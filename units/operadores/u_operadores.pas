unit u_operadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Menus, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Dialogs, CRGrid, MemDS, VirtualTable, Uni;

type
  TPagOperador = class(TForm)
    Panel1: TPanel;
    PopupOperador: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    vtb_operadores: TVirtualTable;
    CRDBGrid1: TCRDBGrid;
    ds_operadores: TDataSource;

    procedure Detalhar1Click(Sender: TObject);
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagOperador: TPagOperador;

implementation

{$R *.dfm}

uses u_infoOperador, u_dm1;

procedure TPagOperador.Detalhar1Click(Sender: TObject);
var
  ope_codigo: Integer;

begin
  FormOperador.FrameButtons.ModoEdit.Text := 'V';
  FormOperador.Show;
end;

procedure TPagOperador.FormShow(Sender: TObject);
var
  q1: TUniQuery;

begin
  try
    q1 := TUniQuery.Create(q1);
    q1.Connection := dm1.con1;

    q1.SQL.Text := 'select * from tb_operadores';

    q1.Open;
    q1.First;
    while not q1.Eof do
    begin
      vtb_operadores.Append;
      vtb_operadores['ope_codigo'] := q1.FieldByName('ope_codigo').Value;
      vtb_operadores['ope_nome'] := q1.FieldByName('ope_nome').Value;
      q1.Next;
    end;

  finally
    q1.Close;
    FreeAndNil(q1);
  end;
end;

procedure TPagOperador.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  FormOperador.FrameButtons.ModoEdit.Text := 'N';
  FormOperador.Show;
end;

end.
