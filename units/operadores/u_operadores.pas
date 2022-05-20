unit u_operadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Menus, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Dialogs, CRGrid, MemDS, VirtualTable, Uni,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, DBAccess, UniProvider, PostgreSQLUniProvider, fr_estilo, fm_busca,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TPagOperador = class(TForm)
    PopupOperador: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    gridOperadoresDBTableView1: TcxGridDBTableView;
    gridOperadoresLevel1: TcxGridLevel;
    gridOperadores: TcxGrid;
    tb_operadores: TUniTable;
    ds_operadores: TDataSource;
    ope_codigo: TcxGridDBColumn;
    ope_nome: TcxGridDBColumn;
    FrameGrid1: TFrameGrid;
    FrameBusca1: TFrameBusca;
    N2: TMenuItem;

    procedure Detalhar1Click(Sender: TObject);
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N2AlterarregistroatualF31Click(Sender: TObject);
    procedure N3ExcluirF41Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagOperador: TPagOperador;

implementation

{$R *.dfm}

uses u_infoOperador, u_dm1, u_controleForm;

procedure TPagOperador.Detalhar1Click(Sender: TObject);
var
  ope_codigo: Integer;
begin

  if not tb_operadores.Active then exit;
  if tb_operadores.RecordCount = 0 then exit;

  FormOperador.FrameButtons.ModoEdit.Text := 'V';
  FormOperador.ShowModal;
end;

procedure TPagOperador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    Detalhar1Click(Sender)
  else if Key = VK_F2 then
    N1Incluirnovoregistro1Click(Sender)
  else if Key = VK_F3 then
    N2AlterarregistroatualF31Click(Sender)
  else if Key = VK_F4 then
    N3ExcluirF41Click(Sender);
end;

procedure TPagOperador.FormShow(Sender: TObject);
begin
//  dm1.con1.Close;

  tb_operadores.Connection := dm1.con1;
  tb_operadores.TableName := 'tb_operadores';

  ds_operadores.DataSet := tb_operadores;
  tb_operadores.Active := True;

//  dm1.con1.Open;
end;

procedure TPagOperador.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  FormOperador.FrameButtons.ModoEdit.Text := 'N';
  FormOperador.ShowModal;
end;

procedure TPagOperador.N2AlterarregistroatualF31Click(Sender: TObject);
begin
  if not tb_operadores.Active then exit;
  if tb_operadores.RecordCount = 0 then exit;

  FormOperador.FrameButtons.ModoEdit.Text := 'A';
  FormOperador.ShowModal;
end;

procedure TPagOperador.N3ExcluirF41Click(Sender: TObject);
var
  q1: TUniQuery;
  index, codigo: Integer;

begin
  if not tb_operadores.Active then exit;
  if tb_operadores.RecordCount = 0 then exit;

  if Confirma('Confirmar exclusão de operador?' + #13 + 'Esta operação será irreversível!') then
  begin
    try
      q1 := TUniQuery.Create(q1);
      q1.Connection := dm1.con1;

      index := gridOperadoresDBTableView1.DataController.GetSelectedRowIndex(0);
      codigo := gridOperadoresDBTableView1.ViewData.Records[index].Values[0];

      q1.SQL.Text := 'delete from tb_operadores where ope_codigo = :codigo';
      q1.ParamByName('codigo').Value := codigo;

      try
        q1.ExecSQL;
        Mensagem('Operador excluído com sucesso!');
        gridOperadoresDBTableView1.DataController.RefreshExternalData;
      except on e:exception do
        Erro('Erro!' + #13 + e.Message);
      end;
    finally
      q1.Close;
      FreeAndNil(q1);
    end;
  end;
end;

end.
