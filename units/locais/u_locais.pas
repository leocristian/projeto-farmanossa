unit u_locais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MemDS, DBAccess, Uni, fr_estilo, fm_busca, u_dm1;

type
  TPagLocais = class(TForm)
    PopupLocais: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    N1Incluirnovoregistro1: TMenuItem;
    N2AlterarregistroatualF31: TMenuItem;
    N3ExcluirF41: TMenuItem;
    gridLocaisDBTableView1: TcxGridDBTableView;
    gridLocaisLevel1: TcxGridLevel;
    gridLocais: TcxGrid;
    ds_locais: TDataSource;
    loc_codigo: TcxGridDBColumn;
    loc_descricao: TcxGridDBColumn;
    loc_status: TcxGridDBColumn;
    FrameGrid1: TFrameGrid;
    FrameBusca1: TFrameBusca;
    qCad: TUniQuery;
    N2: TMenuItem;
    procedure N1Incluirnovoregistro1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Detalhar1Click(Sender: TObject);
    procedure N2AlterarregistroatualF31Click(Sender: TObject);
    procedure N3ExcluirF41Click(Sender: TObject);
    procedure FrameBusca1BuscaSelectChange(Sender: TObject);
    procedure FrameBusca1BuscaEditClick(Sender: TObject);
    procedure FrameBusca1BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrameBusca1SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagLocais: TPagLocais;

implementation

{$R *.dfm}

uses u_infoLocal, u_controleForm;

procedure TPagLocais.Detalhar1Click(Sender: TObject);
begin
  if FormLocal = nil then FormLocal := TFormLocal.Create(Application);

  if not qCad.Active then exit;
  if qCad.RecordCount = 0 then exit;

  FormLocal.FrameButtons.ModoEdit.Text := 'V';
  FormLocal.edc_cod.Text := IntToStr(qCad.FieldByName('loc_codigo').AsInteger);
  FormLocal.ShowModal;
end;

procedure TPagLocais.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TPagLocais.FormShow(Sender: TObject);
begin
  qCad.Close;
  qCad.SQL.Text := 'select * from tb_locais_estoque';
  qCad.Open;
end;

procedure TPagLocais.FrameBusca1BitBtn1Click(Sender: TObject);
var
  strBusca, xWhere: String;

begin

  strBusca := FrameBusca1.BuscaEdit.Text;

  xWhere := '';

  if (FrameBusca1.BuscaSelect.Text = 'CÓDIGO') and (FrameBusca1.BuscaEdit.Text <> '') then
  begin
    xWhere := xWhere + ' and loc_codigo = ' + strBusca;
  end
  else if FrameBusca1.BuscaSelect.Text = 'DESCRIÇÃO' then
  begin
    xWhere := xWhere + ' and loc_descricao like ' + QuotedStr('%' + strBusca + '%');
  end;

  qCad.SQL.Clear;
  qCad.SQL.Text := 'select * from tb_locais_estoque where 1=1 '+xWhere;
  qCad.Open;

end;

procedure TPagLocais.FrameBusca1BuscaEditClick(Sender: TObject);
begin
  FrameBusca1.BuscaEdit.SetFocus;
end;

procedure TPagLocais.FrameBusca1BuscaSelectChange(Sender: TObject);
begin
  FrameBusca1.BuscaEdit.Clear;
  if FrameBusca1.BuscaSelect.Text = 'CÓDIGO' then
  begin
    FrameBusca1.BuscaEdit.NumbersOnly := True;
    FrameBusca1.BuscaEdit.MaxLength := 5;
  end
  else
  begin
    FrameBusca1.BuscaEdit.NumbersOnly := False;
    FrameBusca1.BuscaEdit.MaxLength := 50;
  end;

  FrameBusca1.BuscaEdit.SetFocus;
end;

procedure TPagLocais.FrameBusca1SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TPagLocais.N1Incluirnovoregistro1Click(Sender: TObject);
begin
  if FormLocal = nil then FormLocal := TFormLocal.Create(Application);

  FormLocal.FrameButtons.ModoEdit.Text := 'N';
  FormLocal.ShowModal;
  FrameBusca1BitBtn1Click(Sender);
end;

procedure TPagLocais.N2AlterarregistroatualF31Click(Sender: TObject);
begin
  if FormLocal = nil then FormLocal := TFormLocal.Create(Application);

  if not qCad.Active then exit;
  if qCad.RecordCount = 0 then exit;

  FormLocal.FrameButtons.ModoEdit.Text := 'A';
  FormLocal.edc_cod.Text := IntToStr(qCad.FieldByName('loc_codigo').AsInteger);
  FormLocal.ShowModal;
  FrameBusca1BitBtn1Click(Sender);
end;

procedure TPagLocais.N3ExcluirF41Click(Sender: TObject);
begin
  if not qCad.Active then exit;
  if qCad.RecordCount = 0 then exit;

  if Confirma('Confirmar exclusão de local de estoque?' + #13 + 'Esta operação será irreversível!') then
  begin

    try
      dm1.q1.SQL.Text := 'delete from tb_locais_estoque where loc_codigo = :codigo';
      dm1.q1.ParamByName('codigo').Value := qCad.FieldByName('loc_codigo').Value;

      try
        dm1.q1.ExecSQL;
        Mensagem('Local de estoque excluído com sucesso!');
        FrameBusca1BitBtn1Click(Sender);
      except
        on e:exception do
        begin
          Erro('Erro!' + #13 + e.Message);
        end;
      end;
    finally

    end;
  end;
end;

end.
